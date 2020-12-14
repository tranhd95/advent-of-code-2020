using Combinatorics: permutations

INPUT = split.(readlines("files/14.in"), " = ")

function part1(input)
    mem_dict = Dict()
    mask = ""
    for (cmd, val) in input
        if cmd == "mask"
            mask = collect(val)
        else
            mem_val = collect(bitstring(parse(Int, val))[29:end])
            mem_dict[cmd] = apply_mask(mem_val, mask)
        end    
    end
    sum(parse(Int, join(val), base=2) for (addr, val) in mem_dict)
end

function apply_mask(bin, mask)
    indices = findall(x -> x != 'X', mask)
    bin[indices] = mask[indices]
    bin
end

function part2(input)
    mem_dict = Dict()
    mask = ""
    for (cmd, val) in input
        if cmd == "mask"
            mask = collect(val)
        else
            mem_val = parse(Int, val)
            code = bitstring(parse(Int, match(r"\d+", cmd).match))[29:end] |> collect
            addresses = decode_addresses(code, mask)
            for addr in addresses
                mem_dict[addr] = mem_val
            end
        end
    end
    sum(values(mem_dict))
end

function decode_addresses(code, mask)
    one_indices = findall(x -> x == '1', mask)
    Xs = findall(x -> x == 'X', mask)
    code[one_indices] .= '1'
    addresses = Set()
    for i = 1:length(Xs) - 1
        base = zeros(Int, length(Xs))
        base[1:i] .= 1
        perms = Set([zeros(Int, length(Xs)), ones(Int, length(Xs))])
        for perm in perms
            new_address = copy(code)
            new_address[Xs] = map(x -> Char(x + '0'), perm)
            push!(addresses, join(new_address))
        end
        for perm in permutations(base)
            new_address = copy(code)
            new_address[Xs] = map(x -> Char(x + '0'), perm)
            push!(addresses, join(new_address))
        end
    end
    addresses
end

part1(INPUT)
part2(INPUT)