#!/usr/bin/env python
#-*- coding: utf-8 -*-
# ffi-class-main.py
"""
Python version for document P15
"""

import ffi_class

exp = ffi_class.Example()
exp.Hello('test')
exp.Sinc(1.)