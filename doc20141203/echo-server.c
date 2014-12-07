/* echo-server.c */
/* P4 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <orbit/orbit.h>

#include "echo-skelimpl.c"
#include "examples-toolkit.h"

CORBA_ORB global_orb = CORBA_OBJECT_NIL; /* global orb */
PortableServer_POA root_poa = CORBA_OBJECT_NIL; /* root POA */

CORBA_Object server_activate_service(CORBA_ORB orb, PortableServer_POA poa,
                                     CORBA_Environment *ev) {
    EchoApp_Echo ref = CORBA_OBJECT_NIL;
    ref = impl_EchoApp_Echo__create(poa, ev);
    if (etk_raised_exception(ev))
        return CORBA_OBJECT_NIL;
    return ref;
}

int main(int argc, char* argv[]) {
    CORBA_Object servant = CORBA_OBJECT_NIL;
    CosNaming_NamingContext name_service = CORBA_OBJECT_NIL;

    gchar *id[] = {"EchoApp", "Echo", NULL};

    CORBA_Environment ev[1];
    CORBA_exception_init(ev);

    server_init(&argc, argv, &global_orb, &root_poa, ev);
    etk_abort_if_exception(ev, "failed ORB init");

    servant = server_activate_service(global_orb, root_poa, ev);
    etk_abort_if_exception(ev, "failed activating service");

    g_print("Binding service reference from name-service with id\"%s\"\n", id[0]);

    name_service = etk_get_name_service(global_orb, ev);
    etk_abort_if_exception(ev, "failed binding of service");

    server_run(global_orb, ev);
    etk_abort_if_exception(ev, "failed entering main loop");

    server_cleanup(global_orb, root_poa, servant, ev);
    etk_abort_if_exception(ev, "failed cleanup");

    exit(0);
}