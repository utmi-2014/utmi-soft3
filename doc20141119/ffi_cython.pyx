# ffi_cython.pyx
# P17

cdef extern void hello (char *)
cdef extern double sinc (double)

def hello2(name):
    # name (unicode) -> bname (str)
    bname = name.encode("utf-8")
    cdef char *cname = bname
    hello(cname)

def sinc2(x):
    return sinc(x)