open Netlist_ast

(* module Idm = Map.Make (String) *)
module Idm = Env

type calc =
    | Id of (ident * int)
    | Eq of (equation list -> int Idm.t -> arg * int * equation list * int Idm.t)
    | Const of (bool array)

let id =
    let cnt = ref 0 in
    fun n -> 
        let res = n ^ "_xoxo_" ^ (string_of_int !cnt) in
        incr cnt; res

let value n =
    let l = String.length n in
    ref (Const (Array.init l (fun i -> n.[i] = '1')))
    
let calc eqs vars e =
    match !e with
    | Id (id,t) -> Avar id,t,eqs,vars
    | Eq c ->
        let arg,t,eqs,vars = c eqs vars in
        let () = 
            match arg with
            | Avar id -> e := Id (id,t)
            | Aconst v -> e := Const v in
        arg,t,eqs,vars
    | Const v -> Aconst v,(Array.length v),eqs,vars
 
let ( ++ ) a b =
    ref (Eq (fun eqs vars ->
        let arga,ta,eqs,vars = calc eqs vars a in
        let argb,tb,eqs,vars = calc eqs vars b in
        let res = id "" in
        Avar res, (ta+tb), (res,Econcat (arga, argb))::eqs, Idm.add res (ta+tb) vars))
        
let ( ^^ ) a b = ref (Eq (fun eqs vars ->
    let arga,ta,eqs,vars = calc eqs vars a in
    let argb,tb,eqs,vars = calc eqs vars b in
    if ta = tb then
        let res = id "" in 
        Avar res, (ta), (res,Ebinop (Xor,arga, argb))::eqs, Idm.add res (ta) vars
    else assert false))
    
let ( ^| ) a b = ref (Eq (fun eqs vars ->
    let arga,ta,eqs,vars = calc eqs vars a in
    let argb,tb,eqs,vars = calc eqs vars b in
    if ta = tb then
        let res = id "" in 
        Avar res, (ta), (res,Ebinop (Or,arga, argb))::eqs, Idm.add res (ta) vars
    else assert false))
    
let ( ^& ) a b = ref (Eq (fun eqs vars ->
    let arga,ta,eqs,vars = calc eqs vars a in
    let argb,tb,eqs,vars = calc eqs vars b in
    if ta = tb then
        let res = id "" in 
        Avar res, (ta), (res,Ebinop (And,arga, argb))::eqs, Idm.add res (ta) vars
    else assert false))

let ( ^$ ) a b = ref (Eq (fun eqs vars ->
    let arga,ta,eqs,vars = calc eqs vars a in
    let argb,tb,eqs,vars = calc eqs vars b in
    if ta = tb then
        let res = id "" in 
        Avar res, (ta), (res,Ebinop (Nand,arga, argb))::eqs, Idm.add res (ta) vars
    else assert false))

let not a = ref (Eq (fun eqs vars ->
    let arga,ta,eqs,vars = calc eqs vars a in
    let res = id "" in
    Avar res, ta, (res,Enot arga)::eqs, Idm.add res ta vars))
    
let mux a b c = ref (Eq (fun eqs vars ->
    let arga,ta,eqs,vars = calc eqs vars a in
    let argb,tb,eqs,vars = calc eqs vars b in
    let argc,tc,eqs,vars = calc eqs vars c in
    if ta = 1 && tb = tc then
        let res = id "" in
        Avar res, tb, (res,Emux (arga,argb,argc))::eqs, Idm.add res tb vars
    else assert false))

let ( ** ) a n = ref (Eq (fun eqs vars ->
    let arga,ta,eqs,vars = calc eqs vars a in
    if n >= ta then assert false
    else if ta = 1 then arga,ta,eqs,vars
    else let res = id "" in
        Avar res, 1, (res,Eselect (n,arga))::eqs, Idm.add res 1 vars))

let ( % ) a (i,j) = ref (Eq (fun eqs vars ->
    let arga,ta,eqs,vars = calc eqs vars a in
    if j > ta then assert false
    else if i > j then assert false
    else if j-i+1 = ta then arga,ta,eqs,vars
    else let res = id "" in
        Avar res, (j-i+1), (res,Eslice (i,j,arga))::eqs, Idm.add res (j-i+1) vars))

let rom name a_s w_s a = ref (Eq (fun eqs vars ->
    let arga,ta,eqs,vars = calc eqs vars a in
    if ta = a_s && w_s > 0 then
        let res = id name in
        Avar res, w_s, (res,Erom (a_s,w_s,arga))::eqs, Idm.add res w_s vars
    else assert false))

let ram a_s w_s ra we wa d = ref (Eq (fun eqs vars ->
    let argra,tra,eqs,vars = calc eqs vars ra in
    let argwe,twe,eqs,vars = calc eqs vars we in
    let argwa,twa,eqs,vars = calc eqs vars wa in
    let argd,td,eqs,vars = calc eqs vars d in
    if tra = a_s && twa = a_s && td = w_s && twe = 1 then
        let res = id "" in
        Avar res, w_s, (res,Eram (a_s,w_s,argra,argwe,argwa,argd))::eqs, Idm.add res w_s vars
    else assert false))

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
