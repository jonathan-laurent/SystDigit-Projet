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

type reg_var = { reg_dest : var_id; source : var_id }
type ram_var = { ram_id : int;
  addr_size : int; word_size : int;
  write_enable : var_id;
  write_addr : var_id; data : var_id }

type dumb_exp =
  | Dcopy of var_id   (* copy a variable - these cannot be eliminated totally *)
  | Dnot of var_id
  | Dbinop of binop * var_id * var_id
  | Dmux of var_id * var_id * var_id
  | Drom of int * int * var_id
  | Dconcat of var_id * var_id
  | Dslice of int * int * var_id
  | Dselect of int * var_id
  | Dreadram of int * var_id

type dumb_equation = var_id * dumb_exp

type dumb_program = {
  d_vars : var_def list;
  d_inputs : var_id list;
  d_outputs : var_id list;
  d_regs : reg_var list;
  d_rams : ram_var list;
  d_eqs : dumb_equation list }

(*  Convert a program to a dumb program *)

let mkbinstr a =
  let r = String.make (Array.length a) '0' in
  for i = 0 to Array.length a - 1 do
    if a.(i) then r.[i] <- '1'
  done;
  r

let const_info  a = 
  "$" ^ (mkbinstr a), Array.length a, a

let make_program_dumb p =
  (*
    1. Identify constants and create new variables for them,
      put them on the variable list
    2. Create map from variable identifier to variable ID,
      add them to variable list
    3. Extract regs and rams into separate list
    4. Reformat equation list (replace constants by the
      coresponding constant variables)
    5. Done.
  *)
  let next_id = ref 0 in
  let vars = ref [] in
  let var_map = Hashtbl.create (Env.cardinal p.p_vars) in

  (* Extract constants *)
  List.iter
    (fun (_, eq) ->
    let add = function
      | Aconst(k) ->
        let id, sz, v = const_info k in
        if not (Hashtbl.mem var_map id) then begin
          vars := { name= id; size= sz }::(!vars);
          Hashtbl.add var_map id (!next_id);
          next_id := !next_id + 1
        end
      | _ -> ()
    in match eq with
    | Earg(a) -> add a
    | Enot(a) -> add a
    | Ebinop(_, a, b) -> add a; add b
    | Emux(a, b, c) -> add a; add b; add c
    | Erom(_, _, a) -> add a
    | Eram(_, _, a, b, c, d) -> add a; add b; add c; add d
    | Econcat(a, b) -> add a; add b
    | Eslice(_, _, a) -> add a
    | Eselect(_, a) ->add a
    | _ -> ())
    p.p_eqs;
  
  (* Make ids for variables *)
  let add_var n =
    if not (Hashtbl.mem var_map n) then begin
      vars := { name = n; size = Env.find n p.p_vars }::(!vars);
      Hashtbl.add var_map n (!next_id);
      next_id := !next_id + 1
    end
  in
  List.iter add_var p.p_inputs;
  List.iter (fun (n, _) -> add_var n) p.p_eqs;
  Env.iter (fun n _ -> add_var n) p.p_vars;

  let var_id = Hashtbl.find var_map in
  let arg_id = function
    | Avar(x) -> var_id x
    | Aconst(x) ->
      let n, _, _ = const_info x in var_id n
  in

  (* Extract registers *)
  let regs, eq2 = List.fold_left
    (fun (regs, eqs) (n, eq) ->
      match eq with
      | Ereg(x) -> 
        {
          reg_dest = var_id n;
          source = var_id x;
        }::regs, eqs
      | _ -> regs, (n, eq)::eqs)
    ([],[])
    p.p_eqs in
  (* Extract rams, replace arguments by variable id's *)
  let ram_id = ref 0 in
  let rams, eq3 = List.fold_left
    (fun (rams, eqs) (n, eq) ->
      let ram2 = ref None in
      let eq2 = match eq with
      | Eram(asz, wsz, ra, we, wa, d) ->
        ram_id := !ram_id + 1;
        ram2 := Some({
          ram_id = !ram_id - 1;
          addr_size = asz;
          word_size = wsz;
          write_enable = arg_id we;
          write_addr = arg_id wa;
          data = arg_id d;
        });
        Dreadram(!ram_id - 1, arg_id ra)
      | Earg(a) -> Dcopy(arg_id a)
      | Enot(a) -> Dnot(arg_id a)
      | Ebinop(o, a, b) -> Dbinop(o, arg_id a, arg_id b)
      | Emux(a, b, c) -> Dmux(arg_id a, arg_id b, arg_id c)
      | Erom(u, v, a) -> Drom(u, v, arg_id a)
      | Econcat(a, b) -> Dconcat(arg_id a, arg_id b)
      | Eslice(u, v, a) -> Dslice(u, v, arg_id a)
      | Eselect(i, a) -> Dselect(i, arg_id a)
      | _ -> failwith "This should not happen."
      in
        (match !ram2 with | None -> rams | Some k -> k::rams),
        (var_id n, eq2)::eqs
      )
    ([],[])
    eq2 in
  
  (* Replace arguments by variable id's *)
  {
    d_vars = List.rev (!vars);
    d_inputs = List.map var_id p.p_inputs;
    d_outputs = List.map var_id p.p_outputs;
    d_regs = regs;
    d_rams = List.rev rams;
    d_eqs = eq3;
  }
    

(* Printer code *)

(* Identifiers *)
let c_copy = 0
let c_not = 1
let c_binop = 2
let c_mux = 3
let c_rom = 4
let c_concat = 5
let c_slice = 6
let c_select = 7
let c_readram = 8

let binop_id = function
  | Or -> 0
  | Xor -> 1
  | And -> 2
  | Nand -> 3

let print_dumb_program oc p =
  let ff = formatter_of_out_channel oc in
  (* print variable list *)
  fprintf ff "%d\n" (List.length p.d_vars);
  List.iter
    (fun v ->
      fprintf ff "%d %s\n" v.size v.name)
    p.d_vars;
  (* print input list *)
  fprintf ff "%d" (List.length p.d_inputs);
  List.iter (fun k -> fprintf ff " %d" k) p.d_inputs;
  fprintf ff "\n";
  (* print output list *)
  fprintf ff "%d" (List.length p.d_outputs);
  List.iter (fun k -> fprintf ff " %d" k) p.d_outputs;
  fprintf ff "\n";
  (* print register list *)
  fprintf ff "%d\n" (List.length p.d_regs);
  List.iter (fun (r: reg_var) ->
    fprintf ff "%d %d\n" r.reg_dest r.source) p.d_regs;
  (* print ram list *)
  fprintf ff "%d\n" (List.length p.d_rams);
  List.iter (fun r -> fprintf ff "%d %d %d %d %d\n"
        r.addr_size r.word_size r.write_enable
        r.write_addr r.data) p.d_rams;
  (* print equation list *)
  fprintf ff "%d\n" (List.length p.d_eqs);
  List.iter (fun (n, e) ->
    fprintf ff "%d " n; match e with
    | Dcopy(x) -> fprintf ff "%d %d\n" c_copy x
    | Dnot(x) -> fprintf ff "%d %d\n" c_not x
    | Dbinop(o, a, b) -> fprintf ff "%d %d %d %d\n" c_binop (binop_id o) a b
    | Dmux(a, b, c) -> fprintf ff "%d %d %d %d\n" c_mux a b c
    | Drom(u, v, a) -> fprintf ff "%d %d %d %d\n" c_rom u v a
    | Dconcat(a, b) -> fprintf ff "%d %d %d\n" c_concat a b
    | Dslice(u, v, a) -> fprintf ff "%d %d %d %d\n" c_slice u v a
    | Dselect(i, a) -> fprintf ff "%d %d %d\n" c_select i a
    | Dreadram(i, k) -> fprintf ff "%d %d %d\n" c_readram i k)
    p.d_eqs;
  (*flush*)
  fprintf ff "@."

let print_program oc p =
  print_dumb_program oc (make_program_dumb p)

