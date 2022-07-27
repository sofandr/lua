-- https://docs.microsoft.com/en-us/windows/win32/sysinfo/acquiring-high-resolution-time-stamps
local ffi = require("ffi")

ffi.cdef([[
void Sleep(int ms);
int QueryPerformanceCounter(int64_t *lpPerformanceCount);
int QueryPerformanceFrequency(int64_t *lpFrequency);
]])

function sleep(s)
    ffi.C.Sleep(s*1000)
end

local function QueryPerformanceCounter(int64)
    int64 = int64 or ffi.new("int64_t[1]")
    ffi.C.QueryPerformanceCounter(int64)
    return tonumber(int64[0])
end

local function QueryPerformanceFrequency(int64)
    int64 = int64 or ffi.new("int64_t[1]")
    ffi.C.QueryPerformanceFrequency(int64)
    return tonumber(int64[0])
end


local StartingTime
local EndingTime
local ElapsedMicroseconds
local Frequency
Frequency       = QueryPerformanceFrequency()
StartingTime    = QueryPerformanceCounter()

local sec=5.5
print("Pause in sec: "..sec)
sleep(sec)

EndingTime      = QueryPerformanceCounter()
ElapsedMicroseconds = EndingTime - StartingTime
print("Elapsed: "..ElapsedMicroseconds)

--[[
 “еперь у нас есть прошедшее количество тиков вместе с
 количество тиков в секунду. ћы используем эти значени€
 дл€ преобразовани€ в количество прошедших микросекунд.
 „тобы защититьс€ от потери точности, мы конвертируем
 в микросекунды *до* делени€ на тики в секунду.
]]--

ElapsedMicroseconds = ElapsedMicroseconds * 1000000
ElapsedMicroseconds = ElapsedMicroseconds / Frequency

print("ElapsedMicroseconds: "..ElapsedMicroseconds)
print("ElapsedSec: "..ElapsedMicroseconds/1000000)

