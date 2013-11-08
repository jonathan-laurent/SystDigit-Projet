.SECONDARY:

MINIJAZZ=../minijazz/mjc.byte
SCHED=../sched/main.byte
SIM=../csim/csim

%.sim: %.dumb
	$(SIM) $<

%.dumb %.snet %_opt.dumb %_opt.snet: %.net
	$(SCHED) $<

%.net: %.mj
	$(MINIJAZZ) $<

clean:
	rm *.net
	rm *.snet
	rm *.dumb
