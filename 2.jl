input = readlines("files/2.txt")

function part1(input)
    valid_count = 0
    for line in input
        policy, pswd = split(line, ":")        
        range, letter = parse_policy(policy)
        occurences = count((l -> l == letter), pswd)
        if range[1] ≤ occurences ≤ range[2]
            valid_count += 1
        end
    end
    return valid_count
end

function parse_policy(policy)
    tokens = split(policy, " ")
    letter = tokens[2][1]
    limits = map(str -> parse(Int, str), split(tokens[1], "-"))
    return (limits, letter)
end

function part2(input)
    valid_count = 0
    for line in input
        policy, pswd = split(line, ":")        
        pos, letter = parse_policy(policy)
        if (pswd[pos[1]] == letter) ⊻ (pswd[pos[2]] == letter)
            valid_count += 1
        end
    end
    return valid_count
end

println(part1(input))
println(part2(input))