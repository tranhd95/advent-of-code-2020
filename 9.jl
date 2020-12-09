INPUT = readlines("files/9.in") .|> str -> parse(Int, str)

function is_valid(numbers, i, preamble_length)
    preamble = numbers[i - preamble_length:i - 1]
    for a ∈ preamble, b ∈ preamble
        if a + b == numbers[i]
            return true
        end
    end
    return false
end

function part1(input)
    for i ∈ 26:length(input)
        if !is_valid(input, i, 25)
            return i, input[i]
        end
    end
    return -1
end

function part2(input)
    subarray = find_subarray_sum(input, 1721308972)
    min(subarray...) + max(subarray...)
end

function find_subarray_sum(numbers, to_be_found)
    for i ∈ 1:length(numbers)
        summ = numbers[i]
        j = i + 1
        while j <= length(numbers) && j != i && summ < to_be_found
            summ += numbers[j]
            if summ == to_be_found
                return numbers[i:j]
            end
            j += 1
        end
    end
    return -1
end

part1(INPUT)
part2(INPUT)