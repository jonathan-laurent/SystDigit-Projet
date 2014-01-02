open Netlist_gen

(* Dumb CPU that just does an 8-bit addition *)

let sumz n i =
    let rec res =
        let aux = reg n in
        fun () -> fst (Alu.nadder n i (aux res) (value "0")) ()
    in
       res

let p = 
    main_1_1 (sumz 8) 8

let () = Netlist_proc.print stdout p
