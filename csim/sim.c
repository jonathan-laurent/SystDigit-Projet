/*
	Système Digital
	2013-2014
	Alex AUVOLAT

	sim.c	The code that actually runs the machine
*/

#include <stdlib.h>
#include <stdio.h>

#include "sim.h"

#define DEBUG 0

// Util

int pow2(int exp) {
	if (exp == 0) return 1;
	if (exp == 1) return 2;
	int k = pow2(exp / 2);
	return (exp % 2 == 0 ? k * k : 2 * k * k);
}

// The code

t_machine *init_machine (t_program *p) {
	int i, j;

	t_machine *m = malloc(sizeof(t_machine));
	m->prog = p;

	m->var_values = malloc(p->n_vars * sizeof(t_value));
	for (i = 0; i < p->n_vars; i++) {
		m->var_values[i] = 0;
	}

	m->mem_data = malloc(p->n_eqs * sizeof(t_value));
	for (i =0; i < p->n_eqs; i++) {
		if (p->eqs[i].type == C_REG) {
			m->mem_data[i].RegVal = 0;
		} else if (p->eqs[i].type == C_RAM) {
			m->mem_data[i].RamData = malloc(pow2(p->eqs[i].Ram.addr_size) * sizeof(t_value));
			for (j = 0; j < pow2(p->eqs[i].Ram.addr_size); j++) {
				m->mem_data[i].RamData[j] = 0;
			}
		} else {
			// Leave uninitialized. Not as if anybody cares.
		}
	}
	
	return m;
}

void read_inputs(t_machine *m, FILE *stream) {
	/*	FORMAT :
		For each input in the list, *in the order specified*,
		the binary value for that variable.
	*/
	int i;
	t_id var;
	t_program *p = m->prog;

	if (p->n_inputs == 0) return;		// nothing to do

	for (i = 0; i < p->n_inputs; i++) {
		var = p->inputs[i];
		fscanf(stream, " ");
		m->var_values[var] = read_bool(stream, NULL);
	}

}

t_value get_var(t_machine *m, t_arg a) {
	if (a.mask == 0) return m->var_values[a.SrcVar];
	return a.Val;
}

t_value get_mask(t_machine *m, t_arg a) {
	if (a.mask == 0) return m->prog->vars[a.SrcVar].mask;
	return a.mask;
}

void machine_step(t_machine *m) {
	int i, j;
	t_value a, b, c, d, e, ma, mb, v;
	t_program *p = m->prog;

	// READ REGISTERS && MEMORY
	for (i = 0; i < p->n_eqs; i++) {
		if (p->eqs[i].type == C_REG) {
			m->var_values[p->eqs[i].dest_var] = m->mem_data[i].RegVal;
		} else if (p->eqs[i].type == C_RAM) {
			e = get_var(m, p->eqs[i].Ram.write_enable);
			if (e == 0) {
				a = get_var(m, p->eqs[i].Ram.read_addr);
				m->var_values[p->eqs[i].dest_var] = m->mem_data[i].RamData[a];
				if (DEBUG) fprintf(stderr, "Read ram %lx = %lx\n", a, m->mem_data[i].RamData[a]);
			}
		}
	}

	// DO THE LOGIC
	for (i = 0; i < p->n_eqs; i++) {
		if (p->eqs[i].type == C_REG || p->eqs[i].type == C_RAM) continue;
		v = 0;
		switch (p->eqs[i].type) {
			case C_ARG:
				v = get_var(m, p->eqs[i].Arg.a);
				break;
			case C_NOT:
				v = ~get_var(m, p->eqs[i].Not.a);
				break;
			case C_BINOP:
				a = get_var(m, p->eqs[i].Binop.a);
				b = get_var(m, p->eqs[i].Binop.b);
				if (p->eqs[i].Binop.op == OP_OR) v = a | b;
				if (p->eqs[i].Binop.op == OP_AND) v = a & b;
				if (p->eqs[i].Binop.op == OP_XOR) v = a ^ b;
				if (p->eqs[i].Binop.op == OP_NAND) v = ~(a & b);
				break;
			case C_MUX:
				a = get_var(m, p->eqs[i].Mux.a);
				b = get_var(m, p->eqs[i].Mux.b);
				c = get_var(m, p->eqs[i].Mux.c);
				ma = get_mask(m, p->eqs[i].Mux.a);
				if (ma == 1) {
					v = (a ? c : b);
				} else {
					v = (a & c) | (~a & b);
				}
				break;
			case C_ROM:
				// TODO
				break;
			case C_CONCAT:
				a = get_var(m, p->eqs[i].Concat.a);
				b = get_var(m, p->eqs[i].Concat.b);
				ma = get_mask(m, p->eqs[i].Concat.a);
				mb = get_mask(m, p->eqs[i].Concat.b);
				while (ma & mb) {
					mb <<= 1;
					b <<= 1;
				}
				v = (a & ma) | (b & mb);
				if (DEBUG) fprintf (stderr, "concat %lx (%lx), %lx (%lx) = %lx .. ", a, ma, b, mb, v);
				break;
			case C_SLICE:
				a = get_var(m, p->eqs[i].Slice.source);
				ma = 1;
				mb = 0;
				for (j = 0; j <= p->eqs[i].Slice.end; j++) { 
					if (j >= p->eqs[i].Slice.begin) mb |= ma;
					ma <<= 1;
				}
				v = (a & mb) >> p->eqs[i].Slice.begin;
				if (DEBUG) fprintf(stderr, "slice %d-%d m=%lx %lx->%lx .. ",
					p->eqs[i].Slice.begin,
					p->eqs[i].Slice.end,
					mb, a, v);
				break;
			case C_SELECT:
				a = get_var(m, p->eqs[i].Select.source);
				v = (a >> p->eqs[i].Select.i) & 1;
				if (DEBUG) fprintf(stderr, "select %d %lx->%lx .. ",
					p->eqs[i].Select.i, a, v);
				break;
		}
		m->var_values[p->eqs[i].dest_var] = v & (p->vars[p->eqs[i].dest_var].mask);
		if (DEBUG) fprintf(stderr, "%s &%lx : %lx\n", p->vars[p->eqs[i].dest_var].name, p->vars[p->eqs[i].dest_var].mask, m->var_values[p->eqs[i].dest_var]);
	}

	// SAVE REGISTERS && MEMORY
	for (i = 0; i < p->n_eqs; i++) {
		if (p->eqs[i].type == C_REG) {
			m->mem_data[i].RegVal = m->var_values[p->eqs[i].Reg.var];
		} else if (p->eqs[i].type == C_RAM) {
			e = get_var(m, p->eqs[i].Ram.write_enable);
			if (e != 0) {
				a = get_var(m, p->eqs[i].Ram.write_addr);
				d = get_var(m, p->eqs[i].Ram.data);
				printf("Write ram %lx = %lx\n", a, d);
				m->mem_data[i].RamData[a] = d;
			}
		}
	}
}

void write_outputs(t_machine *m, FILE *stream) {
	/*	FORMAT :
		For each output value, a line in the form
			var_name	binary_value
	*/
	int i;
	t_id var;
	t_program *p = m->prog;

	for (i = 0; i < p->n_outputs; i++) {
		var = p->outputs[i];
		fprintf(stream, "%s\t", p->vars[var].name);
		t_value v = m->var_values[var];
		t_value mask = p->vars[var].mask;
		while (mask > 0) {
			fprintf(stream, "%d", v & 1);
			v >>= 1;
			mask >>= 1;
		}
		fprintf(stream, "\n");
	}
	fprintf(stream, "\n");
}


