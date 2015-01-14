/* add-client.c */
#include <stdio.h>
#include <signal.h>
#include <string.h>
#include <stdlib.h>
#include <orbit/orbit.h>

#include "add.h"
#include "examples-toolkit.h" /* ie. ek_abort_if_exception() */

CORBA_ORB global_orb = CORBA_OBJECT_NIL; /* global orb */

static void client_run(AddApp_Add add_service, short input_a, short input_b, CORBA_Environment *ev) {
    printf("%d %d\n", input_a, input_b);
    AddApp_Add_addInts(add_service, input_a, input_b, ev);
    if (etk_raised_exception(ev)) return;
}

int main(int argc, char* argv[]) {
    if (argc <= 3) {
        printf("too few arguments\n");
        exit(-1);
    }
    AddApp_Add add_service = CORBA_OBJECT_NIL;
    CosNaming_NamingContext name_service = CORBA_OBJECT_NIL;

    gchar *id[] = {"AddApp", "Add", NULL};

    CORBA_Environment ev[1];
    CORBA_exception_init(ev);

    client_init(&argc, argv, &global_orb, ev);
    etk_abort_if_exception(ev, "init failed");

    g_print("Resolving service reference from name-service with id\"%s\"\n", id[0]);

    name_service = etk_get_name_service(global_orb, ev);
    etk_abort_if_exception(ev, "failed resolving name-service");

    add_service = (AddApp_Add)etk_name_service_resolve(name_service, id, ev);
    etk_abort_if_exception(ev, "failed resolving name service at name-service");

    client_run(add_service, (short)atoi(argv[1]), (short)atoi(argv[2]), ev);
    etk_abort_if_exception(ev, "service not reachable");

    client_cleanup(global_orb, add_service, ev);
    etk_abort_if_exception(ev, "cleanup failed");

    exit(0);
}