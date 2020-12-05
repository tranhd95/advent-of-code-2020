LINES = readlines("files/4.txt")
PASSPORTS = split(join(LINES, "-"), "--")

function part1(passports)
    count(is_valid, passports)
end

function is_valid(passport)
    required = Set(["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"])
    pairs = get_pairs(passport)
    # keys = Set(map(pair -> pair[1], pairs))
    keys = pairs .|> (pair -> pair[1]) |> Set
    required ⊆ keys
end

function part2(passports)
    count(is_valid2, passports)
end

function is_valid2(passport)
    required = Set(["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"])
    pairs = get_pairs(passport)
    keys = Set(map(pair -> pair[1], pairs))
    required ⊆ keys && all(is_valid_pair, pairs)
end

function get_pairs(passport)
    hyphen_removed = replace(passport, "-" => " ")
    pairs_with_semicolon = split(hyphen_removed, " ")
    split.(pairs_with_semicolon, ":")
end

function is_valid_pair(pair)
    key, value = pair
    rules = Dict(
        "byr" => value -> "1920" ≤ value ≤ "2002",
        "iyr" => value -> "2010" ≤ value ≤ "2020",
        "eyr" => value -> "2020" ≤ value ≤ "2030",
        "hgt" => value -> ((endswith(value, "cm") && "150" ≤ value[begin:end - 2] ≤ "193") || 
                         (endswith(value, "in") && "59" ≤ value[begin:end - 2] ≤ "76")
                        ),
        "hcl" => value -> startswith(value, "#") && 
                        length(value[begin + 1:end]) == 6 &&
                        all(isxdigit, value[begin + 1:end]), # isxdigit (is hex digit) :: Char -> Bool
        "ecl" => value -> value ∈ ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"],
        "pid" => value -> length(value) == 9 && all(isdigit, value), 
        "cid" => _ -> true
    )
    rules[key](value)
end


println(part1(PASSPORTS))
println(part2(PASSPORTS))
