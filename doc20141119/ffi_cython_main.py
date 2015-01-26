#!/usr/bin/env python
#-*- coding: utf-8 -*-
# ffi_cython_main.py
# P17

import ffi_cython

ffi_cython.hello2('cython')
print "sin(1.) =", ffi_cython.sinc2(1.0)