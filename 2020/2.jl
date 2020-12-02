input = readlines("files/2.txt")

function part1(input)
    valid_count = 0
    for line in input
        tokens = split(line, ":")        
        range, letter = parse_policy(tokens[1])
        password = tokens[2]
        occurences = 0
        for l in password
            if l == letter
                occurences += 1
            end
        end
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
        tokens = split(line, ":")        
        positions, letter = parse_policy(tokens[1])
        password = strip(tokens[2])
        if (length(password) ≥ positions[1] && 
                (password[positions[1]] == letter || password[positions[2]] == letter) && 
                password[positions[1]] ≠ password[positions[2]])
            valid_count += 1
        end
    end
    return valid_count
end

println(part1(input))
println(part2(input))