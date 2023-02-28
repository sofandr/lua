CC=gcc
COPTIONS=-ansi -Wall
INCLUDEPATH=/d/bin/lua/include
INCLUDELIB=/d/bin/lua/lib
LIBS=lua

all:	lua_c_5

clean:
	rm -f *.o
	rm -f lua_c_5.exe

lua_c_5:	lua_c_5.o
	$(CC) -o $@ $< -L$(INCLUDELIB) -l$(LIBS)

%.o: %.c
	$(CC) $(COPTIONS) -c -I$(INCLUDEPATH) $<
