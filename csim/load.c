/*
	Système Digital
	2013-2014
	Alex AUVOLAT

	load.c	Code for loading dumbed-down netlist files
			(no parsing of .net files !!)
*/

#include <stdlib.h>

#include "sim.h"


t_program *load_dumb_netlist (FILE *stream) {
	int i, j;

	// let us suppose that the input to be read is well-formed.
	t_program *p = malloc(sizeof(t_program));
	
	// Read variable list, with sizes and identifiers
	fscanf(stream, "%d ", &(p->n_vars));
	p->vars = malloc(p->n_vars * sizeof(t_variable));
	
	for (i = 0; i < p->n_vars; i++) {
		fscanf(stream, "%d ", &(p->vars[i].size));
		for(j = 0; j < p->vars[i].size; j++) {
			p->vars[i].mask = (p->vars[i].mask << 1) | 1;
		}

		p->vars[i].name = malloc(42);	// let's bet that the name of a variable will never be longer than 42 chars
		fscanf(stream, "%s\n", p->vars[i].name);

		if (p->vars[i].size >= 8*sizeof(t_value)) {
			fprintf(stderr, "Warning: variable %s might be too big for machine integers.\n", p->vars[i].name);
		}
	}

	// read input list
	fscanf(stream, "%d ", &(p->n_inputs));
	p->inputs = malloc(p->n_inputs * sizeof(t_id));
	for (i = 0; i < p->n_inputs; i++) {
		fscanf(stream, "%d ", &(p->inputs[i]));
	}
	// read output list
	fscanf(stream, "%d ", &(p->n_outputs));
	p->outputs = malloc(p->n_outputs * sizeof(t_id));
	for (i = 0; i < p->n_outputs; i++) {
		fscanf(stream, "%d ", &(p->outputs[i]));
	}

	// read register list
	fscanf(stream, "%d", &(p->n_regs));
	p->regs = malloc(p->n_regs * sizeof(t_reg));
	for (i = 0; i < p->n_regs; i++) {
		fscanf(stream, "%d %d\n", &(p->regs[i].dest), &(p->regs[i].source));
	}
	// read RAM list
	fscanf(stream, "%d", &(p->n_rams));
	p->rams = malloc(p->n_rams * sizeof(t_ram));
	for (i = 0; i < p->n_rams; i++) {
		fscanf(stream, "%d %d %d %d %d %d %d\n",
			&(p->rams[i].dest),
			&(p->rams[i].addr_size),
			&(p->rams[i].word_size),
			&(p->rams[i].read_addr), &(p->rams[i].write_enable),
			&(p->rams[i].write_addr), &(p->rams[i].data));
	}

	// read equation list
	fscanf(stream, "%d ", &(p->n_eqs));
	p->eqs = malloc(p->n_eqs * sizeof(t_equation));
	for (i = 0; i < p->n_eqs; i++) {
		fscanf(stream, "%d ", &(p->eqs[i].dest_var));
		fscanf(stream, "%d ", &(p->eqs[i].type));
		switch (p->eqs[i].type) {
			case C_COPY:
				fscanf(stream, "%d ", &(p->eqs[i].Copy.a));
				break;
			case C_NOT:
				fscanf(stream, "%d ", &(p->eqs[i].Not.a));
				break;
			case C_BINOP:
				fscanf(stream, "%d %d %d ",
					&(p->eqs[i].Binop.op),
					&(p->eqs[i].Binop.a),
					&(p->eqs[i].Binop.b));
				break;
			case C_MUX:
				fscanf(stream, "%d %d %d ",
					&(p->eqs[i].Mux.a),
					&(p->eqs[i].Mux.b),
					&(p->eqs[i].Mux.c));
				break;
			case C_ROM:
				fscanf(stream, "%d %d %d ",
					&(p->eqs[i].Rom.addr_size),
					&(p->eqs[i].Rom.word_size),
					&(p->eqs[i].Rom.read_addr));
				break;
			case C_CONCAT:
				fscanf(stream, "%d %d ",
					&(p->eqs[i].Concat.a),
					&(p->eqs[i].Concat.b));
				p->eqs[i].Concat.shift = p->vars[p->eqs[i].Concat.a].size;
				break;
			case C_SLICE:
				fscanf(stream, "%d %d %d ",
					&(p->eqs[i].Slice.begin),
					&(p->eqs[i].Slice.end),
					&(p->eqs[i].Slice.source));
				break;
			case C_SELECT:
				fscanf(stream, "%d %d ", &(p->eqs[i].Select.i),
					&(p->eqs[i].Select.source));
				break;
		}
	}

	return p;
}
