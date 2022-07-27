local ffi  = require( "ffi" )
local libb = ffi.load("mydll.dll")
print(libb)
ffi.cdef[[
 void printMe(void);
]]
libb.printMe()
