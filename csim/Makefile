csim: main.o load.o sim.o util.o
	gcc -o csim $^

%.o: %.c
	gcc -c $< -o $@ -O2 -g
