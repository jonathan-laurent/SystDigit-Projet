(* 
	Système Digital, cours de J.Vuillemin, 2013-2013
	Alex AUVOLAT, ENS INFO 2013

	Circuit Simulator, main file
*)

open Netlist_ast

let num_steps = ref (-1)
let step = ref 0

let read_input = function
	| (s, TBit) -> Format.printf "%s (1 bit) : @?" s;
		let k = ref (read_line()) in
		while String.length !k < 1 do
			Format.printf "Too short. Retry : ";
			k := read_line();
		done;
		VBit ((!k).[0] = '1')
	| (s, TBitArray(n)) -> Format.printf "%s (%d bits) : @?" s n;
		let k = ref (read_line()) in
		while String.length !k < 1 do
			Format.printf "Too short. Retry : ";
			k := read_line();
		done;
		let r = Array.make n false in
		for i = 0 to n-1 do
			r.(i) <- ((!k).[i] = '1')
		done;
		VBitArray(r)

let print_output = function
	| (n, VBit (b)) ->
		Format.printf "%s\t: %d@." n (if b then 1 else 0)
	| (n, VBitArray (a)) ->
		Format.printf "%s\t: " n;
		for i = 0 to Array.length a - 1 do
			Format.printf "%d" (if a.(i) then 1 else 0)
		done;
		Format.printf "@."

let loadrun filename =
	let p = Netlist.read_file filename in

	let machine = Machine.create p in

	while !num_steps > !step || !num_steps == -1 do
		step := !step + 1;
		Format.printf "Step #%d@." !step;

		Machine.read_inputs machine read_input;
		Machine.step machine;
		Machine.print_outputs machine print_output
	done

let () =
	try
		Arg.parse
			["-rom", Arg.String(Machine.load_rom), "Load one ROM file into the simulator (will be used by all ROM chips).";
			 "-n", Arg.Set_int num_steps, "Number of steps to simulate"]
			 loadrun
			 ""
	with
	| Netlist.Parse_error s -> Format.eprintf "An error occurred: %s@." s; exit 2
	| Machine.Error s -> Format.eprintf "An error occurred: %s@." s; exit 2
		
