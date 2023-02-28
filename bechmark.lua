-- https://otland.net/threads/benchmarking-your-code-in-lua.265961/
-- Benchmark results: 500 function calls | 116.00 milliseconds elapsed | 0.23 milliseconds avg execution time.


--[[


    unit : Unit of time to view elapsed time in, see local units table for the list of units.
    decPlaces : Number of decimal places for the elapsed time output (Количество знаков после запятой для вывода прошедшего времени)
    n : Number of times to run the function
    f : The function to benchmark (Количество раз для запуска функции)
    ... : All arguments passed to function f 

--]]

do
    local units = {
        ['seconds'] = 1,
        ['milliseconds'] = 1000,
        ['microseconds'] = 1000000,
        ['nanoseconds'] = 1000000000
    }

    function benchmark(unit, decPlaces, n, f, ...)
        local elapsed = 0
        local multiplier = units[unit]
        for i = 1, n do
            local now = os.clock()
            f(...)
            elapsed = elapsed + (os.clock() - now)
        end
        print(string.format('Benchmark results: %d function calls | %.'.. decPlaces ..'f %s elapsed | %.'.. decPlaces ..'f %s avg execution time.', n, elapsed * multiplier, unit, (elapsed / n) * multiplier, unit))
    end
end



function test(n)
    local t = {}
    for i = 1, n do
        t[i] = i
    end
end

benchmark('milliseconds', 2, 500, test, 10000) -- Benchmark results: 500 function calls | 254.96 milliseconds elapsed | 0.51 milliseconds avg execution time.
