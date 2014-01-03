open Netlist_gen

(* Dumb CPU that just does an 8-bit addition *)

let sumz n i =
    let x, set_x = loop n in
    let r = reg n x in
    let o1, o2 = Alu.nadder_with_carry n i r (const "0") in
    set_x o1, o2

let p = 
    let width = 16 in
    let sum, r = sumz width (get "input") in
    program
        [   "input", width;
            "ser_in", 8 ]
        [   "output", width, sum;
            "r", 1, r;
            "ser_busy", 1, (const "0");
            "ser_out", 8, get "ser_in"; ]

let () = Netlist_gen.print stdout p
