#!/usr/bin/env python
#-*- coding: utf-8 -*-
# setup.py

from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

ext_modules=[
        Extension("ffi_cython",
            ["ffi_cython.pyx", "ffi-c.c"],
            libraries=["m"]),
        ]
setup(
        name="ffi cython test",
        cmdclass={"build_ext": build_ext},
        ext_modules=ext_modules,
        )