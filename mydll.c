// https://www.cygwin.com/cygwin-ug-net/dll.html

#include <stdio.h>

__declspec
(dllexport) void printMe( void )
{
printf("Hello\n");
}

