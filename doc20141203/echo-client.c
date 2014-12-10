/* << echo-client.c >>
 * Echo client program.. Hacked by Ewan Birney <birney@sanger.ac.uk>
 * from echo test suite, update for ORBit2 by Frank Rehberger
 * <F.Rehberger@xtradyne.de>
 */
/* P5 */
#include <stdio.h>
#include <signal.h>
#include <string.h>
#include <stdlib.h>
#include <orbit/orbit.h>

#include "echo.h"
#include "examples-toolkit.h" /* ie. ek_abort_if_exception() */

CORBA_ORB global_orb = CORBA_OBJECT_NIL; /* global orb */

static void client_run(EchoApp_Echo echo_service, CORBA_Environment *ev) {
    char filebuffer[1024+1];
    g_print("Type messages to the server\n"
            "a signal dot in line will terminate input\n");
    while ( fgets(filebuffer, 1024, stdin) ) {
        if ( filebuffer[0] == '.' && filebuffer[1] == '\n' )
            break;
        /* chop the newline off */
        filebuffer[strlen(filebuffer)-1] = '\0';
        /* using the echoString method in the Echo object
         * this is defined in the echo.h header, compiled from
         * echo.idl */
        EchoApp_Echo_echoString(echo_service, filebuffer, ev);
        if (etk_raised_exception(ev)) return;
    }
}

int main(int argc, char* argv[]) {
    EchoApp_Echo echo_service = CORBA_OBJECT_NIL;
    CosNaming_NamingContext name_service = CORBA_OBJECT_NIL;

    gchar *id[] = {"EchoApp", "Echo", NULL};

    CORBA_Environment ev[1];
    CORBA_exception_init(ev);

    client_init(&argc, argv, &global_orb, ev);
    etk_abort_if_exception(ev, "init failed");

    g_print("Resolving service reference from name-service with id\"%s\"\n", id[0]);

    name_service = etk_get_name_service(global_orb, ev);
    etk_abort_if_exception(ev, "failed resolving name-service");

    echo_service = (EchoApp_Echo)etk_name_service_resolve(name_service, id, ev);
    etk_abort_if_exception(ev, "failed resolving name service at name-service");

    client_run(echo_service, ev);
    etk_abort_if_exception(ev, "service not reachable");

    client_cleanup(global_orb, echo_service, ev);
    etk_abort_if_exception(ev, "cleanup failed");

    exit(0);
}