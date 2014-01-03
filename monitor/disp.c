#include <curses.h>
#include "mon.h"

/*  Screen disposition :
    
    program     |   program
    status      |   output
    window      |   interp.
    ----------------------
    command line
*/

#define STATUS_WIN_WIDTH 60

static void disp_cmdline();

static char command[100];
static int cmd_pos = 0;

static WINDOW *wpstatus, *wpoutput, *wcmdline;

void disp_init() {
    initscr();
    cbreak();
    noecho();
    nonl();

    wpstatus = newwin(LINES - 4, STATUS_WIN_WIDTH, 1, 1);
    wpoutput = newwin(LINES - 4, COLS - STATUS_WIN_WIDTH - 3, 1, STATUS_WIN_WIDTH + 2);
    wcmdline = newwin(1, COLS - 2, LINES - 2, 1);

    intrflush(wcmdline, FALSE);
    keypad(wcmdline, TRUE);
    nodelay(wcmdline, TRUE);

    cmd_pos = 0;
    command[0] = 0;
    disp_cmdline();
}

void disp_finish() {
    endwin();
}

void handle_kbd(t_mon *mon) {
    int x;
    while ((x = wgetch(wcmdline)) != ERR) {
        if (x == '\r') {
            mon_handle_command(mon, command);
            cmd_pos = 0;
        } else if (x == KEY_BACKSPACE) {
            if (cmd_pos > 0) cmd_pos--;
        } else if (x >= 32 && x <= 127) {
            if (cmd_pos < 99)
                command[cmd_pos++] = x;
        }
        command[cmd_pos] = 0;
        disp_cmdline();
    }
}

// DISPLAY

void disp_cmdline() {
    werase(wcmdline);
    wprintw(wcmdline, "> %s", command);
    wrefresh(wcmdline);
}

void disp_display(t_mon *mon) {
    int i;

    werase(wpstatus);
    
    wprintw(wpstatus, "Step:\t\t%d\n", mon->step);
    wprintw(wpstatus, "\nInputs:\n");
    for (i = 0; i < mon->n_inputs; i++) {
        wprintw(wpstatus, "\t%s (%d)\t%s\n", mon->inputs[i].name, mon->inputs[i].size, mon->inputs[i].value);
    }
    if (mon->n_inputs == 0) wprintw(wpstatus, "\t(none)\n");
    wprintw(wpstatus, "\nOutputs:\n");
    for (i = 0; i < mon->n_outputs; i++) {
        wprintw(wpstatus, "\t%s\t%s\t%ld\n", mon->outputs[i].name, mon->outputs[i].v_bin, mon->outputs[i].v_int);
    }
    if (mon->n_outputs == 0) wprintw(wpstatus, "\t(none)\n");

    wmove(wcmdline, 0, cmd_pos + 2);
    wrefresh(wpstatus);
}



