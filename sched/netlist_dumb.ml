(* PRINTER FOR DUMBED-DOWN NETLIST
	(the format used by the C simulator)
*)

open Netlist_ast
open Format

(* Alternative program AST format, better corresponding to the dumb syntax *)

type var_def = {
	name : string;
	size : int }
type var_id = int
type const_val = bool array
(* keep type binop from netlist_ast *)

type const_var = { dest : var_id; value : const_val }
type reg_var = { dest : var_id; source : var_id }
type ram_var = { dest : var_id;
	addr_size : int; word_size : int;
	read_addr : var_id; write_enable : var_id;
	write_addr : var_id; data : var_id }

type dumb_exp =
	| Dcopy of var_id		(* copy a variable - these cannot be eliminated totally *)
	| Dnot of var_id
	| Dbinop of binop * var_id * var_id
	| Dmux of var_id * var_id * var_id
	| Drom of int * int * var_id
	| Dconcat of var_id * var_id
	| Dslice of int * int * var_id
	| Dselect of int * var_id

type dumb_equation = var_id * dumb_exp

type dumb_program = {
	d_vars : var_def list;
	d_inputs : var_id list;
	d_outputs : var_id list;
	d_regs : reg_var list;
	d_rams : ram_var list;
	d_eqs : dumb_equation list }

(*	Convert a program to a dumb program *)

let mkbinstr a =
	let r = String.make (Array.length a) '0' in
	for i = 0 to Array.length a - 1 do
		if a.(i) then r.[i] <- '1'
	done;
	r

let make_program_dumb p =
	let vars = ref [] in
	let var_map = Hashtbl.create (Env.size p.p_vars) in
	() (* TODO *)
	(*
		1. Identify constants and create new variables for them, put them on the variable list
		2. Create map from variable identifier to variable ID, add them to variable list
		3. Extract regs and rams into separate list
		4. Reformat equation list (replace constants by the coresponding constant variables)
		5. Done.
	*)
		


(* constants *)
let c_arg = 0
let c_reg = 1
let c_not = 2
let c_binop = 3
let c_mux = 4
let c_rom = 5
let c_ram = 6
let c_concat = 7
let c_slice = 8
let c_select = 9

let binop_i = function
	| Or -> 0
	| Xor -> 1
	| And -> 2
	| Nand -> 3

let print_program oc p =
	let ff = formatter_of_out_channel oc in
	(* associate numbers to variables *)
	let n_vars = Env.fold (fun _ _ n -> n+1) p.p_vars 0 in
	let n = ref 0 in
	let var_id = Hashtbl.create n_vars in
	fprintf ff "%d\n" n_vars;
	Env.iter
		(fun  k v ->
			Hashtbl.add var_id k !n;
			fprintf ff "%d %s\n"
				(match v with
					| TBit -> 1
					| TBitArray(n) -> n)
				k;
			n := !n + 1)
		p.p_vars;
	(* write input vars *)
	fprintf ff "%d" (List.length p.p_inputs);
	List.iter (fun k -> fprintf ff " %d" (Hashtbl.find var_id k)) p.p_inputs;
	fprintf ff "\n";
	(* write output vars *)
	fprintf ff "%d" (List.length p.p_outputs);
	List.iter (fun k -> fprintf ff " %d" (Hashtbl.find var_id k)) p.p_outputs;
	fprintf ff "\n";
	(* write equations *)
	fprintf ff "%d\n" (List.length p.p_eqs);
	(* write equations *)
	let print_arg = function
	| Avar(k) -> fprintf ff " $%d" (Hashtbl.find var_id k)
	| Aconst(n) -> fprintf ff " ";
		begin match n with
		| VBit(x) -> fprintf ff "%d" (if x then 1 else 0)
		| VBitArray(a) ->
			for i = 0 to Array.length a - 1 do
				fprintf ff "%d" (if a.(i) then 1 else 0)
			done
		end
	in
	List.iter
		(fun (k, eqn) ->
			fprintf ff "%d " (Hashtbl.find var_id k);
			begin match eqn with
			| Earg(a) -> fprintf ff "%d" c_arg;
				print_arg a
			| Ereg(i) -> fprintf ff "%d %d" c_reg (Hashtbl.find var_id i)
			| Enot(a) -> fprintf ff "%d" c_not;
				print_arg a
			| Ebinop(o, a, b) -> fprintf ff "%d %d" c_binop (binop_i o);
				print_arg a;
				print_arg b
			| Emux(a, b, c) -> fprintf ff "%d" c_mux;
				print_arg a; print_arg b; print_arg c
			| Erom(u, v, a) -> fprintf ff "%d %d %d" c_rom u v;
				print_arg a
			| Eram (u, v, a, b, c, d) -> fprintf ff "%d %d %d" c_ram u v;
				print_arg a; print_arg b; print_arg c; print_arg d
			| Econcat(a, b) -> fprintf ff "%d" c_concat;
				print_arg a; print_arg b
			| Eslice(u, v, a) -> fprintf ff "%d %d %d" c_slice u v;
				print_arg a
			| Eselect(i, a) -> fprintf ff "%d %d" c_select i;
				print_arg a
			end;
			fprintf ff "\n")
		p.p_eqs;
	(* flush *)
	fprintf ff "@."




