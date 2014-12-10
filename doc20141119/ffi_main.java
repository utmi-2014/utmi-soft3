// ffi_main.java
// P14
public class ffi_main {
    public static void main(String[] args) {
        System.loadLibrary("ffi-c_wrap");
        ffi_c.hello("world");
        System.out.println("sinc(1) = " + ffi_c.sinc(1.0));
    }
}