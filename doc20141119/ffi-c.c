/* ffi-c.c */
// P6
#include <math.h>
#include <stdio.h>

int hello(char *str) {
    fprintf(stdout, "%s\n", str);
}

double sinc(double x) {
    return sin(x)/x;
}