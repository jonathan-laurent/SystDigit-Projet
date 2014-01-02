.SECONDARY:

GENERATOR=netlist_ast.ml netlist_gen.ml netlist_gen.mli 
AUXILLARY=alu.ml

SCHED=../sched/main.native
SIM=../csim/csim

all: _build/cpu_opt.dumb
	$(SIM) -rom ROM0 prog_rom0.rom $<

%.sim: _build/%.dumb
	$(SIM) $<

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
