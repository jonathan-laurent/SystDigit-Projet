#include <stdlib.h>
#include <unistd.h>

#include "mon.h"

int mon_read_prologue(t_mon *mon) {
    int i;

    if (fscanf(mon->from_sim, " %d %d\n", &mon->n_inputs, &mon->n_outputs) == EOF)
        return -1;

    mon->inputs = malloc(mon->n_inputs * sizeof(t_input));
    mon->outputs = malloc(mon->n_outputs * sizeof(t_output));

    // Read input description
    for (i = 0; i < mon->n_inputs; i++) {
        mon->inputs[i].value[0] = '0';
        mon->inputs[i].value[1] = 0;
        if (fscanf(mon->from_sim, "%d %s\n", &mon->inputs[i].size, mon->inputs[i].name) == EOF)
            return -(i+2);
    }

    // Zeroify output description
    for (i = 0; i < mon->n_outputs; i++) {
        mon->outputs[i].name[0] = 0;
        mon->outputs[i].v_bin[0] = 0;
        mon->outputs[i].v_int = 0;
    }

    mon->step = 0;
    mon->status = MS_RUN;

    mon->clk = time(NULL);

    return 0;
}

void mon_loop(t_mon *mon) {
    disp_display(mon);
    while (mon->status != MS_FINISH) {
        handle_kbd(mon);
        if (mon->status == MS_AUTO) {
            mon_step(mon);
        } else {
            usleep(10000);
        }
    }
}

void mon_handle_command(t_mon *mon, char *c) {
    if (c[0] == 0) {    // empty command : run step
        mon_step(mon);
    } else if (!strcmp(c, "q")) {
        mon->status = MS_FINISH;
    } else if (!strcmp(c, "a")) {
        mon->status = MS_AUTO;
    } else if (!strcmp(c, "m")) {
        mon->status = MS_RUN;
    }
}

void mon_step(t_mon *mon) {
    int i = 0;

    // Get ticker
    time_t new_clk = time(NULL);
    int ticker = new_clk - mon->clk;
    mon->clk = new_clk;
    
    // Send inputs to simulator
    for (i = 0; i < mon->n_inputs; i++) {
        fprintf(mon->to_sim, "%s\n", mon->inputs[i].value);
    }

    // Read outputs from simulator
    for (i = 0; i < mon->n_outputs; i++) {
        fscanf(mon->from_sim, "%s %s %d\n",
            mon->outputs[i].name,
            mon->outputs[i].v_bin,
            &mon->outputs[i].v_int);
    }
    
    // Display
    mon->step++;
    disp_display(mon);
}
