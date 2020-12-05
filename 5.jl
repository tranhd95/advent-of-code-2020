TEST = ["FBFBBFFRLR", "BFFFBBFRRR", "FFFBBBFRRR", "BBFFBBFRLL"]
PASSES = readlines("files/5.in")

function get_pass_id(pass)
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
        # println(c, " ", low, " ", high)
    end
    low, high
end

max(get_pass_id.(strip.(PASSES))...)
