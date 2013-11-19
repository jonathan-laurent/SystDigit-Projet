#ifndef DEF_SIM_H
#define DEF_SIM_H

#include <stdio.h>

// Gate types
#define C_COPY 0
#define C_NOT 1
#define C_BINOP 2
#define C_MUX 3
#define C_ROM 4
#define C_CONCAT 5
#define C_SLICE 6
#define C_SELECT 7
#define C_READRAM 8

// Binary operators
#define OP_OR 0
#define OP_XOR 1
#define OP_AND 2
#define OP_NAND 3

// Data structures

// Use 64-bit ints as bit arrays. Bit index 0 is bitmask 1, bit index 1 is bitmask 2, etc.
typedef unsigned long long int t_value;

typedef struct _s_rom {
	int addr_size, word_size;
	t_value *data;
	const char *prefix;
	struct _s_rom *next;
} t_rom;

// Identifier for the variables of the circuit.
typedef int t_id;

typedef struct {		// a variable in the simulator
	t_value mask;
	int size;
	char *name;
} t_variable;

typedef struct {
	t_id dest, source;
} t_reg;

typedef struct {
	int addr_size, word_size;
	t_id write_enable, write_addr, data;
} t_ram;

typedef struct {
	int type;
	t_id dest_var;
	union {
		struct {
			t_id a;
		} Copy;
		struct {
			t_id a;
		} Not;
		struct {
			int op;
			t_id a, b;
		} Binop;
		struct {
			t_id a, b, c;
		} Mux;
		struct {
			t_rom *rom;
			t_id read_addr;
		} Rom;
		struct {
			t_id a, b;
			int shift;
		} Concat;
		struct {
			int begin, end;
			t_id source;
		} Slice;
		struct {
			int i;
			t_id source;
		} Select;
		struct {
			int ram_id;
			t_id source;
		} ReadRAM;
	};
} t_equation;


typedef struct {
	int n_vars, n_inputs, n_outputs;
	
	t_variable *vars;
	t_id *inputs, *outputs;

	int n_regs, n_rams;
	t_reg *regs;
	t_ram *rams;

	int n_eqs;
	t_equation *eqs;
} t_program;

// machine = execution instance

typedef struct {
	t_program *prog;
	t_value *var_values;		// indexed by variable ID

	t_value *reg_data;		// indexed by number in register list
	t_value **ram_data;		// indexed by number in ram list
} t_machine;


// The functions for doing stuff with these data structures

// Implemented in load.c
t_program *load_dumb_netlist(FILE *stream);
void add_rom(const char *prefix, FILE *file);

// Implemented in sim.c
t_machine *init_machine(t_program *p);
void read_inputs(t_machine *m, FILE *stream);
void machine_step(t_machine *m);
void write_outputs(t_machine *m, FILE *stream);

// Implemented in util.c
int pow2(int exp);
t_value read_bool(FILE *stream, t_value *mask);
int is_prefix(const char *prefix, const char *str);

#endif
