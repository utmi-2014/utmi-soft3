CC=gcc
RM=rm -rf
ORBIT=`pkg-config ORBit-2.0 ORBit-CosNaming-2.0 --cflags --libs`
SOURCES=add-two-ints-server add-two-ints-client

all: ${SOURCES}

add-two-ints-common.c: add-two-ints.idl
	orbit-idl-2 $< --skeleton-impl
add-two-ints-skels.c: add-two-ints.idl
	orbit-idl-2 $< --skeleton-impl
examples-toolkit.c: add-two-ints.idl
	orbit-idl-2 $< --skeleton-impl 
add-two-ints-stubs.c: add-two-ints.idl
	orbit-idl-2 $< --skeleton-impl

add-two-ints-server: add-two-ints-server.c add-two-ints-common.c add-two-ints-skels.c examples-toolkit.c
	${CC} -o $@ $^ ${ORBIT}
add-two-ints-client: add-two-ints-client.c add-two-ints-common.c add-two-ints-stubs.c examples-toolkit.c
	${CC} -o $@ $^ ${ORBIT}

clean:
	${RM} ${SOURCES}