/* ffi-c++.cpp */
#include <math.h>

int f (int) { return 0; }
int f (void) { return 1; }
void g (void) { int i = f(), j = f(0); }

extern "C" {
    double sinc(double x) {
        return(sin(x)/x);
    }
}