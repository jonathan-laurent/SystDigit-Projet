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
typedef unsigned long long int t_value;
typedef int t_id;

typedef struct {		// a variable in the simulator
	t_value mask;
	int size;
	char *name;
} t_variable;

typedef struct {
	t_value val;
	t_id source_var;		// if source_var == -1 then it's a direct value, else it's that variable
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
	t_value r_val;
	t_value *mem_val;
} t_mem_reg_data;

typedef struct {
	t_program *prog;
	t_value *var_values;
	t_mem_reg_data *mem_data;
} t_machine;


// The functions for doing stuff with these data structures

t_program *load_dumb_netlist(FILE *stream);
t_machine *init_machine(t_program *p);
void read_inputs(t_machine *m, FILE *stream);
void machine_step(t_machine *m);
void write_outputs(t_machine *m, FILE *stream);


#endif
