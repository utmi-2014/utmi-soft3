/* ffi-class.cpp */
// P14
#include <iostream>
#include <string>
#include <math.h>

class Example
{
public:
    Example(void) {};
    ~Example(void) {};

    void Hello(char *str) {
        std::cerr << "hello " << str << "!!" << std::endl;
    }
    void Sinc(double x) {
        std::cerr << "sinc = " << sin(x)/x << std::endl;
    }
};