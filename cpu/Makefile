.SECONDARY:

GENERATOR=netlist_ast.ml netlist_gen.ml netlist_gen.mli 
AUXILLARY=alu.ml

SCHED=../sched/sched
SIM=../csim/csim
MON=../monitor/mon
ASM=../asm/asm

all: _build/cpu_opt.dumb os.rom
	$(MON) $(SIM) -rom ROM0 os.rom $<

os.rom: os.asm
	$(ASM) $< > $@

%.sim: _build/%.dumb
	$(SIM) -n 12 $<

_build/%.dumb _build/%.snet _build/%_opt.dumb _build/%_opt.snet: _build/%.net
	$(SCHED) $<

_build/%.net: _build/%.native
	./$< > $@

_build/%.native: $(GENERATOR) $(AUXILLARY) %.ml
	ocamlbuild `basename $@`
	# remove stupid symbolic link
	rm `basename $@`


clean:
	rm -rf _build
