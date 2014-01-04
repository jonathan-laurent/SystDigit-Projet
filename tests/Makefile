.SECONDARY:

MINIJAZZ=../minijazz/mjc.byte
SCHED=../sched/sched
SIM=../csim/csim
MON=../monitor/mon

%.mon: _build/%.dumb
	$(MON) $(SIM) -rom decode7 decode7.rom $<

%.sim: _build/%.dumb
	$(SIM) -n 12 $<

_build/%.dumb _build/%.snet _build/%_opt.dumb _build/%_opt.snet: _build/%.net
	$(SCHED) $<

_build/%.net: %.mj _build
	$(MINIJAZZ) $<
	mv `basename -s .mj $<`.net _build

_build:
	mkdir _build

clean:
	rm *.net
	rm *.snet
	rm *.dumb
