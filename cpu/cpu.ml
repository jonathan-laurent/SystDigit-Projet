open Netlist_gen

(* Dumb CPU that just does an 8-bit addition *)

let p = 
main_2_2 (fun a b -> Alu.nadder 8 a b (value "0")) 8 8

let () = Netlist_proc.print stdout p
