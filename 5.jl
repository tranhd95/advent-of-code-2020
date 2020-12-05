TEST = ["FBFBBFFRLR", "BFFFBBFRRR", "FFFBBBFRRR", "BBFFBBFRLL"]
PASSES = readlines("files/5.in")

function get_id(pass)
    rows = pass[begin:end - 3]
    cols = pass[end - 2:end]
    row_low, row_high = parse_code(0, 127, rows)
    col_low, col_high = parse_code(0, 7, cols)
    row_low * 8 + col_high
end

function parse_code(low, high, code)
    for c in code
        if c == 'L' || c == 'F'
            high = floor((low + high) / 2) 
        else
            low = ceil((low + high) / 2)
        end
    end
    low, high
end

#= Stolen from @martinjonas, it's two times faster
function get_id(pass)
    arr = split(pass, "")
    replaced_arr = replace(arr, "F" => "0", "B" => "1", "L" => "0", "R" => "1")
    binary = join(replaced_arr, "")
    parse(Int, binary, base=2)
end =#

# Part 1
function part1(passes) 
    max((passes .|> strip .|> get_id)...) |> println
end

# Part 2
function part2(passes)
    sorted = passes .|> strip .|> get_id |> sort
    i = 1
    while i < length(sorted)
        if abs(sorted[i + 1] - sorted[i]) > 1
            return sorted[i + 1] - 1
        end
        i += 1
    end
end

@time begin
    part1(PASSES) |> println
    part2(PASSES) |> println
end