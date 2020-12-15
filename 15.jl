function part1(numbers, n)
    seen = Dict()
    for (i, num) in enumerate(numbers[1:end - 1])
        seen[num] = i
    end
    last = numbers[end]
    for t = length(numbers) + 1:n
        if last in keys(seen)
            speak = t - 1 - seen[last]
        else
            speak = 0
        end
        seen[last] = t - 1
        last = speak
    end
    last
end
# part1([11,18,0,20,1,7,16], 2020)
@time begin
    part1([11,18,0,20,1,7,16], 30000000)
end