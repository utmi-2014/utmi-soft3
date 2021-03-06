/*
 * This file was generated by orbit-idl-2 - DO NOT EDIT!
 */

#ifndef add_two_ints_H
#define add_two_ints_H 1
#include <glib.h>
#define ORBIT_IDL_SERIAL 20
#include <orbit/orbit-types.h>

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/** typedefs **/
#if !defined(ORBIT_DECL_AddApp_Add) && !defined(_AddApp_Add_defined)
#define ORBIT_DECL_AddApp_Add 1
#define _AddApp_Add_defined 1
#define AddApp_Add__freekids CORBA_Object__freekids
typedef CORBA_Object AddApp_Add;
extern CORBA_unsigned_long AddApp_Add__classid;
#if !defined(TC_IMPL_TC_AddApp_Add_0)
#define TC_IMPL_TC_AddApp_Add_0 'a'
#define TC_IMPL_TC_AddApp_Add_1 'd'
#define TC_IMPL_TC_AddApp_Add_2 'd'
#define TC_IMPL_TC_AddApp_Add_3 '_'
#define TC_IMPL_TC_AddApp_Add_4 't'
#define TC_IMPL_TC_AddApp_Add_5 'w'
#define TC_IMPL_TC_AddApp_Add_6 'o'
#define TC_IMPL_TC_AddApp_Add_7 '_'
#define TC_IMPL_TC_AddApp_Add_8 'i'
#define TC_IMPL_TC_AddApp_Add_9 'n'
#define TC_IMPL_TC_AddApp_Add_10 't'
#define TC_IMPL_TC_AddApp_Add_11 's'
#ifdef ORBIT_IDL_C_IMODULE_add_two_ints
static
#else
extern
#endif
ORBIT2_MAYBE_CONST struct CORBA_TypeCode_struct TC_AddApp_Add_struct;
#define TC_AddApp_Add ((CORBA_TypeCode)&TC_AddApp_Add_struct)
#endif
#endif

/** POA structures **/
#ifndef _defined_POA_AddApp_Add
#define _defined_POA_AddApp_Add 1
typedef struct {
  void *_private;
void (*addTwoInts)(PortableServer_Servant _servant, const CORBA_short input_a, const CORBA_short input_b, CORBA_Environment *ev);
} POA_AddApp_Add__epv;
typedef struct {
  PortableServer_ServantBase__epv *_base_epv;
  POA_AddApp_Add__epv *AddApp_Add_epv;
} POA_AddApp_Add__vepv;
typedef struct {
  void *_private;
  POA_AddApp_Add__vepv *vepv;
} POA_AddApp_Add;
extern void POA_AddApp_Add__init(PortableServer_Servant servant, CORBA_Environment *ev);
extern void POA_AddApp_Add__fini(PortableServer_Servant servant, CORBA_Environment *ev);
#endif /* _defined_POA_AddApp_Add */

/** skel prototypes **/
void _ORBIT_skel_small_AddApp_Add_addTwoInts(POA_AddApp_Add *_ORBIT_servant, gpointer _ORBIT_retval, gpointer *_ORBIT_args, CORBA_Context ctx,CORBA_Environment *ev, void (*_impl_addTwoInts)(PortableServer_Servant _servant, const CORBA_short input_a, const CORBA_short input_b, CORBA_Environment *ev));

/** stub prototypes **/
void AddApp_Add_addTwoInts(AddApp_Add _obj, const CORBA_short input_a, const CORBA_short input_b, CORBA_Environment *ev);
#include <orbit/orb-core/orbit-interface.h>

#ifdef ORBIT_IDL_C_IMODULE_add_two_ints
static 
#else
extern 
#endif
ORBit_IInterface AddApp_Add__iinterface;
#define AddApp_Add_IMETHODS_LEN 1
#ifdef ORBIT_IDL_C_IMODULE_add_two_ints
static 
#else
extern 
#endif
ORBit_IMethod AddApp_Add__imethods[AddApp_Add_IMETHODS_LEN];

/** IMethods index */

#ifndef __AddApp_Add__imethods_index
#define __AddApp_Add__imethods_index
typedef enum {
	AddApp_Add_addTwoInts__imethods_index
} AddApp_Add__imethods_index;
#endif /* __AddApp_Add__imethods_index */

#ifndef __ORBIT_IMETHODS_INDEX
#define __ORBIT_IMETHODS_INDEX
#define ORBIT_IMETHODS_INDEX(m) (m ## __imethods_index)
#endif /* __ORBIT_IMETHODS_INDEX */

#ifdef __cplusplus
}
#endif /* __cplusplus */

#ifndef EXCLUDE_ORBIT_H
#include <orbit/orbit.h>

#endif /* EXCLUDE_ORBIT_H */
#endif
#undef ORBIT_IDL_SERIAL
