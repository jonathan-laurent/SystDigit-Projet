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
		"li",LI;
		"move",MOVE;
		"jz",JZ;
		"jnz",JNZ;
		"_clock",INT 0x4000;
		"_input",INT 0x4100;
		"_output",INT 0x4102;
		"word",WORD;
		"byte",BYTE;
		"hlt",HLT;
		"ascii",ASCII
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
	
	let vald d = Char.code d - (Char.code '0')
	
	let valh d =
		let c = Char.code d in
		if c >= Char.code '0' && c <= Char.code '9' then c - (Char.code '0')
		else if c >= Char.code 'a' && c <= Char.code 'f' then c - (Char.code 'a') + 10
		else c - (Char.code 'A') + 10
	
	let read_16 n =
		let res = ref 0 in
		for i = 0 to String.length n - 1 do
			res := 16 * !res;
			let v = valh n.[i] in
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
    | "'\\n'" { INT (Char.code '\n') }
    | "'\\t'" { INT (Char.code '\t') }
    | "'\\r'" { INT (Char.code '\r') }
    | "'" (_ as c) "'" { INT (Char.code c) }
	| (digit)+ as n { INT (int_of_string n) }
	| "0b" (['0' '1']+ as n) { INT (read_2 n) }
	| ['A'-'Z']+ as name { try REG (List.assoc name regs) with Not_found -> raise (Asm_error ("no reg " ^ name))}
	| '$' (['0'-'7'] as n) { REG (Char.code n - (Char.code '0')) }
	| ".text" { TEXT }
	| ".data" { DATA }
	| '-' { MINUS }
	| '(' { LP }
	| ')' { RP }
	| '"' { str [] lexbuf }

and str acc = parse
	| "\\\\" { str ('\\' :: acc) lexbuf }
	| '"' { STR (List.rev ('\000' :: acc)) }
	| "\\t" { str ('\t' :: acc) lexbuf }
	| "\\n" { str ('\n' :: acc) lexbuf }
	| "\\r" { str ('\r' :: acc) lexbuf }
	| "\\\"" { str ('"' :: acc) lexbuf }
	| "\\a"  { str ((Char.chr 7) :: acc) lexbuf }
	| '\\' (digit as d1) (digit as d2) (digit as d3)
		{ let c = 100 * (vald d1) + 10 * (vald d2) + (vald d3) in
			str ((Char.chr c) :: acc) lexbuf }
	| "\\x" (hexdigit as h1) (hexdigit as h2)
		{ let c = 16 * (valh h1) + (valh h2) in
			str ((Char.chr c)::acc) lexbuf }
	| eof { raise Lexer_error }
	| '\n' { raise Lexer_error }
	| [^ '\\' '"' '\n'] as c { str (c::acc) lexbuf }

and comment = parse
	| eof { EOF }
	| '\n' { Lexing.new_line lexbuf; token lexbuf }
	| _ { comment lexbuf }

