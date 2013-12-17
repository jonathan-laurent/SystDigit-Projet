/*
    Système Digital
    2013-2014
    Alex AUVOLAT

    main.c      Main file for the C simulator
*/

#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "sim.h"


void usage() {
    printf ("\nUsage:\n\tcsim [options] <netlist_file>\n\n");
    printf("Available options:\n");
    printf("\n    -rom <prefix> <file>\n\tLoad a filename as a ROM file for the machine\n");
    printf("\tA given ROM file is used for all ROM chips with variable name having given prefix\n");
    printf("\n    -n <steps>\n\tOnly run #steps steps of simulation (0 = infinity)\n");
    printf("\n    -in <in-file>\n\tRead inputs from given file (eg. named pipe). Defaults to STDIN.\n");
    printf("\n    -out <out-file>\n\tWrite outputs to given file (eg. named pipe). Defaults to STDOut.\n");
    exit(1);
}

// Arguments to be parsed
int steps = 12;
char *filename = NULL;
char *infile = NULL;
char *outfile = NULL;

int main(int argc, char **argv) {
    int i;
    for (i = 1; i < argc; i++) {
        if (!strcmp(argv[i], "-rom")) {
            if (++i == argc) usage();
            if (++i == argc) usage();
            FILE *rom = fopen(argv[i], "r");
            if (!rom) {
                fprintf(stderr, "Could not open ROM file: '%s'\n", argv[i]);
                return 1;
            }
            add_rom(argv[i-1], rom);
            fclose(rom);
        } else if (!strcmp(argv[i], "-n")) {
            if (++i == argc) usage();
            steps = atoi(argv[i]);
        } else if (!strcmp(argv[i], "-in")) {
            if (++i == argc) usage();
            infile = argv[i];
        } else if (!strcmp(argv[i], "-out")) {
            if (++i == argc) usage();
            outfile = argv[i];
        } else {
            filename = argv[i];
        }
    }

    if (filename == NULL) usage();

    // Load program
    FILE *p_in;
    p_in = fopen(filename, "r");
    if (!p_in) {
        fprintf(stderr, "Error: could not open file %s for input.\n", filename);
        return 1;
    }
    t_program* program = load_dumb_netlist(p_in);
    fclose(p_in);

    // Setup input and outputs
    FILE *input = stdin, *output = stdout;
    if (infile != NULL) {
        input = fopen(infile, "r");
        if (!infile) {
            fprintf(stderr, "Error: could not open file %s for input.\n", infile);
            return 1;
        }
    }
    if (outfile != NULL) {
        output = fopen(outfile, "w");
        if (!output) {
            fprintf(stderr, "Error: could not open file %s for output.\n", outfile);
            return 1;
        }
    }

    // Run
    t_machine *machine = init_machine(program);
    i = 0;
    while (i < steps || steps == 0) {
        read_inputs(machine, input);
        machine_step(machine);
        write_outputs(machine, output);
        i++;
    }

    // Cleanup
    if (input != stdin) fclose(input);
    if (output != stdout) fclose(output);

    // No need to free memory, the OS deletes everything anyways when the process ends.

    return 0;
}

