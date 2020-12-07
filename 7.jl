input = readlines("files/7.test")

function parse_input(lines)
    regexp = r"(^\w+ \w+)|((\d \w+ \w+))"
    matches = eachmatch.(regexp, lines)
    rules = map.(f -> f.match, collect.(matches))
    Dict(rules .|> rule -> (rule[begin], rule[begin + 1:end] .|> r -> (r[3:end], parse(Int, r[1]))))
end

function part1(input)
    G = parse_input(input)
    count = 0
    for v ∈ keys(G)
        S = []
        discovered = Set()
        push!(S, v)
        while !isempty(S)
            w = pop!(S)
            if w == "shiny gold" && v != "shiny gold"
                count += 1
                break
            end
            if w ∉ discovered
                push!(discovered, w)
                push!(S, (G[w] .|> first)...)
            end
        end
    end
    count
end


function part2(input)
    contains("shiny gold", parse_input(input))
end

function contains(color, dct)
    if isempty(dct[color])
        return 0
    end
    result = sum(
        child_count * (1 + contains(child_col, dct)) 
        for (child_col, child_count) in dct[color]
    )
end

part1(input) |> println
part2(input) |> println