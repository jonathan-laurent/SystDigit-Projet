open Asm
open Printf
open Lexing

let init_string n f =
	let res = String.make n 'a' in
	for i = 0 to n - 1 do res.[i] <- f i done; res

let bts n = init_string 8 (fun i -> 
	if (n lsr i) land 1 = 1 then '1' else '0')
	
let wts n =
	sprintf "%s %s" (bts (n land 0xFF)) (bts ((n lsr 8) land 0xFF))

let rev_keywords = List.map (fun (i,j) -> (j,i)) keywords_r

let rts = function
	| 0 -> "Z"
	| 1 -> "A"
	| 2 -> "B"
	| 3 -> "C"
	| 4 -> "D"
	| 5 -> "E"
	| 6 -> "RA"
	| 7 -> "SP"
	| _ -> assert false

let byte n b =
	if b >= 0 then b
	else b + (1 lsl n)

let r (o,f) r1 r2 r3 = 
	(o lsl 11) lxor (r1 lsl 8) lxor (r2 lsl 5) lxor (r3 lsl 2) lxor f

let i o r d = (o lsl 11) lxor (r lsl 8) lxor ((byte 8 d) land 0xFF)

let j o d = (o lsl 11) lxor ((byte 11 d) land 0x07FF)

let k o r1 r2 d = (o lsl 11) lxor (r1 lsl 8) lxor (r2 lsl 5) lxor (byte 5 d)

let code = function
	| Add -> (0b00000,0)
	| Sub -> (0b00000,1)
	| Mul -> (0b00000,2)
	| Div -> (0b00000,3)
	| Addu -> (0b00001,0)
	| Subu -> (0b00001,1)
	| Mulu -> (0b00001,2)
	| Divu -> (0b00001,3)
	| Or -> (0b00010,0)
	| And -> (0b00010,1)
	| Xor -> (0b00010,2)
	| Nor -> (0b00010,3)
	| Lsl -> (0b00011,0)
	| Lsr -> (0b00011,2)
	| Asr -> (0b00011,3)
	| Se -> (0b00100,2)
	| Sne -> (0b00100,3)
	| Slt -> (0b00101,0)
	| Sle -> (0b00101,1)
	| Sltu -> (0b00101,2)
	| Sleu -> (0b00101,3)
	| Jer -> (0b01010,2)
	| Jner -> (0b01010,3)
	| Jltr -> (0b01011,0)
	| Jler -> (0b01011,1)
	| Jltru -> (0b01011,2)
	| Jleru -> (0b01011,3)
	| Lwr -> (0b10100,0)
	| Swr -> (0b10101,0)
	| Lbr -> (0b10110,0)
	| Sbr -> (0b10111,0)

let its = function
	| Imm i -> string_of_int i
	| Lab l -> l

let print_program p =
	let pc = ref 0 in
	let value = function
		| Imm i -> i
		| Lab l -> fst (Imap.find l p.lbls) in
	let value2 = function
		| Imm i -> i
		| Lab l -> fst (Imap.find l p.lbls) - !pc in
	let value3 = function
		| Imm i -> i
		| Lab l -> (byte 16 (fst (Imap.find l p.lbls))) lsr 8 in
	let get_reps = function
		| R (o,r1,r2,r3) -> r (code o) r1 r2 r3,
			sprintf "%s %s %s %s" (List.assoc o rev_keywords) (rts r1) (rts r2) (rts r3)
		| Incri (r,d) -> i 0b00110 r d, sprintf "incri %s %d" (rts r) d
		| Shi (r,d) -> i 0b00111 r d, sprintf "incri %s %d" (rts r) d
		| J i -> let v = value2 i in j 0b01000 v, sprintf "j %s" (its i)
		| Jal i -> let v = value2 i in j 0b01001 v, sprintf "jal %s" (its i)
		| Jr reg -> r (0b01010,0) reg 0 0, sprintf "jr %s" (rts reg)
		| Jalr reg -> r (0b01010,1) reg 0 0, sprintf "jalr %s" (rts reg)
		| Lw (r1,r2,i) -> k 0b10000 r1 r2 i, sprintf "lw %s %d(%s)" (rts r1) i (rts r2)
		| Sw (r1,r2,i) -> k 0b10001 r1 r2 i, sprintf "sw %s %d(%s)" (rts r1) i (rts r2)
		| Lb (r1,r2,i) -> k 0b10010 r1 r2 i, sprintf "lb %s %d(%s)" (rts r1) i (rts r2)
		| Sb (r1,r2,i) -> k 0b10011 r1 r2 i, sprintf "sb %s %d(%s)" (rts r1) i (rts r2)
		| Lra i -> j 0b01100 (value2 i), sprintf "lra %s" (its i)
		| Lil (r,i) -> (0b11000 lsl 11) lxor (r lsl 8) lxor ((byte 8 (value i)) land 0xFF),
			sprintf "lil %s %s" (rts r) (its i)
		| Lilz (r,i) -> (0b11001 lsl 11) lxor (r lsl 8) lxor ((byte 8 (value i)) land 0xFF),
			sprintf "lilz %s %s" (rts r) (its i)
		| Liu (r,i) -> (0b11010 lsl 11) lxor (r lsl 8) lxor ((byte 8 (value3 i)) land 0xFF),
			sprintf "liu %s %s" (rts r) (its i)
		| Liuz (r,i) -> (0b11011 lsl 11) lxor (r lsl 8) lxor ((byte 8 (value3 i)) land 0xFF),
			sprintf "liuz %s %s" (rts r) (its i) in
	let n = List.length p.text in
	let rev_lbls = Array.make n "" in
	Imap.iter (fun l (v,t) ->
		if t then rev_lbls.(v/2) <- rev_lbls.(v/2) ^ " " ^ l) p.lbls;
	let f instr =
		if rev_lbls.(!pc/2) <> "" then
			printf "\t#%s:\n" rev_lbls.(!pc/2);
		let w,s = get_reps instr in
		printf "%s\t\t# %s\n" (wts w) s;
		pc := !pc + 2 in
	printf "%d %d\n" (2*n) 8;
	List.iter f p.text;
	let n2 = List.fold_left (fun n (_,w) -> if w then n + 2 else n + 1) 0 p.data in
	if n2 > 0 then (
		printf "\n%d %d\n" n2 8;
		let rev_lbls = Array.make n2 "" in
		Imap.iter (fun l (v,t) ->
			if not t then rev_lbls.(v) <- rev_lbls.(v) ^ " " ^ l) p.lbls;
		pc := 0;
		let f2 (b,w) =
			if rev_lbls.(!pc) <> "" then
				printf "\t#%s:\n" rev_lbls.(!pc);
			if w then (
				printf "%s\n" (wts (byte 16 b));
				pc := !pc + 2
			) else (
				printf "%s\n" (bts (byte 8 b));
				pc := !pc + 1) in
		List.iter f2 p.data
	);
	printf "\n"
		
let print_error e sp ep =
    eprintf "File \"%s\", line %d, characters %d-%d:\n%s\n"
        Sys.argv.(1) sp.pos_lnum (sp.pos_cnum - sp.pos_bol)
        (ep.pos_cnum - sp.pos_bol) e

let () =
	let ic = open_in Sys.argv.(1) in
	let lexbuf = Lexing.from_channel ic in
	let p = try Asmpars.program Asmlex.token lexbuf
		with Asmpars.Error -> 
			print_error "Parser error" lexbuf.lex_start_p lexbuf.lex_curr_p;
			close_in ic;
			exit 1
			| Failure "lexing: empty token" ->
				print_error "Lexer error" lexbuf.lex_start_p lexbuf.lex_curr_p;
				close_in ic;
				exit 1 in
	close_in ic;
	print_program p
	
	

