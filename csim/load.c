/*
	Système Digital
	2013-2014
	Alex AUVOLAT

	load.c	Code for loading dumbed-down netlist files
			(no parsing of .net files !!)
*/

#include <stdlib.h>

#include "sim.h"

t_rom *roms = NULL;

void add_rom(const char *prefix, FILE *file) {
	int i;

	t_rom *rom = malloc(sizeof(t_rom));
	rom->prefix = prefix;

	// Load ROM file
	fscanf(file, "%d %d\n", &(rom->addr_size), &(rom->word_size));
	rom->data = malloc(pow2(rom->addr_size) * sizeof(t_value));

	for (i = 0; i < pow2(rom->addr_size); i++) {
		fscanf(file, " ");
		if (fscanf(file, "/%lu", &(rom->data[i]))) {
			// ok, value is read
		} else {
			rom->data[i] = read_bool(file, NULL);
		}
	}

	rom->next = roms;
	roms = rom;
}

t_program *load_dumb_netlist (FILE *stream) {
	int i, j, as, ws;
	t_rom *r;

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
		fscanf(stream, "%d %d %d %d %d\n",
			&(p->rams[i].addr_size),
			&(p->rams[i].word_size),
			&(p->rams[i].write_enable),
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
					&as, &ws,
					&(p->eqs[i].Rom.read_addr));
				p->eqs[i].Rom.rom = NULL;
				// find corresponding ROM
				for (r = roms; r != NULL; r = r->next) {
					if (is_prefix(r->prefix, p->vars[p->eqs[i].dest_var].name)) {
						if (r->addr_size == as && r->word_size == ws) {
							p->eqs[i].Rom.rom = r;
							break;
						} else {
							fprintf(stderr,
								"Error: ROM prefixed by '%s' does not have size corresponding to variable that uses it.\n",
								r->prefix);
						}
					}
				}
				if (p->eqs[i].Rom.rom == NULL)
					fprintf(stderr, "Warning: ROM variable '%s' has no ROM data.\n",
						p->vars[p->eqs[i].dest_var].name);
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
				fscanf(stream, "%d %d ",
					&(p->eqs[i].Select.i),
					&(p->eqs[i].Select.source));
				break;
			case C_READRAM:
				fscanf(stream, "%d %d ",
					&(p->eqs[i].ReadRAM.ram_id),
					&(p->eqs[i].ReadRAM.source));
				break;
		}
	}

	return p;
}
