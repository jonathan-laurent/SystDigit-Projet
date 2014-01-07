open Netlist_ast

type t = program -> (arg * program)

let id =
    let cnt = ref 0 in
    fun s -> 
        let res = s ^ "_l_" ^ (string_of_int !cnt) in
        incr cnt; res

let get_size p arg = match arg with
    | Avar(id) -> Env.find id p.p_vars
    | Aconst(k) -> Array.length k

let add p id eq size =
    assert (not (Env.mem id p.p_vars) 
        || (Env.find id p.p_vars = size));
    assert (not (List.mem_assoc id p.p_eqs));
    {   p with
        p_eqs = (id, eq)::p.p_eqs;
        p_vars = Env.add id size p.p_vars }

let get id =
    fun p -> 
        assert (Env.mem id p.p_vars);
        (Avar id, p)

let loop s =
    let i = id "" in
    (fun p ->
        (Avar i),
        {   p_eqs = p.p_eqs;
            p_inputs = p.p_inputs;
            p_outputs = p.p_outputs;
            p_vars = Env.add i s p.p_vars }),
    (fun v1 ->
        fun p ->
            (Avar i),
            (if List.mem_assoc i p.p_eqs then p else
                let x, p = v1 p in 
                add p i (Earg x) s))
            
let ignore v1 v2 =
    fun p ->
        let v1, p = v1 p in
        v2 p
let ( ^. ) v1 v2 = ignore v1 v2

let const n =
    let l = String.length n in
    let v = Array.init l (fun i -> n.[i] = '1') in
    fun p ->
        (Aconst v, p)

let ( ++ ) v1 v2 =
    let i = id "" in
    fun p ->
        if List.mem_assoc i p.p_eqs then Avar i, p else
            let x1, p = v1 p in
            let x2, p = v2 p in
            let sz1, sz2 = get_size p x1, get_size p x2 in
            (Avar i), add p i (Econcat (x1, x2)) (sz1 + sz2)
    
let ( ^| ) v1 v2 =
    let i = id "" in
    fun p ->
        if List.mem_assoc i p.p_eqs then Avar i, p else
            let x1, p = v1 p in
            let x2, p = v2 p in
            let sz = get_size p x1 in
            assert (sz = get_size p x2);
            (Avar i), add p i (Ebinop (Or, x1, x2)) sz

let ( ^^ ) v1 v2 =
    let i = id "" in
    fun p ->
        if List.mem_assoc i p.p_eqs then Avar i, p else
            let x1, p = v1 p in
            let x2, p = v2 p in
            let sz = get_size p x1 in
            assert (sz = get_size p x2);
            (Avar i), add p i (Ebinop (Xor, x1, x2)) sz

let ( ^& ) v1 v2 =
    let i = id "" in
    fun p ->
        if List.mem_assoc i p.p_eqs then Avar i, p else
            let x1, p = v1 p in
            let x2, p = v2 p in
            let sz = get_size p x1 in
            assert (sz = get_size p x2);
            (Avar i), add p i (Ebinop (And, x1, x2)) sz

let ( ^$ ) v1 v2 =
    let i = id "" in
    fun p ->
        if List.mem_assoc i p.p_eqs then Avar i, p else
            let x1, p = v1 p in
            let x2, p = v2 p in
            let sz = get_size p x1 in
            assert (sz = get_size p x2);
            (Avar i), add p i (Ebinop (Nand, x1, x2)) sz

let not v1 =
    let i = id "" in
    fun p ->
        if List.mem_assoc i p.p_eqs then Avar i, p else
            let x, p = v1 p in
            (Avar i), add p i (Enot (x)) (get_size p x)

let mux v1 v2 v3 =
    let i = id "" in
    fun p ->
        if List.mem_assoc i p.p_eqs then Avar i, p else
            let x1, p = v1 p in
            let x2, p = v2 p in
            let x3, p = v3 p in
            let sz = get_size p x2 in
            assert (get_size p x3 = sz);
            assert (get_size p x1 = 1);
            (Avar i), add p i (Emux (x1, x2, x3)) sz

let ( ** ) v s =
    let i = id "" in
    fun p ->
        if List.mem_assoc i p.p_eqs then Avar i, p else
            let x, p = v p in
            let sz = get_size p x in
            assert (s >= 0 && s < sz);
            (Avar i), add p i (Eselect (s, x)) 1

let ( % ) v (s1, s2) =
    let i = id "" in
    fun p ->
        if List.mem_assoc i p.p_eqs then Avar i, p else
            let x, p = v p in
            let sz = get_size p x in
            assert (s1 >= 0 && s2 >= s1 && sz > s2);
            (Avar i), add p i (Eslice (s1, s2, x)) (s2 - s1 + 1)

let rom i a_s w_s ra =
    let i = id i in
    fun p ->
        if List.mem_assoc i p.p_eqs then Avar i, p else
            let ra, p = ra p in
            assert ((get_size p ra) = a_s);
            (Avar i), add p i (Erom (a_s, w_s, ra)) w_s

let ram a_s w_s ra we wa d =
    let i = id "" in
    fun p ->
        if List.mem_assoc i p.p_eqs then Avar i, p else
            let ra, p = ra p in
            let we, p = we p in
            let wa, p = wa p in
            let d, p = d p in
            assert ((get_size p ra) = a_s);
            assert ((get_size p wa) = a_s);
            assert ((get_size p we) = 1);
            assert ((get_size p d) = w_s);
            (Avar i), add p i (Eram (a_s, w_s, ra, we, wa, d)) w_s


let reg n v =
    let i = id "" in
    fun p ->
        if List.mem_assoc i p.p_eqs then Avar i, p else
            let v, p = v p in
            assert (get_size p v = n);
            match v with
                | Avar j ->
                    (Avar i), add p i (Ereg j) n
                | Aconst k ->
                    (Avar i), add p i (Earg v) n


let program entries outputs =
    let p =
        {   p_eqs = [];
            p_inputs = (List.map fst entries);
            p_outputs = [];
            p_vars = List.fold_left
                (fun k (e, s) -> Env.add e s k) Env.empty entries }
    in
    let p, outputs = List.fold_left
        (fun (p, outputs) (name, size, x) -> 
            let x, p = x p in
            assert (get_size p x = size);
            if x = Avar(name) then
                p, name::outputs
            else if name <> "" then
                add p name (Earg x) size, name::outputs
            else
                p, outputs)
        (p, []) outputs
    in
    {   p with
        p_outputs = List.rev outputs }


(* Netlist printer *)

let init_string n f =
    let s = String.make n 'a' in
    for i = 0 to n - 1 do
        s.[i] <- f i
    done;
    s

(* value to string *)
let vts bits =
    init_string (Array.length bits) (fun i ->
        if bits.(i) then '1' else '0')

(* argument to string *)
let ats = function
    | Avar id -> id
    | Aconst n -> vts n
    
let s_op = function
    | Or -> "OR"
    | Xor -> "XOR"
    | And -> "AND"
    | Nand -> "NAND"

let print oc p =
    let print_eq oc (s,e) = 
        let s_e =
            match e with
            | Earg a -> ats a
            | Ereg s -> "REG " ^ s
            | Enot a -> "NOT " ^ (ats a)
            | Ebinop (b,a1,a2) -> (s_op b) ^ " " ^ (ats a1) ^ " " ^ (ats a2)
            | Emux (a1,a2,a3) ->
                "MUX " ^ (ats a1) ^ " " ^ (ats a2) ^ " " ^ (ats a3)
            | Erom (n1,n2,a3) ->
                "ROM " ^ (string_of_int n1) ^ " " ^ (string_of_int n2) ^
                    " " ^ (ats a3)
            | Eram (n1,n2,a3,a4,a5,a6) ->
                "RAM " ^ (string_of_int n1) ^ " " ^ (string_of_int n2) ^
                    " " ^ (ats a3) ^ " " ^ (ats a4) ^ " " ^ (ats a5) ^
                    " " ^ (ats a6)
            | Econcat (a1,a2) -> "CONCAT " ^ (ats a1) ^ " " ^ (ats a2)
            | Eslice (n1,n2,a3) -> "SLICE " ^ (string_of_int n1) ^ " " ^
                (string_of_int n2) ^ " " ^ (ats a3)
            | Eselect (n,a) -> "SELECT " ^ (string_of_int n) ^ " " ^ (ats a) in
        Printf.fprintf oc "%s = %s\n" s s_e in
    Printf.fprintf oc "INPUT ";
    if p.p_inputs <> [] then
        (Printf.fprintf oc "%s" (List.hd p.p_inputs); List.iter 
            (Printf.fprintf oc ", %s") (List.tl p.p_inputs));
    Printf.fprintf oc "\nOUTPUT ";
    if p.p_outputs <> [] then
        (Printf.fprintf oc "%s" (List.hd p.p_outputs); List.iter 
            (Printf.fprintf oc ", %s") (List.tl p.p_outputs));
    Printf.fprintf oc "\nVAR ";
    let stts s t = if t = 1 then s else s ^ " : " ^ (string_of_int t) in
    Pervasives.ignore (Env.fold (fun s t b -> 
        if b then Printf.fprintf oc "%s" (stts s t)
        else Printf.fprintf oc ", %s" (stts s t);
        false) p.p_vars true);
    Printf.fprintf oc "\nIN\n";
    List.iter (print_eq oc) p.p_eqs
