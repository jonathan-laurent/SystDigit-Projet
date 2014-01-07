#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#include "mon.h"

#define ABS(x) ((x)>0?(x):-(x))

/*
    Monitor commands :
    (empty cmd)         Send input & update output
    q                   Quit
    a                   Set automatic mode (send input all the time)
    m                   Set manual mode (send input when user sends empty command)
    f <freq>            Set frequency mode (every second, do 'freq' steps)
    i <id> <v>          Set input #id to value v (v is a string, transmitted as-is to simulator)
    tf                  Tick fast (send 1 every cycle)
    ts                  Tick for every second
    tz                  Tick zero all the time
    t <id>              Set ticker input to #id
    t                   Set no ticker input
    s <i1> <i2> <i3>    Set parameters for serial I/O
                        i1 : input for serial input
                        i2 : output for serial input busy signal
                        i3 : output for serial output
    s                   Set no serial input
    :<text>             Send text to serial
    d7 x x ...          Set outputs to be interpreted as 7-bar digit displayer (up to 8 outputs, use - for no output)
*/

int mon_read_prologue(t_mon *mon) {
    int i;

    if (fscanf(mon->from_sim, " %d", &mon->n_inputs) == EOF) return -1;
    if (fscanf(mon->from_sim, " %d", &mon->n_outputs) == EOF) return -1;

    mon->inputs = malloc(mon->n_inputs * sizeof(t_input));
    mon->outputs = malloc(mon->n_outputs * sizeof(t_output));

    // Read input description
    for (i = 0; i < mon->n_inputs; i++) {
        mon->inputs[i].value[0] = '0';
        mon->inputs[i].value[1] = 0;
        if (fscanf(mon->from_sim, " %d", &mon->inputs[i].size) == EOF) return -1;
        if (fscanf(mon->from_sim, " %s", mon->inputs[i].name) == EOF) return -1;
    }

    // Zeroify output description
    for (i = 0; i < mon->n_outputs; i++) {
        mon->outputs[i].name[0] = 0;
        mon->outputs[i].v_bin[0] = 0;
        mon->outputs[i].v_int = 0;
    }

    mon->step = 0;
    mon->status = MS_RUN;

    mon->target_freq = 1;
    mon->max_freq = 10;
    mon->actual_freq = 0;
    mon->calc_time_usec = 10;

    mon->clk = time(NULL);
    mon->ticker_input = -1;
    mon->ticker_mode = TM_SECOND;

    mon->ser_in_in = -1;
    mon->ser_in_busy_out = -1;
    mon->ser_out = -1;
    mon->ser_buf[0] = 0;
    mon->ser_out_buf = 0;

    for (i = 0; i <  8; i++) mon->d7[i] = -1;

    return 0;
}

void mon_loop(t_mon *mon) {
    disp_display(mon);
    time_t prev_time = time(NULL);
    int steps = 0;

    int displayer_steps = 0;

    while (mon->status != MS_FINISH) {
        handle_kbd(mon);
        if (mon->status == MS_AUTO) {
            mon_step(mon);
            steps++;
            if (time(NULL) != prev_time) {
                mon->actual_freq = steps;
                if (mon->actual_freq > mon->max_freq)
                    mon->max_freq = mon->actual_freq;
                steps = 0;
                prev_time = time(NULL);
            }
            displayer_steps++;
            if (displayer_steps >= mon->actual_freq / 100) {
                disp_display(mon);
                displayer_steps = 0;
            }
        } else if (mon->status == MS_FREQ) {
            if (prev_time != time(NULL)) {
                mon->actual_freq = steps;
                if (mon->actual_freq > mon->max_freq)
                    mon->max_freq = mon->actual_freq;
                steps = 0;
                prev_time = time(NULL);

                if (mon->target_freq != mon->actual_freq && mon->actual_freq != 0) {
                    if (mon->actual_freq * 100 > 130 * mon->target_freq)
                        mon->calc_time_usec = 1000000 / mon->max_freq;
                    if (mon->actual_freq * 100 > mon->target_freq * 105)
                        mon->calc_time_usec -= 10;
                    if (mon->actual_freq < mon->target_freq)
                        mon->calc_time_usec += 10;
                }
            }
            mon_step(mon);
            steps++;
            displayer_steps++;
            if (displayer_steps >= mon->actual_freq / 100) {
                disp_display(mon);
                displayer_steps = 0;
            }
            int sleep = 1000000 / mon->target_freq - mon->calc_time_usec;
            if (sleep > 0) usleep(sleep);
        } else {
            usleep(10000);
        }
    }
}

void mon_handle_command(t_mon *mon, const char *c) {
    if (c[0] == 0) {    // empty command : run step
        mon_step(mon);
        disp_display(mon);
    } else if (!strcmp(c, "q")) {
        mon->status = MS_FINISH;
    } else if (!strcmp(c, "a")) {
        mon->status = MS_AUTO;
    } else if (!strcmp(c, "m")) {
        mon->status = MS_RUN;
    } else if (c[0] == 'f') {
        const char *p = c + 1;
        mon->target_freq = 0;
        while (isspace(*p)) p++;
        while (isdigit(*p)) mon->target_freq = 10 * mon->target_freq + (*(p++) - '0');
        if (mon->target_freq == 0) mon->target_freq = 1000;
        mon->actual_freq = mon->target_freq;
        mon->calc_time_usec = 1000;
        mon->status = MS_FREQ;
    } else if (c[0] == 'i') {
        const char *p = c + 1;
        int a = 0;
        while (isspace(*p)) p++;
        while (isdigit(*p)) a = a * 10 + (*(p++) - '0');
        if (a >= 0 && a < mon->n_inputs) {
            strcpy(mon->inputs[a].value, p);
        }
    } else if (!strcmp(c, "tf")) {
        mon->ticker_mode = TM_FAST;
    } else if (!strcmp(c, "ts")) {
        mon->ticker_mode = TM_SECOND;
    } else if (!strcmp(c, "tz")) {
        mon->ticker_mode = TM_NO_TICK;
    } else if (c[0] == 't') {
        if (c[1] == 0) {
            mon->ticker_input = -1;
        } else {
            const char *p = c + 1;
            int a = 0;
            while (isspace(*p)) p++;
            while (isdigit(*p)) a = a * 10 + (*(p++) - '0');

            if (a >= 0 && a < mon->n_inputs) {
                mon->ticker_input = a;
            }
        }
    } else if (c[0] == 's') {
        if (c[1] == 0) {
            mon->ser_in_in = mon->ser_in_busy_out = mon->ser_out = -1;
        } else {
            int u = -1, v = -1, w = -1;
            const char *p = c + 1;
            while (isspace(*p)) p++;
            if (*p == '-') {
                p++;
            } else if (*p != 0) {
                u = 0;
                while (isdigit(*p)) u = u * 10 + (*(p++) - '0');
            }
            while (isspace(*p)) p++;
            if (*p == '-') {
                p++;
            } else if (*p != 0) {
                v = 0;
                while (isdigit(*p)) v = v * 10 + (*(p++) - '0');
            }
            while (isspace(*p)) p++;
            if (*p == '-') {
                p++;
            } else if (*p != 0) {
                w = 0;
                while (isdigit(*p)) w = w * 10 + (*(p++) - '0');
            }
            if (u < mon->n_inputs) mon->ser_in_in = u;
            if (v < mon->n_outputs) mon->ser_in_busy_out = v;
            if (w < mon->n_outputs) mon->ser_out = w;
        }

    } else if (c[0] == ':') {
        strcat(mon->ser_buf, c + 1);
        strcat(mon->ser_buf, "\n");
    } else if (c[0] == 'd' && c[1] == '7') {
        const char *p = c + 2;
        int i = 0;
        for (i = 0; i < 8; i++) {
            while (isspace(*p)) p++;
            if (*p == 0) {
                mon->d7[i] = -1;
            } else if (*p == '-') {
                mon->d7[i] = -1;
                p++;
            } else {
                mon->d7[i] = 0;
                while (isdigit(*p)) mon->d7[i] = 10 * mon->d7[i] + (*(p++) - '0');
                if (mon->d7[i] >= mon->n_outputs) mon->d7[i] = -1;
            }
        }
    }
    disp_display(mon);
}

void mon_step(t_mon *mon) {
    int i = 0;

    // Get ticker
    int ticker = 0;
    if (mon->ticker_mode == TM_SECOND) {
        time_t new_clk = time(NULL);
        ticker = new_clk - mon->clk;
        mon->clk = new_clk;
    } else if (mon->ticker_mode == TM_FAST) {
        ticker = 1;
    }
    if (mon->ticker_input != -1) {
        if (mon->inputs[mon->ticker_input].size == 1)
            ticker = (ticker != 0 ? 1 : 0);
        sprintf(mon->inputs[mon->ticker_input].value, "/%d", ticker);
    }

    // Update serial input
    if (mon->ser_in_in != -1 && mon->ser_in_busy_out != -1
        && mon->outputs[mon->ser_in_busy_out].v_int == 0) {
        if (mon->ser_buf[0] != 0) {
            sprintf(mon->inputs[mon->ser_in_in].value, "/%d", (int)mon->ser_buf[0]);
            char *p = mon->ser_buf;
            while (*p) {
                p[0] = p[1];
                p++;
            }
        } else {
            sprintf(mon->inputs[mon->ser_in_in].value, "0");
        }
    }
    
    // Send inputs to simulator
    for (i = 0; i < mon->n_inputs; i++) {
        fprintf(mon->to_sim, "%s\n", mon->inputs[i].value);
    }
    fflush(mon->to_sim);

    // Read outputs from simulator
    for (i = 0; i < mon->n_outputs; i++) {
        fscanf(mon->from_sim, " %s %s %d",
            mon->outputs[i].name,
            mon->outputs[i].v_bin,
            &mon->outputs[i].v_int);
    }

    // Update serial output
    if (mon->ser_out != -1) {
        mon->ser_out_buf = mon->outputs[mon->ser_out].v_int;
    }
    
    mon->step++;
}
