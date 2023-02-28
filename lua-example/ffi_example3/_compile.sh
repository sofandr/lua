rm -f ffi_example3.dll ffi_example3.o
gcc -fPIC -c -o ffi_example3.o ffi_example3.c
gcc -shared -Wl,-soname,ffi_example3.dll -o ffi_example3.dll ffi_example3.o
