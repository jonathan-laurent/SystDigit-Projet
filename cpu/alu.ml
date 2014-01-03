open Netlist_gen

let rec rep n k =
    if n = 1 then k
    else
        let s = rep (n/2) k in
        if n mod 2 = 0 then s ++ s else s ++ s ++ k

let rec eq_c n v c = (* v is a value, c is a constant *)
    if n = 1 then
        if c = 1 then v else not v
    else
        (eq_c 1 (v ** 0) (c mod 2)) ^& (eq_c (n-1) (v % (1, n-1)) (c/2))

let rec all1 n x =
    if n = 1 then
        x
    else
        (x ** 0) ^& (all1 (n-1) (x % (1, n-1)))

let rec nonnull n a =
    if n = 1 then
        a
    else
        (a ** 0) ^| (nonnull (n-1) (a % (1, n-1)))

let rec sign_extend n_a n_dest a =
    a ++ rep (n_dest - n_a) (a ** (n_a - 1))

let fulladder a b c =
       let s = a ^^ b ^^ c in
       let r = (a ^& b) ^| ((a ^^ b) ^& c) in
       s, r

let rec nadder n a b c_in =
    if n = 1 then fulladder a b c_in
    else 
        let s_n, c_n1 = fulladder (a ** 0) (b ** 0) c_in in
        let s_n1, c_out = nadder (n-1) (a % (1, n-1)) (b % (1, n-1)) c_n1 in
        s_n ++ s_n1, c_out

let rec npshift_signed n p a b =
    a (* TODO *)

let nadder_nocarry n a b =
    let a, b = nadder n a b (const "0") in
    ignore b a

let rec eq_n n a b =
    all1 n (not (a ^^ b))

let rec ne_n n a b =
    nonnull n (a ^^ b)

let rec lt_n n a b =
    const "0"       (* TODO : less than *)

let rec ult_n n a b =
    const "0"       (* TODO : less than, unsigned *)

let rec le_n n a b =
    const "0"       (* TODO : less than or equal *)

let rec ule_n n a b =
    const "0"       (* TODO : less than or equal, unsigned *)

let alu_comparer n f0 f a b =
    (*
        f0  f   action
        --  -   ------
        0   0   equal
        0   1   not equal
        0   2   equal
        0   3   not equal
        1   0   lt
        1   1   le
        1   2   lt unsigned
        1   3   le unsigned
    *)
    let eq_ne = mux (f ** 0) (eq_n n a b) (ne_n n a b) in
    let lte_signed = mux (f ** 0) (lt_n n a b) (le_n n a b) in
    let lte_unsigned = mux (f ** 0) (ult_n n a b) (ule_n n a b) in
    let lte = mux (f ** 1) lte_signed lte_unsigned in
    mux f0 eq_ne lte
