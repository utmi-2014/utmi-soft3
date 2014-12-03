SOURCES=ffi-c++ ffi-c++-main ffi-c.so ffi-c_wrap.c _ffi_c.so ffi-class_wrap.cxx _ffi_class.so ffi_cython.so
all: ${SOURCES}

ffi-c++: ffi-c++.cpp
	gcc -c $<
	gcc -shared -fPIC -o ffi-c++.so ffi-c++.cpp -lm -lstdc++

ffi-c++-main: ffi-c++-main.c
	gcc -c ffi-c++-main.c
	g++ -o ffi-c++-main ffi-c++.o ffi-c++-main.o -lm

ffi-c.so: ffi-c.c
	gcc -shared -fPIC -o $@ $< -lm

ffi-c_wrap.c: ffi-c.i
	swig -python $<

_ffi_c.so: ffi-c.c ffi-c_wrap.c
	gcc -I/usr/include/python2.7 -shared -fPIC -o $@ $^

ffi-class_wrap.cxx: ffi-class.i
	swig -c++ -python $<

_ffi_class.so: ffi-class.cpp ffi-class_wrap.cxx
	g++ -I/usr/include/python2.7 -shared -fPIC -o $@ $^ -lm -lstdc++

ffi_cython.so: setup.py
	python setup.py build_ext --inplace

clean:
	rm -rf *.o *.so ${SOURCES} ffi_c.py ffi_class.py