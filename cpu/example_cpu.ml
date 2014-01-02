open Netlist_gen

(* Dumb CPU that just does an 8-bit addition *)

let sumz n i =
    let x, set_x = loop n in
    let r = reg n x in
    let o1, o2 = Alu.nadder n i r (const "0") in
    set_x o1, o2

let p = 
    let width = 16 in
    let sum, r = sumz width (get "in") in
    program
        [   "in", width ]
        [   "out", width, sum;
            "r", 1, r ]

let () = Netlist_gen.print stdout p
