(* SIMPLIFICATION PASSES *)

(*
	Order of simplifications :
	- cascade slices and selects
	- simplify stupid things (a xor 0 = a, a and 0 = 0, etc.)
	  transform k = SLICE i i var into k = SELECT i var
	- transform k = SELECT 0 var into k = var when var is also one bit
	- look for variables with same equation, put the second to identity
	- eliminate k' for each equation k' = k
	- eliminate dead equations

	These simplifications are run on a topologically sorted list of equations (see main.ml)
*)

open Netlist_ast

module Sset = Set.Make(String)

(* Simplify cascade slicing/selecting *)
let cascade_slices p =
	let slices = Hashtbl.create 42 in
	let eqs_new = List.map
		(fun (n, eq) -> (n, match eq with
			| Eslice(u, v, Avar(x)) ->
				let nu, nx =
					if Hashtbl.mem slices x then begin
						let ku, kx = Hashtbl.find slices x in
						(ku + u, kx)
					end else 
						 (u, x)
				in
				Hashtbl.add slices n (nu, nx);
				Eslice(nu, v, Avar(nx))
			| Eselect(u, Avar(x)) ->
				begin try
					let ku, kx = Hashtbl.find slices x in
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
	}

(* Simplifies some trivial arithmetic possibilites :
	a and 1 = a
	a and 0 = 0
	a or 1 = 1
	a or 0 = a
	a xor 0 = a
	slice i i x = select i x
*)
let arith_simplify p =
	{
		p_eqs = List.map
			(fun (n, eq) -> match eq with
			| Ebinop(Or, Aconst(VBit(false)), x) -> (n, Earg(x))
			| Ebinop(Or, Aconst(VBit(true)), x) -> (n, Earg(Aconst(VBit(true))))
			| Ebinop(Or, x, Aconst(VBit(false))) -> (n, Earg(x))
			| Ebinop(Or, x, Aconst(VBit(true))) -> (n, Earg(Aconst(VBit(true))))

			| Ebinop(And, Aconst(VBit(false)), x) -> (n, Earg(Aconst(VBit(false))))
			| Ebinop(And, Aconst(VBit(true)), x) -> (n, Earg(x))
			| Ebinop(And, x, Aconst(VBit(false))) -> (n, Earg(Aconst(VBit(false))))
			| Ebinop(And, x, Aconst(VBit(true))) -> (n, Earg(x))

			| Ebinop(Xor, Aconst(VBit(false)), x) -> (n, Earg(x))
			| Ebinop(Xor, x, Aconst(VBit(false))) -> (n, Earg(x))

			| Eslice(i, j, k) when i = j ->
				(n, Eselect(i, k))
			
			| _ -> (n, eq))
			p.p_eqs;
		p_inputs = p.p_inputs;
		p_outputs = p.p_outputs;
		p_vars = p.p_vars;
	}

(* if x is one bit, then :
	select 0 x = x
*)
let select_to_id p =
	{
		p_eqs = List.map
			(fun (n, eq) -> match eq with
			| Eselect(0, Avar(id)) when
				Env.find id p.p_vars = TBit || Env.find id p.p_vars = TBitArray(1) ->
					(n, Earg(Avar(id)))
			| _ -> (n, eq))
			p.p_eqs;
		p_inputs = p.p_inputs;
		p_outputs = p.p_outputs;
		p_vars = p.p_vars;
	}

(*
	If a = eqn(v1, v2, ...) and b = eqn(v1, v2, ...)   <- the same equation
	then say b = a
*)
let same_eq_simplify p =
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
		else if Hashtbl.mem eq_map eq then
			(n, Earg(Avar(Hashtbl.find eq_map eq)))
		else begin
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
	}


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


(* Eliminate dead equations *)
let eliminate_dead p =
	p, false (* TODO *)
	(* a bit like a topological sort... *)


(* Apply all the simplification passes,
	in the order given in the header of this file
*)
let rec simplify p =
	let p1 = cascade_slices p in
	let p2 = arith_simplify p1 in
	let p3 = select_to_id p2 in
	let p4 = same_eq_simplify p3 in
	let p5, use5 = eliminate_id p4 in
	let p6, use6 = eliminate_dead p5 in
	let pp = p6 in
	if use5 || use6 then simplify pp else pp

