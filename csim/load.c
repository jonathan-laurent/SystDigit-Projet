/*
	Système Digital
	2013-2014
	Alex AUVOLAT

	load.c	Code for loading dumbed-down netlist files
			(no parsing of .net files !!)
*/

#include <stdlib.h>

#include "sim.h"

void read_arg(FILE *stream, t_arg *dest) {
	if (fscanf(stream, "$%Ld ", &(dest->val)) > 0) {
		dest->source_var = -1;
	} else {
		fscanf(stream, "%d ", &(dest->source_var));
	}
}

t_program *load_dumb_netlist (FILE *stream) {
	int i;

	// let us suppose that the input to be read is well-formed.
	t_program *p = malloc(sizeof(t_program));
	
	// Read variable list, with sizes and identifiers
	fscanf(stream, "%d ", &(p->n_vars));
	p->vars = malloc(p->n_vars * sizeof(t_variable));
	
	for (i = 0; i < p->n_vars; i++) {
		fscanf(stream, "%d ", &(p->vars[i].size));
		p->vars[i].mask = (0xFFFFFFFFFFFFFFFF >> (64 - p->vars[i].size));

		p->vars[i].name = malloc(42);	// let's bet that the name of a variable will never be longer than 42 chars
		fscanf(stream, "%s\n", p->vars[i].name);
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

	// read equation list
	fscanf(stream, "%d ", &(p->n_eqs));
	p->eqs = malloc(p->n_eqs * sizeof(t_equation));
	for (i = 0; i < p->n_eqs; i++) {
		fscanf(stream, "%d ", &(p->eqs[i].dest_var));
		fscanf(stream, "%d ", &(p->eqs[i].type));
		switch (p->eqs[i].type) {
			case C_ARG:
				read_arg(stream, &(p->eqs[i].Arg.a));
				break;
			case C_REG:
				fscanf(stream, "%d ", &(p->eqs[i].Reg.var));
				break;
			case C_NOT:
				read_arg(stream, &(p->eqs[i].Not.a));
				break;
			case C_BINOP:
				fscanf(stream, "%d ", &(p->eqs[i].Binop.op));
				read_arg(stream, &(p->eqs[i].Binop.a));
				read_arg(stream, &(p->eqs[i].Binop.b));
				break;
			case C_MUX:
				read_arg(stream, &(p->eqs[i].Mux.a));
				read_arg(stream, &(p->eqs[i].Mux.b));
				read_arg(stream, &(p->eqs[i].Mux.c));
				break;
			case C_ROM:
				fscanf(stream, "%d %d ", &(p->eqs[i].Rom.addr_size), &(p->eqs[i].Rom.word_size));
				read_arg(stream, &(p->eqs[i].Rom.read_addr));
				break;
			case C_RAM:
				fscanf(stream, "%d %d ", &(p->eqs[i].Ram.addr_size), &(p->eqs[i].Ram.word_size));
				read_arg(stream, &(p->eqs[i].Ram.read_addr));
				read_arg(stream, &(p->eqs[i].Ram.write_enable));
				read_arg(stream, &(p->eqs[i].Ram.write_enable));
				read_arg(stream, &(p->eqs[i].Ram.data));
				break;
			case C_CONCAT:
				read_arg(stream, &(p->eqs[i].Mux.a));
				read_arg(stream, &(p->eqs[i].Mux.b));
				break;
			case C_SLICE:
				fscanf(stream, "%d %d ", &(p->eqs[i].Slice.begin), &(p->eqs[i].Slice.end));
				read_arg(stream, &(p->eqs[i].Slice.source));
				break;
			case C_SELECT:
				fscanf(stream, "%d ", &(p->eqs[i].Select.i));
				read_arg(stream, &(p->eqs[i].Select.source));
				break;
		}
	}
}
