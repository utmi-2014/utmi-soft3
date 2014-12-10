// ffiJava.java
// P4
import java.io.*;

public class ffiJava {
    private native double sinc(double d);
    private native void hello(String str);

    public static void main(String argv[]) {
        ffiJava t = new ffiJava();
        System.loadLibrary("ffiJava");
        System.out.print("hello "); t.hello("world");
        System.out.println("sinc(1) = " + t.sinc(1.0f));
    }
}