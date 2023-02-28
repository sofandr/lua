rm -f ffi_example4.dll ffi_example4.o
gcc -fPIC -c -o ffi_example4.o ffi_example4.c
gcc -shared -Wl,-soname,ffi_example4.dll -o ffi_example4.dll ffi_example4.o
strip ffi_example4.dll
