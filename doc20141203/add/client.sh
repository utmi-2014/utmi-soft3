#!/bin/bash
./add-client $1 $2 -ORBInitRef NameService=corbaloc:iiop:127.0.0.1:2809/NameService
