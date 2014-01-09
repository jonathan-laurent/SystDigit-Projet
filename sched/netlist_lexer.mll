{
open Netlist_parser
open Lexing
exception Eof

let keyword_list =
[
  "AND", AND;
  "CONCAT", CONCAT;
  "IN", IN;
  "INPUT", INPUT;
  "MUX", MUX;
  "NAND", NAND;
  "NOT", NOT;
  "OR", OR;
  "OUTPUT", OUTPUT;
  "RAM", RAM;
  "REG", REG;
  "ROM", ROM;
  "SELECT", SELECT;
  "SLICE", SLICE;
  "VAR", VAR;
  "XOR", XOR;
]

let newline lexbuf =
  let pos = lexbuf.lex_curr_p in
  lexbuf.lex_curr_p <- 
    { pos with pos_lnum = pos.pos_lnum + 1; pos_bol = pos.pos_cnum }

}

rule token = parse
  | '\n'          { newline lexbuf ; token lexbuf }
  |  [' ' '\t']     { token lexbuf }     (* skip blanks *)
  | "="            { EQUAL }
  | ":"            { COLON }
  | ","            { COMMA }
  | ['0'-'9']+ as lxm { INT(lxm) }
  | ('_' ? ['A'-'Z' 'a'-'z']('_' ? ['A'-'Z' 'a'-'z' ''' '0'-'9']) * as id)
      { let s = Lexing.lexeme lexbuf in
        try List.assoc s keyword_list
        with Not_found -> NAME id }
  | eof            { EOF }
