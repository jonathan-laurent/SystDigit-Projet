{
	open Asm
	open Asmpars
	
	let keywords_ri = List.map (fun (k,o) -> (k ^ "i",o)) keywords_r
	
	let keywords = [
		"pop",POP;
		"push",PUSH;
		"incri",INCRI;
		"shi",SHI;
		"j",JJ;
		"jal",JAL;
		"jr",JR;
		"jalr",JALR;
		"lw",LW;
		"sw",SW;
		"lb",LB;
		"sb",SB;
		"not",NOT;
		"lil",LIL;
		"lilz",LILZ;
		"liu",LIU;
		"liuz",LIUZ;
		"lra",LRA;
        "la",LA;
		"li",LI;
		"move",MOVE;
		"jz",JZ;
		"jnz",JNZ;
        "asciiz",ASCIIZ;
		"_clock",INT 0x4000;
		"_input",INT 0x4100;
		"_output",INT 0x4102;
		"word",WORD;
		"byte",BYTE
	]
	
	let regs = [
		"Z",0;
		"RA",6;
		"F",6;
		"A",1;
		"B",2;
		"C",3;
		"D",4;
		"E",5;
		"G",7;
		"SP",7
	]
	
	let read_16 n =
		let res = ref 0 in
		for i = 0 to String.length n - 1 do
			res := 16 * !res;
			let v =
				let c = Char.code n.[i] in
				if c >= Char.code '0' && c <= Char.code '9' then c - (Char.code '0')
				else if c >= Char.code 'a' && c <= Char.code 'f' then c - (Char.code 'a') + 10
				else c - (Char.code 'A') + 10 in
			res := !res + v
		done;
		!res
		
	let read_2 n =
		let res = ref 0 in
		for i = 0 to String.length n - 1 do
			res := 2 * !res;
			let v = Char.code n.[i] - Char.code '0' in
			res := !res + v
		done;
		!res
}

let digit = ['0'-'9']
let alpha = ['a'-'z' 'A'-'Z']
let hexdigit = ['a'-'f' 'A'-'F' '0'-'9']

rule token = parse
	| eof { EOF }
	| '#' { comment lexbuf }
	| ['\t' '\r' ' '] { token lexbuf }
	| ':' { COLON }
	| '\n' { Lexing.new_line lexbuf; token lexbuf }
	| ((['a'-'z'] | '_') (alpha | digit | '_')*) as id
		{ try ROP (List.assoc id keywords_r)
			with Not_found -> try RIOP (List.assoc id keywords_ri)
				with Not_found -> try List.assoc id keywords
					with Not_found -> ID id }
	| "0x" (((hexdigit)+) as n)
		{ INT (read_16 n) }
	| (digit)+ as n { INT (int_of_string n) }
	| "0b" (['0' '1']+ as n) { INT (read_2 n) }
    | '"' { STR (lex_str "" lexbuf) }
	| ['A'-'Z']+ as name { try REG (List.assoc name regs) with Not_found -> raise (Asm_error ("no reg " ^ name))}
	| '$' (['0'-'7'] as n) { REG (Char.code n - (Char.code '0')) }
	| ".text" { TEXT }
	| ".data" { DATA }
	| '-' { MINUS }
	| '(' { LP }
	| ')' { RP }

and comment = parse
	| eof { EOF }
	| '\n' { Lexing.new_line lexbuf; token lexbuf }
	| _ { comment lexbuf }

and lex_str q = parse
    | eof { q }
    | '"' { q }
    | "\\\"" { lex_str (q ^ "\"") lexbuf }
    | "\\\\" { lex_str (q ^ "\\") lexbuf }
    | "\\n" { lex_str (q ^ "\n") lexbuf }
    | _ as c { lex_str (q ^ String.make 1 c) lexbuf }
