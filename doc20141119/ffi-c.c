/* ffi-c.c */
// P6
#include <math.h>
#include <stdio.h>

void hello(char *str) {
    fprintf(stdout, "hello, %s!!\n", str);
}

double sinc(double x) {
    return sin(x)/x;
}