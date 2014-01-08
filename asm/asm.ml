type reg = int

type imm =
	| Imm of int
	| Lab of string

type fmt_r =
	| Add
	| Sub
	| Mul
	| Div
	| Addu
	| Subu
	| Mulu
	| Divu
	| Or
	| And
	| Xor
	| Nor
	| Lsl
	| Lsr
	| Asr
	| Se
	| Sne
	| Sle
	| Slt
	| Sltu
	| Sleu
	| Jer
	| Jner
	| Jltr
	| Jler
	| Jltru
	| Jleru
	| Lwr
	| Swr
	| Lbr
	| Sbr

type instr =
	| R of (fmt_r * reg * reg * reg)
	| Incri of (reg * int)
	| Shi of (reg * int)
	| J of imm
	| Jal of imm
	| Jr of reg
	| Jalr of reg
	| Lw of (reg * reg * int)
	| Sw of (reg * reg * int)
	| Lb of (reg * reg * int)
	| Sb of (reg * reg * int)
	| Lil of (reg * imm)
	| Lilz of (reg * imm)
	| Liu of (reg * imm)
	| Liuz of (reg * imm)
	| Lra of imm

module Imap = Map.Make(String)

type program = { text : instr list; data : (int * bool) list;
	lbls : (int * bool) Imap.t }

let keywords_r = [
		"add",Add;
		"sub",Sub;
		"mul",Mul;
		"div",Div;
		"addu",Addu;
		"subu",Subu;
		"mulu",Mulu;
		"divu",Divu;
		"or",Or;
		"and",And;
		"xor",Xor;
		"nor",Nor;
		"lsl",Lsl;
		"Asr",Asr;
		"Lsr",Lsr;
		"se",Se;
		"sne",Sne;
		"sle",Sle;
		"slt",Slt;
		"sltu",Sltu;
		"sleu",Sleu;
		"jer",Jer;
		"jner",Jner;
		"jltr",Jltr;
		"jler",Jler;
		"jltru",Jltru;
		"jleru",Jleru;
		"lwr",Lwr;
		"lbr",Lbr;
		"swr",Swr;
		"sbr",Sbr
	]
