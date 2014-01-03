#include <curses.h>
#include <signal.h>

#include "mon.h"

#define MON2SIM "/tmp/mon2sim"
#define SIM2MON "/tmp/sim2mon"

void usage(char* p) {
    fprintf(stderr, "Usage:\n");
    fprintf(stderr, "    %s <simulator> [<simulator arguments>...]\n");
    fprintf(stderr, "\n");
}

int main(int argc, char *argv[]) {
    int err;

    if (argc < 2) {
        usage(argv[0]);
        return 1;
    }

    // Launch simulator
    mkfifo(MON2SIM, 0600);
    mkfifo(SIM2MON, 0600);
    int sim_pid = fork();
    if (sim_pid == 0) {
        // child : launch simulator
        freopen(MON2SIM, "r", stdin);
        freopen(SIM2MON, "w", stdout);
        execv(argv[1], argv + 1);
    }

    t_mon mon;
    mon.to_sim = fopen(MON2SIM, "w");
    mon.from_sim = fopen(SIM2MON, "r");
    if (err = mon_read_prologue(&mon)) {
        fprintf(stderr, "\nError while launching simulator (%d).\n", err);
        goto finish;
    }

    // Setup display
    disp_init();

    // RUN !!!
    mon_loop(&mon);

    // clean up
    disp_finish();

finish:
    kill(sim_pid, SIGTERM);
    waitpid(sim_pid);

    fclose(mon.to_sim);
    fclose(mon.from_sim);
    unlink(MON2SIM);
    unlink(SIM2MON);

    return 0;
}
