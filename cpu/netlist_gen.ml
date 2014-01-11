open Netlist_ast

exception Size_error of string
let ty_assert f s = if not f then raise (Size_error s)
let ty_error s = raise (Size_error s)

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
    ty_assert (not (Env.mem id p.p_vars) 
        || (Env.find id p.p_vars = size)) "Adding a variable with bad size.";
    ty_assert (not (List.mem_assoc id p.p_eqs)) "Adding an equation that is already there";
    {   p with
        p_eqs = (id, eq)::p.p_eqs;
        p_vars = Env.add id size p.p_vars }

let get id =
    fun p -> 
        ty_assert (Env.mem id p.p_vars) ("Trying to get " ^ id ^ ", which does not exist.");
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
            if sz1 = 0 then
              (x2), p
            else if sz2 = 0 then
              (x1), p
            else
              (Avar i), add p i (Econcat (x1, x2)) (sz1 + sz2)
    
let ( ^| ) v1 v2 =
    let i = id "" in
    fun p ->
        if List.mem_assoc i p.p_eqs then Avar i, p else
            let x1, p = v1 p in
            let x2, p = v2 p in
            let sz = get_size p x1 in
            let sz2 = get_size p x2 in
            ty_assert (sz = sz2) (Format.sprintf "Incompatible sizes for Or: %d/%d" sz sz2);
            (Avar i), add p i (Ebinop (Or, x1, x2)) sz

let ( ^^ ) v1 v2 =
    let i = id "" in
    fun p ->
        if List.mem_assoc i p.p_eqs then Avar i, p else
            let x1, p = v1 p in
            let x2, p = v2 p in
            let sz = get_size p x1 in
            let sz2 = get_size p x2 in
            ty_assert (sz = sz2) (Format.sprintf "Incompatible sizes for Xor: %d/%d" sz sz2);
            (Avar i), add p i (Ebinop (Xor, x1, x2)) sz

let ( ^& ) v1 v2 =
    let i = id "" in
    fun p ->
        if List.mem_assoc i p.p_eqs then Avar i, p else
            let x1, p = v1 p in
            let x2, p = v2 p in
            let sz = get_size p x1 in
            let sz2 = get_size p x2 in
            ty_assert (sz = sz2) (Format.sprintf "Incompatible sizes for And: %d/%d" sz sz2);
            (Avar i), add p i (Ebinop (And, x1, x2)) sz

let ( ^$ ) v1 v2 =
    let i = id "" in
    fun p ->
        if List.mem_assoc i p.p_eqs then Avar i, p else
            let x1, p = v1 p in
            let x2, p = v2 p in
            let sz = get_size p x1 in
            let sz2 = get_size p x2 in
            ty_assert (sz = sz2) (Format.sprintf "Incompatible sizes for Nand: %d/%d" sz sz2);
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
            let sz0 = get_size p x1 in
            let sz = get_size p x2 in
            let sz2 = get_size p x3 in
            ty_assert (sz = sz2) (Format.sprintf "Mux'ed values have different sizes: %d/%d" sz sz2);
            ty_assert (sz0 = 1) (Format.sprintf "Mux control has size %d and not 1" sz0);
            (Avar i), add p i (Emux (x1, x2, x3)) sz

let ( ** ) v s =
    let i = id "" in
    fun p ->
        if List.mem_assoc i p.p_eqs then Avar i, p else
            let x, p = v p in
            let sz = get_size p x in
            ty_assert (s >= 0 && s < sz) (Format.sprintf "Trying to select %d in [0, %d[" s sz);
            (Avar i), add p i (Eselect (s, x)) 1

let ( % ) v (s1, s2) =
    let i = id "" in
    fun p ->
        if List.mem_assoc i p.p_eqs then Avar i, p else
            let x, p = v p in
            let sz = get_size p x in
            ty_assert (s1 >= 0 && s2 >= s1 && sz > s2) (Format.sprintf "Trying to slice [%d, %d] in [0, %d[" s1 s2 sz);
            (Avar i), add p i (Eslice (s1, s2, x)) (s2 - s1 + 1)

let rom i a_s w_s ra =
    let i = id i in
    fun p ->
        if List.mem_assoc i p.p_eqs then Avar i, p else
            let ra, p = ra p in
            let rasz = get_size p ra in
            ty_assert (rasz = a_s) (Format.sprintf "(ROM) RA does not have size %d (addr_size) but %d" a_s rasz);
            (Avar i), add p i (Erom (a_s, w_s, ra)) w_s

let ram a_s w_s ra we wa d =
    let i = id "" in
    fun p ->
        if List.mem_assoc i p.p_eqs then Avar i, p else
            let ra, p = ra p in let rasz = get_size p ra in
            let we, p = we p in let wesz = get_size p we in
            let wa, p = wa p in let wasz = get_size p wa in
            let d, p = d p in let dsz = get_size p d in
            ty_assert (rasz = a_s) (Format.sprintf "(RAM) RA does not have size %d (addr_size) but %d" a_s rasz);
            ty_assert (wasz = a_s) (Format.sprintf "(RAM) WA does not have size %d (addr_size) but %d" a_s wasz);
            ty_assert (wesz = 1) (Format.sprintf "(RAM) WE does not have size 1 but %d" wesz);
            ty_assert (dsz = w_s) (Format.sprintf "(RAM) D does not have size %d (word_size) but %d" w_s dsz);
            (Avar i), add p i (Eram (a_s, w_s, ra, we, wa, d)) w_s


let reg n v =
    let i = id "" in
    fun p ->
        if List.mem_assoc i p.p_eqs then Avar i, p else
            let v, p = v p in let sz = get_size p v in
            ty_assert (sz = n) (Format.sprintf "Reg %d is given argument of size %d" n sz);
            match v with
                | Avar j ->
                    (Avar i), add p i (Ereg j) n
                | Aconst k ->
                    (Avar i), add p i (Earg v) n


let program entries outputs =
    try
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
    with
    | Size_error m -> Format.eprintf "\nSize error:\t%s\n\n%!" m; assert false


