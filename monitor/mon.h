#ifndef DEF_MON_H
#define DEF_MON_H

#include <time.h>
#include <stdio.h>
#include <curses.h>

typedef unsigned long long int t_value;

typedef struct {
    char name[32];
    char v_bin[32];
    t_value v_int;
} t_output;

typedef struct {
    char name[32];
    int size;
    char value[32];
} t_input;

typedef enum {
    MS_FINISH,
    MS_RUN,
    MS_AUTO
} t_status;

typedef struct {
    FILE *to_sim, *from_sim;

    int n_inputs, n_outputs;
    t_input *inputs;
    t_output *outputs;

    int step;

    t_status status;

    time_t clk;
} t_mon;

void disp_init();
void disp_display(t_mon *mon);
void disp_finish();

void handle_kbd(t_mon *mon);

int mon_read_prologue(t_mon *mon);  //  nonzero on error
void mon_step(t_mon *mon);
void mon_loop(t_mon *mon);

void mon_handle_command(t_mon *mon, char *c);

#endif
