.SECONDARY:

MINIJAZZ=../minijazz/mjc.byte
SCHED=../sched/main.byte
SIM=../csim/csim

%.sim: %.dumb
	$(SIM) $<

%.dumb %_sch.net %_opt.dumb %_sch_opt.net: %.net
	$(SCHED) $<

%.net: %.mj
	$(MINIJAZZ) $<

clean:
	rm *.net
	rm *.dumb
