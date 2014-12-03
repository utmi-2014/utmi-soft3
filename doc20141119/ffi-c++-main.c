/* ffi-c++-main.c */
#include <stdio.h>

int main(int argc, char* argv[]) {
    double f = 1.0;
    fprintf(stderr, "sinc(%f) = %f\n", f, sinc(f));
}