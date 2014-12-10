SOURCES=ffi-c++ ffi-c++-main ffi-c.so _ffi_c.so _ffi_class.so ffi_cython.so ffiJava.class ffiJava.h libffiJava.so ffi_c.class ffi_main.class
all: ${SOURCES}

ffi-c++: ffi-c++.cpp
	gcc -c $<
	gcc -shared -fPIC -o ffi-c++.so ffi-c++.cpp -lm -lstdc++

ffi-c++-main: ffi-c++-main.c
	gcc -c ffi-c++-main.c
	g++ -o ffi-c++-main ffi-c++.o ffi-c++-main.o -lm

ffi-c.so: ffi-c.c
	gcc -shared -fPIC -o $@ $< -lm

_ffi_c.so: ffi-c.c
	swig -python ffi-c.i
	gcc -I/usr/include/python2.7 -shared -fPIC -o $@ $< ffi-c_wrap.c

_ffi_class.so: ffi-class.cpp
	swig -c++ -python ffi-class.i
	g++ -I/usr/include/python2.7 -shared -fPIC -o $@ $< ffi-class_wrap.cxx -lm -lstdc++

ffi_cython.so: setup.py
	python setup.py build_ext --inplace

ffiJava.class: ffiJava.java
	javac $<
ffiJava.h: ffiJava.class
	javah -jni ffiJava
libffiJava.so: ffiJava.c
	export JAVA_HOME=/usr/lib/jvm/java-6-openjdk
	gcc -shared -fPIC -I${JAVA_HOME}/include -o $@ $<
	export LD_LIBRARY_PATH=./:${LD_LIBRARY_PATH}

libffi-c_wrap.so: ffi-c_wrap.c ffi-c.c
	swig -java ffi-c.i
	export JAVA_HOME=/usr/lib/jvm/java-6-openjdk/
	gcc -shared -fPIC -I${JAVA_HOME}/include -o $@ $<
	export LD_LIBRARY_PATH=./:${LD_LIBRARY_PATH}
ffi_c.class: ffi_c.java
	javac $<
ffi_main.class: ffi_main.java
	javac $<

clean:
	rm -rf *.o *.so *.class ${SOURCES} ffi_c.py ffi_class.py build/ ffi_c.java ffi_cJNI.java ffi-c_wrap.c ffi-class_wrap.cxx