(* 
	Système Digital, cours de J.Vuillemin, 2013-2013
	Alex AUVOLAT, ENS INFO 2013

	Circuit Simulator, machine simulator

	ASSUMPTIONS:
	- Only one ROM chip
*)

open Netlist_ast

exception Error of string
exception Is_not_modified

let load_rom filename =
	() (* TODO *)


type ram_prop = int * int		(* addr size ; word size *)
type machine = {
	p				: program;
	mutable vars	: value Env.t;
	mutable regs	: value Env.t;
	ram_chips		: ram_prop array;
	ram				: value array array;
}

let rec two_to_the = function
	| 0 -> 1
	| n -> let k = (two_to_the (n/2)) in
		if n mod 2 = 1 then 2 * k else k

let create p =
	let ram_chips = Array.of_list
		(List.fold_left
			(fun x (_, v) -> match v with
			| Eram (a, w, _, _, _, _) ->
				(a, w)::x
			| _ -> x)
			[]
			p.p_eqs) in
	let vars = Env.fold
			(fun k v x -> 
				Env.add k
					(match v with
						| TBit -> VBit(false)
						| TBitArray(n) -> VBitArray(Array.make n false))
					x)
			p.p_vars
			Env.empty in
	{ 
		p = p;
		vars = vars;
		regs = Env.empty;	(* no use putting anything at the moment *)
		ram_chips = ram_chips;
		ram = Array.map
			(fun (a, w) -> Array.make (two_to_the a) (VBitArray (Array.make w false)))
			ram_chips;
	}

let read_inputs m f =
	List.iter
		(fun n ->
			m.vars <- Env.add n (f (n, Env.find n m.p.p_vars)) m.vars)
		m.p.p_inputs

let step m =
	let get = function
	| Avar(x) -> 
		begin match Env.find x m.vars with
		| VBit(x) -> VBit(x)
		| VBitArray(u) as s ->
			if Array.length u = 1 then VBit(u.(0)) else s
		end
	| Aconst(x) -> x
	in
	(* Load register values into dest variables *)
	Env.iter
		(fun k v ->
			m.vars <- Env.add k v m.vars)
		m.regs;
	(* Do all the logic *)
	List.iter
		(fun (varname, exp) ->
			let evaluate = function
			| Earg(k) -> get k
			| Ereg(_) -> raise Is_not_modified	(* do nothing, registers are handled somewhere else *)
			| Enot(k) -> 
				begin match get k with
				| VBit(u) -> VBit (not u)
				| VBitArray(u) -> VBitArray(Array.map (fun x -> not x) u)
				end
			| Ebinop(op, k1, k2) ->
				let f = begin match op with
				| Or -> (fun x y -> x || y)
				| Xor -> (fun x y -> (x || y) && (not (x && y)))
				| And -> (fun x y -> x && y)
				| Nand -> (fun x y -> not (x && y))
				end in
				begin match get k1, get k2 with
				| VBit(u), VBit(v) -> VBit(f u v)
				| VBitArray(u), VBitArray(v) when Array.length u = Array.length v ->
					let r = Array.make (Array.length u) false in
					for i = 0 to Array.length u - 1 do
						r.(i) <- (f u.(i) v.(i))
					done; VBitArray(r)
				| VBit(u), VBitArray(v) -> VBit(f u v.(0))
				| VBitArray(u), VBit(v) -> VBit(f u.(0) v)
				| _ -> raise (Error "Incompatible data types.")
				end
			| Emux (control, in0, in1) ->
				begin match get control, get in0, get in1 with
				| VBit(u), x, y ->
					if u then y else x
				| VBitArray(u), VBitArray(a), VBitArray(b)
					when Array.length a = Array.length b
					&& Array.length u = Array.length a ->
					let r = Array.make (Array.length u) false in
					for i = 0 to Array.length u - 1 do
						r.(i) <- (if u.(i) then b.(i) else a.(i))
					done;
					VBitArray(r)
				| _ -> raise (Error "Invalid data size in mux")
				end
			| Erom(_, w, _) -> VBitArray(Array.make w false) (* TODO *)
			| Eram(_, _, _,_, _, _) -> raise Is_not_modified (* TODO *)
			| Econcat(k1, k2) ->
				let a1 = match get k1 with
				| VBit(u) -> [|u|]
				| VBitArray(u) -> u
				in
				let a2 = match get k2 with
				| VBit(u) -> [|u|]
				| VBitArray(u) -> u
				in
				VBitArray(Array.append a1 a2)
			| Eslice (first, last, k) ->
				begin match get k with
				| VBit(u) when first = 0 && last = 0 -> VBit(u)
				| VBitArray(u) ->
					let r = Array.make (last - first) false in
					for i = first to last - 1 do
						r.(i - first) <- u.(i)
					done;
					VBitArray(u)
				| _ -> raise (Error "Invalid slicing parameters")
				end
			| Eselect(id, k) ->
				begin match get k with
				| VBit(u) when id = 0 -> VBit(u)
				| VBitArray(u) -> VBit(u.(id))
				| _ -> raise (Error "Invalid select parameters")
				end
			in
			try
				m.vars <- Env.add varname (evaluate exp) m.vars
			with Is_not_modified -> ())
		m.p.p_eqs;
	(* Saves register values *)
	m.regs <- List.fold_left
		(fun x (k, v) ->
			match v with
			| Ereg(n) -> Env.add k (Env.find n m.vars) x
			| _ -> x)
		Env.empty
		m.p.p_eqs

let print_outputs m f =
	List.iter
		(fun n ->
			f (n, Env.find n m.vars))
		m.p.p_outputs

