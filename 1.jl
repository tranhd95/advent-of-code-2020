numbers = map(str -> parse(Int, str), readlines("files/1.txt"))

function part1_naive(numbers)
    # 𝒪(n²)
    for i ∈ numbers, j ∈ numbers
        if i + j == 2020
            return i * j
        end
    end
    return -1
end

function part1_shaker(numbers)
    # Loop from both sides
    # 𝒪(n⋅log n) 
    sorted = sort(numbers)
    low = 1
    high = length(numbers)
    while low < high
        if sorted[low] + sorted[high] == 2020
            return sorted[low] * sorted[high]
        end
        (sorted[low] + sorted[high] > 2020) ? high -= 1 : low += 1
    end
end

function part1_hash(numbers)
    set = Set(numbers)
    for i in numbers
        if (local j = (2020 - i)) ∈ set
            return i * j
        end 
    end
end

function part2_naive(numbers)
# 𝒪(n³)
    for i ∈ numbers, j ∈ numbers, k ∈ numbers
        if i + j + k == 2020
            return i * j * k
        end
    end
    return -1
end

function part2_oneliner(numbers)
    first(i * j * k for i ∈ numbers, j ∈ numbers, k ∈ numbers if i + j + k == 2020)
end

println(part1_naive(numbers))
println(part1_shaker(numbers))
println(part1_hash(numbers))
println(part2_naive(numbers))
println(part2_oneliner(numbers))