gcc -c mydll.c
gcc -shared -o mydll.dll mydll.o
strip mydll.dll

