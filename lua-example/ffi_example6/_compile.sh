rm -f ffi_example6.dll ffi_example6.o
gcc -fPIC -c -o ffi_example6.o ffi_example6.c
gcc -shared -Wl,-soname,ffi_example6.dll -o ffi_example6.dll ffi_example6.o
strip ffi_example6.dll
