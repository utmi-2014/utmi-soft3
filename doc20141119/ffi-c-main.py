#!/usr/bin/env python
#-*- coding: utf-8 -*-
# ffi-python-main.py

import ctypes
ffi = ctypes.CDLL('./ffi-c.so')

ffi.sinc.argtypes = [ctypes.c_double]
ffi.sinc.restype = ctypes.c_double
print 'sin(1.0) = ', ffi.sinc(1.0)