SOURCES=ffi-c++ ffi-c++-main
all: ${SOURCES}

ffi-c++: ffi-c++.cpp
	gcc -c $^
	gcc -shared -fPIC -o ffi-c++.so ffi-c++.cpp -lm -lstdc++

ffi-c++-main: ffi-c++-main.c
	gcc -c ffi-c++-main.c
	g++ -o ffi-c++-main ffi-c++.o ffi-c++-main.o -lm

clean:
	rm -rf *.o *.so ${SOURCES}