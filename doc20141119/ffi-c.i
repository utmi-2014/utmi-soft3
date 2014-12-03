/* ffi-c.i */
%module ffi_c
%{
  extern void hello(char *str);
  extern double sinc(double x);
%}
%include "ffi-c.c"