INPUT = sort(readlines("files/10.in") .|> str -> parse(Int, str))

function part1(bag)
    diff1 = 0
    diff3 = 1
    pushfirst!(bag, 0)
    sort!(bag)
    i = 2
    while i ≤ length(bag)
        diff = abs(bag[i - 1] - bag[i])
        if diff == 1
            diff1 += 1
        elseif diff == 3
            diff3 += 1
        end
        i += 1
    end
    diff1 * diff3
end

function part2(bag)
    push!(bag, bag[end] + 3)
    pushfirst!(bag, 0)
    dp = Dict()
    dp[bag[end]] = 1 # built-in adapter
    for i = length(bag) - 1:-1:1
        adapter = bag[i]
        dp[adapter] = get(dp, adapter, 0) +
                 get(dp, adapter + 1, 0) + 
                 get(dp, adapter + 2, 0) + 
                 get(dp, adapter + 3, 0)
    end
    dp[0]
end

part1(INPUT) |> println
part2(INPUT) |> println
