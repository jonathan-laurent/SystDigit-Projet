open Netlist_ast

(* module Idm = Map.Make (String) *)
module Idm = Env
(*module Imap = Map.Make(struct type t = int let compare = compare end)*)
module Iset = Set.Make (struct type t = int let compare = compare end)

type res =
    | Arg of (arg * int)
    | Calc of (Iset.t -> equation list -> int Idm.t ->
        arg * int * equation list * int Idm.t)

type calc =
    unit -> res ref

let id =
    let cnt = ref 0 in
    fun s -> 
        let res = s ^ "_xoxo_" ^ (string_of_int !cnt) in
        incr cnt; res

let id2 =
    let cnt = ref 0 in
    fun () ->
        let v = !cnt in incr cnt; v

let value n =
    let l = String.length n in
    let v = Array.init l (fun i -> n.[i] = '1') in
    let res = ref (Arg (Aconst v,l)) in
    fun () -> res
    
let calc ids eqs vars e =
    let res = e () in
    match !res with
    | Calc c -> 
        let a,t,eqs,vars = c ids eqs vars in
        ( res := Arg (a,t); a, t, eqs, vars )
    | Arg (a,t) -> a,t,eqs,vars

(*let calc_rec t ids eqs vars e =
    let res,ide = e () in
    try let id,_ = Imap.find ide ids in
        Avar id, t, eqs, vars, ids
    with Not_found ->
        match !res with
        | Calc c ->
            let id = id "" in
            let a,t,eqs,vars = c (Imap.add ide (id,t) ids) eqs vars in
            ( res := Arg (a,t); a, t, eqs, vars )
        | Arg (a,t) -> a,t,eqs,vars*)

let ( ++ ) a b =
    let res = ref (Calc (
        fun ids eqs vars ->
            let arga,ta,eqs,vars = calc ids eqs vars a in
            let argb,tb,eqs,vars = calc ids eqs vars b in
            let res = id "" in
            Avar res, (ta+tb), (res,Econcat (arga, argb))::eqs, 
                Idm.add res (ta+tb) vars)) in
    fun () -> res
        
let ( ^^ ) a b =
    let res = ref (Calc (
        fun ids eqs vars ->
            let arga,ta,eqs,vars = calc ids eqs vars a in
            let argb,tb,eqs,vars = calc ids eqs vars b in
            if ta = tb then
                let res = id "" in 
                Avar res, (ta), (res,Ebinop (Xor,arga, argb))::eqs, Idm.add res (ta) vars
            else assert false)) in
    fun () -> res
    
let ( ^| ) a b =
    let res = ref (Calc (
        fun ids eqs vars ->
            let arga,ta,eqs,vars = calc ids eqs vars a in
            let argb,tb,eqs,vars = calc ids eqs vars b in
            if ta = tb then
                let res = id "" in 
                Avar res, (ta), (res,Ebinop (Or,arga, argb))::eqs, Idm.add res (ta) vars
            else assert false)) in
    fun () -> res
    
let ( ^& ) a b =
    let res = ref (Calc (fun ids eqs vars ->
        let arga,ta,eqs,vars = calc ids eqs vars a in
        let argb,tb,eqs,vars = calc ids eqs vars b in
        if ta = tb then
            let res = id "" in 
            Avar res, (ta), (res,Ebinop (And,arga, argb))::eqs, Idm.add res (ta) vars
        else assert false)) in
    fun () -> res

let ( ^$ ) a b =
    let res = ref (Calc (fun ids eqs vars ->
        let arga,ta,eqs,vars = calc ids eqs vars a in
        let argb,tb,eqs,vars = calc ids eqs vars b in
        if ta = tb then
            let res = id "" in 
            Avar res, (ta), (res,Ebinop (Nand,arga, argb))::eqs, Idm.add res (ta) vars
        else assert false)) in
    fun () -> res

let not a =
    let res = ref (Calc (fun ids eqs vars ->
        let arga,ta,eqs,vars = calc ids eqs vars a in
        let res = id "" in
        Avar res, ta, (res,Enot arga)::eqs, Idm.add res ta vars)) in
    fun () -> res
    
let mux a b c =
    let res = ref (Calc (fun ids eqs vars ->
        let arga,ta,eqs,vars = calc ids eqs vars a in
        let argb,tb,eqs,vars = calc ids eqs vars b in
        let argc,tc,eqs,vars = calc ids eqs vars c in
        if ta = 1 && tb = tc then
            let res = id "" in
            Avar res, tb, (res,Emux (arga,argb,argc))::eqs, Idm.add res tb vars
        else assert false)) in
    fun () -> res

let ( ** ) a n =
    let res = ref (Calc (fun ids eqs vars ->
        let arga,ta,eqs,vars = calc ids eqs vars a in
        if n >= ta then assert false
        else if ta = 1 then arga,ta,eqs,vars
        else let res = id "" in
            Avar res, 1, (res,Eselect (n,arga))::eqs, Idm.add res 1 vars)) in
    fun () -> res

let ( % ) a (i,j) =
    let res = ref (Calc (fun ids eqs vars ->
        let arga,ta,eqs,vars = calc ids eqs vars a in
        if j > ta then assert false
        else if i > j then assert false
        else if j-i+1 = ta then arga,ta,eqs,vars
        else let res = id "" in
            Avar res, (j-i+1), (res,Eslice (i,j,arga))::eqs,
                Idm.add res (j-i+1) vars)) in
    fun () -> res

let rom prefix a_s w_s a =
    let res = ref (Calc (fun ids eqs vars ->
        let arga,ta,eqs,vars = calc ids eqs vars a in
        if ta = a_s && w_s > 0 then
            let res = id prefix in
            Avar res, w_s, (res,Erom (a_s,w_s,arga))::eqs, Idm.add res w_s vars
        else assert false)) in
    fun () -> res

let ram a_s w_s ra we wa = 
    let id2 = id2 () in
    let id = id "" in
    fun d ->
    let res = ref (Calc (fun ids eqs vars ->
        if Iset.mem id2 ids then Avar id, w_s, eqs, vars
        else let argra,tra,eqs,vars = calc ids eqs vars ra in
        let ids = Iset.add id2 ids in
        let argwe,twe,eqs,vars = calc ids eqs vars we in
        let argwa,twa,eqs,vars = calc ids eqs vars wa in
        let argd,td,eqs,vars = calc ids eqs vars d in
        if tra = a_s && twa = a_s && td = w_s && twe = 1 then
            Avar id, w_s, (id,Eram (a_s,w_s,argra,argwe,argwa,argd))::eqs, Idm.add id w_s vars
        else assert false)) in
    fun () -> res

let reg n =
    let id2 = id2 () in
    let id = id "" in fun a ->
    let res = ref (Calc (fun ids eqs vars ->
        if Iset.mem id2 ids then Avar id, n, eqs, vars
        else let arga,ta,eqs,vars = calc (Iset.add id2 ids) eqs vars a in
            if ta = n then
                match arga with
                | Avar id' -> Avar id, n, (id,Ereg id')::eqs, Idm.add id n vars
                | _ -> assert false
            else assert false)) in
    fun () -> res

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
    ignore (Idm.fold (fun s t b -> 
        if b then Printf.fprintf oc "%s" (stts s t)
        else Printf.fprintf oc ", %s" (stts s t);
        false) p.p_vars true);
    Printf.fprintf oc "\nIN\n";
    List.iter (print_eq oc) p.p_eqs
