CC=gcc
RM=rm -rf
ORBIT=`pkg-config ORBit-2.0 ORBit-CosNaming-2.0 --cflags --libs`
SOURCES=add-server add-client

all: ${SOURCES}

add-common.c: add.idl
	orbit-idl-2 $< --skeleton-impl
add-skels.c: add.idl
	orbit-idl-2 $< --skeleton-impl
examples-toolkit.c: add.idl
	orbit-idl-2 $< --skeleton-impl 
add-stubs.c: add.idl
	orbit-idl-2 $< --skeleton-impl

add-server: add-server.c add-common.c add-skels.c examples-toolkit.c
	${CC} -o $@ $^ ${ORBIT}
add-client: add-client.c add-common.c add-stubs.c examples-toolkit.c
	${CC} -o $@ $^ ${ORBIT}

clean:
	${RM} ${SOURCES}