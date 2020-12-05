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

# Part 1
max((PASSES .|> strip .|> get_id)...) |> println

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

part2(PASSES) |> println