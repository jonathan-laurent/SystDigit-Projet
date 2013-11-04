#ifndef DEF_SIM_H
#define DEF_SIM_H

// TODO implement ROM

#include <stdio.h>

// Gate types
#define C_ARG 0
#define C_REG 1
#define C_NOT 2
#define C_BINOP 3
#define C_MUX 4
#define C_ROM 5
#define C_RAM 6
#define C_CONCAT 7
#define C_SLICE 8
#define C_SELECT 9

// Binary operators
#define OP_OR 0
#define OP_XOR 1
#define OP_AND 2
#define OP_NAND 3

// Data structures


// Use 64-bit ints as bit arrays. Bit index 0 is bitmask 1, bit index 1 is bitmask 2, etc.
typedef unsigned long long int t_value;
// Identifier for the variables of the circuit.
typedef int t_id;

typedef struct {		// a variable in the simulator
	t_value mask;
	int size;
	char *name;
} t_variable;

typedef struct {
	t_value mask;				// if direct value, mask = all possible bits. Else mask = 0
	union {
		t_value Val;
		t_id SrcVar;		// if source_var == -1 then it's a direct value, else it's that variable
	};
} t_arg;

typedef struct {
	int type;
	t_id dest_var;
	union {
		struct {
			t_arg a;
		} Arg;
		struct {
			t_id var;
		} Reg;
		struct {
			t_arg a;
		} Not;
		struct {
			int op;
			t_arg a, b;
		} Binop;
		struct {
			t_arg a, b, c;
		} Mux;
		struct {
			int addr_size, word_size;
			t_arg read_addr;
		} Rom;
		struct {
			int addr_size, word_size;
			t_arg read_addr, write_enable, write_addr, data;
		} Ram;
		struct {
			t_arg a, b;
		} Concat;
		struct {
			int begin, end;
			t_arg source;
		} Slice;
		struct {
			int i;
			t_arg source;
		} Select;
	};
} t_equation;


typedef struct {
	int n_vars, n_inputs, n_outputs;
	t_variable *vars;
	t_id *inputs, *outputs;

	int n_eqs;
	t_equation *eqs;
} t_program;

// machine = execution instance

typedef union {
	t_value RegVal;
	t_value *RamData;
} t_mem_reg_data;

typedef struct {
	t_program *prog;
	t_value *var_values;		// indexed by variable ID
	t_mem_reg_data *mem_data;	// indexed by equation number
} t_machine;


// The functions for doing stuff with these data structures

t_value read_bool(FILE *stream, t_value* mask);

t_program *load_dumb_netlist(FILE *stream);

t_machine *init_machine(t_program *p);
void read_inputs(t_machine *m, FILE *stream);
void machine_step(t_machine *m);
void write_outputs(t_machine *m, FILE *stream);


#endif
