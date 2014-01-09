/*
    Système Digital
    2013-2014
    Alex AUVOLAT

    sim.c   The code that actually runs the machine
*/

#include <stdlib.h>
#include <stdio.h>

#include "sim.h"

#define DEBUG 0


t_machine *init_machine (t_program *p) {
    int i, j;

    t_machine *m = malloc(sizeof(t_machine));
    m->prog = p;

    // Allocate variables
    m->var_values = malloc(p->n_vars * sizeof(t_value));
    for (i = 0; i < p->n_vars; i++) {
        m->var_values[i] = 0;
        if (p->vars[i].name[0] == '$') {
            // setup constant value
            t_value a = 1;
            char *o = p->vars[i].name + 1;
            while (*o) {
                if (*o == '1') m->var_values[i] |= a;
                a <<= 1;
                o++;
            }
        }
    }

    // Allocate space for registers and rams
    m->reg_data = malloc(p->n_regs * sizeof(t_value));
    for (i = 0; i < p->n_regs; i++) {
        m->reg_data[i] = 0;
    }
    m->ram_data = malloc(p->n_rams * sizeof(t_value*));
    for (i = 0; i < p->n_rams; i++) {
        m->ram_data[i] = malloc(pow2(p->rams[i].addr_size) * sizeof(t_value));
        for (j = 0; j < pow2(p->rams[i].addr_size); j++) {
            m->ram_data[i][j] = 0;
        }
    }

    return m;
}

void machine_banner(t_machine *m, FILE *stream) {
    int i;
    fprintf(stream, "%d %d\n", m->prog->n_inputs, m->prog->n_outputs);
    for (i = 0; i < m->prog->n_inputs; i++) {
        fprintf(stream, "%d %s\n",
                m->prog->vars[m->prog->inputs[i]].size,
                m->prog->vars[m->prog->inputs[i]].name);
    }
    fprintf(stream, "\n");
    fflush(stream);
}

void read_inputs(t_machine *m, FILE *stream) {
    /*  FORMAT :
        For each input in the list, *in the order specified*,
        either '/' followed by the decimal value
        or the binary value
    */
    int i;
    t_id var;
    t_program *p = m->prog;

    int magic;
    fscanf(stream, " %x", &magic);
    if (magic != 0xFEED) {
        fprintf(stderr, "(simulator) Protocol error.\n");
        exit(1);
    }

    if (p->n_inputs == 0) return;       // nothing to do

    for (i = 0; i < p->n_inputs; i++) {
        var = p->inputs[i];
        fscanf(stream, " ");
        if (fscanf(stream, "/%lu", &(m->var_values[var]))) {
            // ok, value is read
        } else if (fscanf(stream, "x%lx", &(m->var_values[var]))) {
            // ok, value is read
        } else {
            m->var_values[var] = read_bool(stream, NULL);
        }
        m->var_values[var] &= p->vars[var].mask;
    }

}

void machine_step(t_machine *m) {
    int i, j;
    t_value a, b, c, d, e, ma, mb, v;
    t_program *p = m->prog;

    // READ REGISTERS && MEMORY
    for (i = 0; i < p->n_regs; i++) {
        m->var_values[p->regs[i].dest] = m->reg_data[i];
        if (DEBUG) fprintf(stderr, "%s <- reg %s : %lx\n",
            p->vars[p->regs[i].dest].name,
            p->vars[p->regs[i].dest].name,
            m->reg_data[i]);
    }

    // DO THE LOGIC
    for (i = 0; i < p->n_eqs; i++) {
        v = 0;
        switch (p->eqs[i].type) {
            case C_COPY:
                v = m->var_values[p->eqs[i].Copy.a];
                break;
            case C_NOT:
                v = ~m->var_values[p->eqs[i].Not.a];
                break;
            case C_BINOP:
                a = m->var_values[p->eqs[i].Binop.a];
                b = m->var_values[p->eqs[i].Binop.b];
                if (p->eqs[i].Binop.op == OP_OR) v = a | b;
                if (p->eqs[i].Binop.op == OP_AND) v = a & b;
                if (p->eqs[i].Binop.op == OP_XOR) v = a ^ b;
                if (p->eqs[i].Binop.op == OP_NAND) v = ~(a & b);
                break;
            case C_MUX:
                a = m->var_values[p->eqs[i].Mux.a];
                b = m->var_values[p->eqs[i].Mux.b];
                c = m->var_values[p->eqs[i].Mux.c];
                ma = m->prog->vars[p->eqs[i].Mux.a].mask;
                if (ma == 1) {
                    v = (a ? c : b);
                } else {
                    v = (a & c) | (~a & b);
                }
                break;
            case C_ROM:
                a = m->var_values[p->eqs[i].Rom.read_addr];
                if (p->eqs[i].Rom.rom != NULL && a < p->eqs[i].Rom.rom->words_defined) {
                    v = p->eqs[i].Rom.rom->data[a];
                } else {
                    v = 0;
                }
                break;
            case C_CONCAT:
                a = m->var_values[p->eqs[i].Concat.a];
                b = m->var_values[p->eqs[i].Concat.b];
                ma = p->vars[p->eqs[i].Concat.a].mask;
                mb = p->vars[p->eqs[i].Concat.b].mask;
                b <<= p->eqs[i].Concat.shift;
                v = a | b;
                if (DEBUG) fprintf (stderr, "concat %lx (&%lx) %lx (&%lx) <%d = %lx .. ",
                    a, ma, b, mb, p->eqs[i].Concat.shift, v);
                break;
            case C_SLICE:
                a = m->var_values[p->eqs[i].Slice.source];
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
                a = m->var_values[p->eqs[i].Select.source];
                v = (a >> p->eqs[i].Select.i) & 1;
                if (DEBUG) fprintf(stderr, "select %d %lx->%lx .. ",
                    p->eqs[i].Select.i, a, v);
                break;
            case C_READRAM:
                a = m->var_values[p->eqs[i].ReadRAM.source];
                v = m->ram_data[p->eqs[i].ReadRAM.ram_id][a];
                if (DEBUG) fprintf(stderr, "Read ram %lx = %lx\n", a, v);
        }
        m->var_values[p->eqs[i].dest_var] = v & (p->vars[p->eqs[i].dest_var].mask);
        if (DEBUG) fprintf(stderr, "%s &%lx : %lx\n",
            p->vars[p->eqs[i].dest_var].name,
            p->vars[p->eqs[i].dest_var].mask,
            m->var_values[p->eqs[i].dest_var]);
    }

    // SAVE REGISTERS && MEMORY
    for (i = 0; i < p->n_regs; i++) {
        m->reg_data[i] = m->var_values[p->regs[i].source];
        if (DEBUG) fprintf(stderr, "reg %s <- %s : %lx\n",
            p->vars[p->regs[i].dest].name,
            p->vars[p->regs[i].source].name,
            m->reg_data[i]);
    }
    for (i = 0; i < p->n_rams; i++) {
        e = m->var_values[p->rams[i].write_enable];
        if (e != 0) {
            a = m->var_values[p->rams[i].write_addr];
            d = m->var_values[p->rams[i].data];
            m->ram_data[i][a] = d;
            if (DEBUG) fprintf(stderr, "Write ram %lx = %lx\n", a, d);
        }
    }
}

void write_outputs(t_machine *m, FILE *stream) {
    /*  FORMAT :
        For each output value, a line in the form
            var_name    binary_value    decimal_value
    */
    int i;
    t_id var;
    t_value v, mask;
    t_program *p = m->prog;

    fprintf(stream, "FED\n");

    for (i = 0; i < p->n_outputs; i++) {
        var = p->outputs[i];
        fprintf(stream, "%s\t", p->vars[var].name);
        v = m->var_values[var];
        mask = p->vars[var].mask;
        while (mask > 0) {
            fprintf(stream, "%d", v & 1);
            v >>= 1;
            mask >>= 1;
        }
        fprintf(stream, "\t%ld\n", m->var_values[var]);
    }
    fprintf(stream, "\n");
    fflush(stream);
}


