/* ffiJava.c */
/* P5 */
#include "ffiJava.h"
#include <math.h>

JNIEXPORT jdouble JNICALL Java_ffiJava_sinc
(JNIEnv *env, jobject obj, jdouble d) {
    d = sin(d) / d;
    return d;
}

JNIEXPORT void JNICALL Java_ffiJava_hello
(JNIEnv *env, jobject obj, jstring s) {
    const char *str = (*env)->GetStringUTFChars(env, s, 0);
    fprintf(stdout, "%s\n", str);
    (*env)->ReleaseStringUTFChars(env, s, str);
}