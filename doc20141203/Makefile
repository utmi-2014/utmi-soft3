CC=gcc
RM=rm -rf
ORBIT=`pkg-config ORBit-2.0 ORBit-CosNaming-2.0 --cflags --libs`
SOURCES=echo-server echo-client

all: ${SOURCES}

echo-common.c: echo.idl
	orbit-idl-2 $< --skeleton-impl
echo-skels.c: echo.idl
	orbit-idl-2 $< --skeleton-impl
examples-toolkit.c: echo.idl
	orbit-idl-2 $< --skeleton-impl 
echo-stubs.c: echo.idl
	orbit-idl-2 $< --skeleton-impl

echo-server: echo-server.c echo-common.c echo-skels.c examples-toolkit.c
	${CC} -o $@ $^ ${ORBIT}
echo-client: echo-client.c echo-common.c echo-stubs.c examples-toolkit.c
	${CC} -o $@ $^ ${ORBIT}

clean:
	${RM} ${SOURCES}