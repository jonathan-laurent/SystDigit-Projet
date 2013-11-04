open Netlist_ast
open Format

(* GENERAL PRINTER *)

let rec print_env print lp sep rp ff env =
  let first = ref true in
  fprintf ff "%s" lp;
  Env.iter
    (fun x ty ->
      if !first then
        (first := false; fprintf ff "%a" print (x, ty))
      else
        fprintf ff "%s%a" sep print (x, ty)) env;
  fprintf ff "%s" rp

let rec print_list print lp sep rp ff = function
  | [] -> ()
  | x :: l ->
      fprintf ff "%s%a" lp print x;
      List.iter (fprintf ff "%s %a" sep print) l;
      fprintf ff "%s" rp

let print_ty ff ty = match ty with
  | TBit -> ()
  | TBitArray n -> fprintf ff " : %d" n

let print_bool ff b =
  if b then
    fprintf ff "1"
  else
    fprintf ff "0"

let print_value ff v = match v with
  | VBit b -> print_bool ff b
  | VBitArray a -> Array.iter (print_bool ff) a

let print_arg ff arg = match arg with
  | Aconst v -> print_value ff v
  | Avar id -> fprintf ff "%s" id

let print_op ff op = match op with
  | And -> fprintf ff "AND"
  | Nand -> fprintf ff "NAND"
  | Or -> fprintf ff "OR"
  | Xor -> fprintf ff "XOR"

let print_exp ff e = match e with
  | Earg a -> print_arg ff a
  | Ereg x -> fprintf ff "REG %s" x
  | Enot x -> fprintf ff "NOT %a" print_arg x
  | Ebinop(op, x, y) -> fprintf ff  "%a %a %a" print_op op  print_arg x  print_arg y
  | Emux (c, x, y) -> fprintf ff "MUX %a %a %a " print_arg c  print_arg x  print_arg y
  | Erom (addr, word, ra) -> fprintf ff "ROM %d %d %a" addr word  print_arg ra
  | Eram (addr, word, ra, we, wa, data) ->
      fprintf ff "RAM %d %d %a %a %a %a" addr word
        print_arg ra  print_arg we
        print_arg wa  print_arg data
  | Eselect (idx, x) -> fprintf ff "SELECT %d %a" idx print_arg x
  | Econcat (x, y) ->  fprintf ff  "CONCAT %a %a" print_arg x  print_arg y
  | Eslice (min, max, x) -> fprintf ff "SLICE %d %d %a" min max print_arg x

let print_eq ff (x, e) =
  fprintf ff "%s = %a@." x print_exp e

let print_var ff (x, ty) =
  fprintf ff "@[%s%a@]" x print_ty ty

let print_vars ff env =
  fprintf ff "@[<v 2>VAR@,%a@]@.IN@,"
    (print_env print_var "" ", " "") env

let print_idents ff ids =
  let print_ident ff s = fprintf ff "%s" s in
  print_list print_ident """,""" ff ids

let print_program oc p =
  let ff = formatter_of_out_channel oc in
  fprintf ff "INPUT %a@." print_idents p.p_inputs;
  fprintf ff "OUTPUT %a@." print_idents p.p_outputs;
  print_vars ff p.p_vars;
  List.iter (print_eq ff) p.p_eqs;
  (* flush *)
  fprintf ff "@."


(* PRINTER FOR DUMBED-DOWN NETLIST (variables are identified by numbers) *)

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

let print_dumb_program oc p =
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
	| Avar(k) -> fprintf ff " %d" (Hashtbl.find var_id k)
	| Aconst(n) -> fprintf ff " $";
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




