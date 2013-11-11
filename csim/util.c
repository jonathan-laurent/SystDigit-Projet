/*
	Système Digital
	2013-2014
	Alex AUVOLAT

	util.c	Various utility functions used elsewhere
*/


#include "sim.h"

int pow2(int exp) {
	if (exp == 0) return 1;
	if (exp == 1) return 2;
	int k = pow2(exp / 2);
	return (exp % 2 == 0 ? k * k : 2 * k * k);
}

t_value read_bool(FILE *stream, t_value *mask) {
	t_value r = 0;
	t_value pow = 1;

	char c;
	if (mask != NULL) *mask = 0;

	for(;;) {
		fscanf(stream, "%c", &c);
		if (c == '1') {
			r |= pow;
		} else if (c != '0') {
			break;
		}
		if (mask != NULL) (*mask) |= pow;

		pow *= 2;
	}

	return r;
}

int is_prefix(char *prefix, char *str) {
	while (*prefix) {
		if (*prefix != *str) return 0;
		prefix++;
		str++;
	}
	return 1;
}
