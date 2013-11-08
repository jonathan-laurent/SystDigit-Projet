(* SIMPLIFICATION PASSES *)

(*
	Order of simplifications :
	- cascade slices and selects
	- simplify stupid things (a xor 0 = a, a and 0 = 0, etc.)
	  transform k = SLICE i i var into k = SELECT i var
	- transform k = SELECT 0 var into k = var when var is also one bit
	- look for variables with same equation, put the second to identity
	- eliminate k' for each equation k' = k
	- topological sort

	TODO : eliminate unused variables. problem : they are hard to identify
*)

open Netlist_ast

module Sset = Set.Make(String)
module Smap = Map.Make(String)

(* Simplify cascade slicing/selecting *)
let cascade_slices p =
	let usefull = ref false in
	let slices = Hashtbl.create 42 in
	let eqs_new = List.map
		(fun (n, eq) -> (n, match eq with
			| Eslice(u, v, Avar(x)) ->
				let dec, nx =
					if Hashtbl.mem slices x then begin
						Hashtbl.find slices x
					end else 
						 (0, x)
				in
				Hashtbl.add slices n (u + dec, nx);
				if nx <> x || dec <> 0 then usefull := true;
				Eslice(u + dec, v + dec, Avar(nx))
			| Eselect(u, Avar(x)) ->
				begin try
					let ku, kx = Hashtbl.find slices x in
					usefull := true;
					Eselect(ku + u, Avar(kx))
				with
					Not_found -> Eselect(u, Avar(x))
				end
			| _ -> eq))
		p.p_eqs in
	{
		p_eqs = eqs_new;
		p_inputs = p.p_inputs;
		p_outputs = p.p_outputs;
		p_vars = p.p_vars;
	}, !usefull

(* Simplifies some trivial arithmetic possibilites :
	a and 1 = a
	a and 0 = 0
	a or 1 = 1
	a or 0 = a
	a xor 0 = a
	slice i i x = select i x
	concat const const = const.const
	slice i j const = const.[i..j]
	select i const = const.[i]
*)
let arith_simplify p =
	let usefull = ref false in
	{
		p_eqs = List.map
			(fun (n, eq) ->
			let useless = ref false in
			let neq = match eq with
			| Ebinop(Or, Aconst(VBit(false)), x) -> Earg(x)
			| Ebinop(Or, Aconst(VBit(true)), x) -> Earg(Aconst(VBit(true)))
			| Ebinop(Or, x, Aconst(VBit(false))) -> Earg(x)
			| Ebinop(Or, x, Aconst(VBit(true))) -> Earg(Aconst(VBit(true)))

			| Ebinop(And, Aconst(VBit(false)), x) -> Earg(Aconst(VBit(false)))
			| Ebinop(And, Aconst(VBit(true)), x) -> Earg(x)
			| Ebinop(And, x, Aconst(VBit(false))) -> Earg(Aconst(VBit(false)))
			| Ebinop(And, x, Aconst(VBit(true))) -> Earg(x)

			| Ebinop(Xor, Aconst(VBit(false)), x) -> Earg(x)
			| Ebinop(Xor, x, Aconst(VBit(false))) -> Earg(x)

			| Eslice(i, j, k) when i = j -> Eselect(i, k)

			| Econcat(Aconst(a), Aconst(b)) ->
				let aa = match a with
					| VBit(a) -> [| a |]
					| VBitArray(a) -> a
				in
				let ba = match b with
					| VBit(a) -> [| a |]
					| VBitArray(a) -> a
				in
				Earg(Aconst(VBitArray(Array.append aa ba)))
			
			| Eslice(i, j, Aconst(VBitArray(a))) ->
				Earg(Aconst(VBitArray(Array.sub a i (j - i + 1))))
			
			| Eselect(i, Aconst(VBitArray(a))) ->
				Earg(Aconst(VBit(a.(i))))
			
			| _ ->  useless := true; eq in
			if not !useless then usefull := true;
			(n, neq))
			p.p_eqs;
		p_inputs = p.p_inputs;
		p_outputs = p.p_outputs;
		p_vars = p.p_vars;
	}, !usefull

(* if x is one bit, then :
	select 0 x = x
*)
let select_to_id p =
	let usefull = ref false in
	{
		p_eqs = List.map
			(fun (n, eq) -> match eq with
			| Eselect(0, Avar(id)) when
				Env.find id p.p_vars = TBit || Env.find id p.p_vars = TBitArray(1) ->
					usefull := true;
					(n, Earg(Avar(id)))
			| _ -> (n, eq))
			p.p_eqs;
		p_inputs = p.p_inputs;
		p_outputs = p.p_outputs;
		p_vars = p.p_vars;
	}, !usefull

(*
	If a = eqn(v1, v2, ...) and b = eqn(v1, v2, ...)   <- the same equation
	then say b = a
*)
let same_eq_simplify p =
	let usefull = ref false in
	let id_outputs =
		(List.fold_left (fun x k -> Sset.add k x) Sset.empty p.p_outputs) in
	let eq_map = Hashtbl.create 42 in
	List.iter
		(fun (n, eq) -> if Sset.mem n id_outputs then
			Hashtbl.add eq_map eq n)
		p.p_eqs;
	let simplify_eq (n, eq) =
		if Sset.mem n id_outputs then
			(n, eq)
		else if Hashtbl.mem eq_map eq then begin
			usefull := true;
			(n, Earg(Avar(Hashtbl.find eq_map eq)))
		end else begin
			Hashtbl.add eq_map eq n;
			(n, eq)
		end
	in
	let eq2 = List.map simplify_eq p.p_eqs in
	{
		p_eqs = eq2;
		p_inputs = p.p_inputs;
		p_outputs = p.p_outputs;
		p_vars = p.p_vars;
	}, !usefull


(*	Replace one specific variable by another argument in the arguments of all equations
	(possibly a constant, possibly another variable)
*)
let eliminate_var var rep p =
	let rep_arg = function
		| Avar(i) when i = var -> rep
		| k -> k
	in
	let rep_eqs = List.map
		(fun (n, eq) -> (n, match eq with
			| Earg(a) -> Earg(rep_arg a)
			| Ereg(i) when i = var ->
				begin match rep with
				| Avar(j) -> Ereg(j)
				| Aconst(k) -> Earg(Aconst(k))
				end
			| Ereg(j) -> Ereg(j)
			| Enot(a) -> Enot(rep_arg a)
			| Ebinop(o, a, b) -> Ebinop(o, rep_arg a, rep_arg b)
			| Emux(a, b, c) -> Emux(rep_arg a, rep_arg b, rep_arg c)
			| Erom(u, v, a) -> Erom(u, v, rep_arg a)
			| Eram(u, v, a, b, c, d) -> Eram(u, v, rep_arg a, rep_arg b, rep_arg c, rep_arg d)
			| Econcat(a, b) -> Econcat(rep_arg a, rep_arg b)
			| Eslice(u, v, a) -> Eslice(u, v, rep_arg a)
			| Eselect(u, a) -> Eselect(u, rep_arg a)
			))
		p.p_eqs in
	{
		p_eqs = List.fold_left
			(fun x (n, eq) ->
				if n = var then x else (n, eq)::x)
			[] rep_eqs;
		p_inputs = p.p_inputs;
		p_outputs = p.p_outputs;
		p_vars = Env.remove var p.p_vars;
	}

(* Remove all equations of type :
	a = b
	a = const
	(except if a is an output variable)
*)
let rec eliminate_id p =
	let id_outputs =
		(List.fold_left (fun x k -> Sset.add k x) Sset.empty p.p_outputs) in

	let rep =
		List.fold_left
			(fun x (n, eq) ->
				if x = None && (not (Sset.mem n id_outputs)) then
					match eq with
					| Earg(rarg) -> 
						Some(n, rarg)
					| _ -> None
				else
					x)
			None p.p_eqs in
	match rep with
	| None -> p, false
	| Some(n, rep) -> fst (eliminate_id (eliminate_var n rep p)), true

(* Eliminate dead variables *)
let eliminate_dead p =
	(p, false)

(* Topological sort *)
let topo_sort p =
	(Scheduler.schedule p, false)


(* Apply all the simplification passes,
	in the order given in the header of this file
*)
let rec simplify p =
	let steps = [
		topo_sort, "topo_sort";
		cascade_slices, "cascade_slices";
		arith_simplify, "arith_simplify";
		select_to_id, "select_to_id";
		same_eq_simplify, "same_eq_simplify"; 
		eliminate_id, "eliminate_id";
	] in
	let pp, use = List.fold_left
		(fun (x, u) (f, n) ->
			print_string n;
			let xx, uu = f x in 
			print_string (if uu then "*\n" else "\n");
			(xx, u || uu))
		(p, false) steps in
	if use then simplify pp else pp

