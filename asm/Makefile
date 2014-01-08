
all: asm

asm: assembler.ml asm.ml asmlex.mll asmpars.mly
	ocamlbuild assembler.native
	mv assembler.native asm

clean:
	rm asm
	rm -r _build
