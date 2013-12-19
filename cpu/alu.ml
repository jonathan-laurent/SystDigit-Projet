open Netlist_gen

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



