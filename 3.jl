pattern = readlines("files/3.txt")

function part1(pattern, slope)
    row, col = 1, 1
    row_length = length(pattern[begin])
    trees_count = 0
    while row ≤ length(pattern)
        trees_count += pattern[row][col] == '#'
        # col = ((col + slope[1]) > row_length) ? (col + slope[1]) - row_length : col + slope[1] 
        col = ((col + slope[1] - 1) % row_length) + 1 # Matajon++
        row += slope[2]
    end
    trees_count
end

slopes = [
    [1, 1],
    [3, 1],
    [5, 1],
    [7, 1],
    [1, 2]
]
    
function part2(pattern)
    reduce(*, map(slope -> part1(pattern, slope), slopes))
end
    
println(part2(pattern))
println(part1(pattern, [3, 1]))