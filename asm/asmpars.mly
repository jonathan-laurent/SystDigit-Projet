%{
	open Asm
	
	let unsigned = function
		| Addu
		| Subu
		| Mulu
		| Divu
		| Sltu
		| Sleu
		| Jltru
		| Jleru
			-> true
		| _ -> false
			
	let pc = ref 0
	
	let ram = ref 0x8000
	
	let add r i = r := !r + i
	
	let lbls2 = ref (Imap.empty)
	
	let li u r = function
		| Imm i ->
			if u then
				if i < 1 lsl 8 then (add pc 2; [Lilz (r,Imm i)])
				else (add pc 4; [Lil (r,Imm (i land 0x00FF)); Liu (r,Imm ((i land 0xFF00) lsr 8))])
			else if i >=0 && i < 1 lsl 7 then
				(add pc 2; [Lilz (r,Imm i)])
			else if i < 0 && i >= - ( 1 lsl 7 ) then
				(add pc 4; [Lil (r,Imm i); Liu (r,Imm 0xFF)])
			else (add pc 4; [Lil (r,Imm (i land 0x00FF)); Liu (r,Imm ((i land 0xFF00) asr 8))])
		| Lab id ->
			add pc 4; [Lilz (r,Lab id); Liu (r,Lab id)]
			
	let itw = function
		| Imm i -> Word i
		| Lab l -> Wlab l
	
%}

%token EOF,COLON,TEXT,DATA,BYTE,WORD,MINUS,MOVE,JZ,JNZ,LP,RP,HLT,ASCII,NLB
%token POP,PUSH,INCRI,SHI,JJ,JAL,JR,JALR,LW,SW,LB,SB,NOT,LIL,LILZ,LIU,LIUZ,LRA,LI
%token<Asm.reg> REG
%token<Asm.fmt_r> ROP,RIOP
%token<string> ID
%token<char list> STR
%token<int> INT

%start<Asm.program> program

%%

program:
	NLB* TEXT NLB* is=instr* data? EOF
	{ { text = List.flatten is;
		lbls = !lbls2 } }
	
data:
	DATA NLB* d=datas* { d }
	
datas:
	| labeld NLB* datas { () }
	| BYTE n=INT NLB+ { add ram n }
	| WORD n=INT NLB+ { add ram (2*n) }
	
labeli:
  id=ID COLON { lbls2 := Imap.add id (!pc,true) !lbls2 }

labeld:
  id=ID COLON { lbls2 := Imap.add id (!ram,false) !lbls2 }

instr:
	| labeli NLB* i=instr { i }
	| i=_instr NLB+ { i }
	
_instr:
	| o=ROP r1=REG r2=REG r3=REG { add pc 2; [R (o,r1,r2,r3)] }
	| o=RIOP r1=REG r2=REG imm=imm
		{ let l = li (unsigned o) 5 imm in
			add pc 2; l @ [R (o,r1,r2,5)] }
	| INCRI r=REG i=int { 
		if i >= - (1 lsl 7) && i < 1 lsl 7 then
			(add pc 2; [Incri (r,i)])
		else let l = li false 5 (Imm i) in
			(add pc 2; l @ [R (Add,r,r,5)]) }
	| SHI r=REG i=int { add pc 2; [Shi (r,i)] }
	| JJ i=imm { add pc 2; [J i] }
	| LI r=REG i=imm { li false r i }
	| JR r=REG { add pc 2; [Jr r] }
	| JAL i=imm { add pc 2; [Jal i] }
	| JALR r=REG { add pc 2; [Jalr r] }
	| LW r1=REG i=int LP r2=REG RP {
		if i >= - (1 lsl 4) && i < 1 lsl 4 then
			(add pc 2; [Lw (r1,r2,i)])
		else let l = li false 5 (Imm i) in
			(add pc 2; l @ [R (Lwr,r1,r2,5)]) }
	| SW r1=REG i=int LP r2=REG RP {
		if i >= - (1 lsl 4) && i < 1 lsl 4 then
			(add pc 2; [Sw (r1,r2,i)])
		else let l = li false 5 (Imm i) in
			(add pc 2; l @ [R (Swr,r1,r2,5)]) }
	| LB r1=REG i=int LP r2=REG RP {
		if i >= - (1 lsl 4) && i < 1 lsl 4 then
			(add pc 2; [Lb (r1,r2,i)])
		else let l = li false 5 (Imm i) in
			(add pc 2; l @ [R (Lbr,r1,r2,5)]) }
	| SB r1=REG i=int LP r2=REG RP {
		if i >= - (1 lsl 4) && i < 1 lsl 4 then
			(add pc 2; [Sb (r1,r2,i)])
		else let l = li false 5 (Imm i) in
			(add pc 2; l @ [R (Sbr,r1,r2,5)]) }
	| LW r1=REG l=ID { let l = li false 5 (Lab l) in
		add pc 2; l @ [Lw (r1,5,0)] }
	| LB r1=REG l=ID { let l = li false 5 (Lab l) in
		add pc 2; l @ [Lb (r1,5,0)] }
	| SW r1=REG l=ID { let l = li false 5 (Lab l) in
		add pc 2; l @ [Sw (r1,5,0)] }
	| SB r1=REG l=ID { let l = li false 5 (Lab l) in
		add pc 2; l @ [Sb (r1,5,0)] }
	| LRA i=int { assert (i > -(1 lsl 10) && i < 1 lsl 10);
		add pc 2; [Lra (Imm i)] }
	| LRA l=ID { add pc 2; [Lra (Lab l)] }
	| LIL r=REG i=int { add pc 2; [Lil (r,Imm i)] } 
	| LILZ r=REG i=int { add pc 2; [Lilz (r,Imm i)] }
	| LIU r=REG i=int { add pc 2; [Liu (r,Imm i)] }
	| LIUZ r=REG i=int { add pc 2; [Liuz (r,Imm i)] }
	| MOVE r1=REG r2=REG { add pc 2; [R (Add,r1,r2,0)] }
	| NOT r1=REG r2=REG { add pc 2; [R (Nor,r1,r2,0)] }
	| JZ r=REG l=ID { let l = li false 5 (Lab l) in
		add pc 2; l @ [R (Jer,5,r,0)] }
	| JNZ r=REG l=ID { let l = li false 5 (Lab l) in
		add pc 2; l @ [R (Jner,5,r,0)] }
	| POP r=REG { add pc 4; [Lw (r,7,0); Incri (7,2)] }
	| PUSH r=REG { add pc 4; [Incri (7,-2); Sw (r,7,0)] }
	| BYTE bs=int+ { List.map (fun b -> add pc 1; Byte b) bs }
	| WORD ws=imm+ { List.map (fun w -> add pc 2; itw w) ws }
	| HLT { add pc 2; [Hlt] }
	| ASCII s=STR { List.map (fun c -> add pc 1; Byte (Char.code c)) s }

imm:
  | id=ID { Lab id }
  | n=int { Imm n }

int:
  | n=INT { n }
  | MINUS n=INT { - n }
