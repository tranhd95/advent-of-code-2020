function part1(input)
    prev = []
    new = apply_rules(input)
    cnt_applications = 1
    while prev != new
        prev = new
        new = apply_rules(new)
        cnt_applications += 1
    end
    count.(el -> el == '#', join.(new, "")) |> sum, cnt_applications
end

function apply_rules(map)
    result = deepcopy(map)
    width, height = length(map[begin]), length(map)
    for row ∈ 1:height, col ∈ 1:width
        if map[row][col] == "."
            continue
        end
        neigbours = count_neighbours(map, row, col)
        if map[row][col] == "L" && neigbours == 0
            result[row][col] = "#"
        elseif map[row][col] == "#" && neigbours ≥ 4
            result[row][col] = "L"
        end
    end
    result
end

function count_neighbours(map, row, col)
    cnt = 0
    width, height = length(map[1]), length(map)
    for y ∈ row - 1:row + 1, x ∈ col - 1:col + 1
        if (y == row && x == col)
            continue
        end
        if (1 ≤ y ≤ height && 1 ≤ x ≤ width) && map[y][x] == "#"
            cnt += 1
        end
    end
    cnt
end

function part2(input)
    prev = input
    new = apply_rules(input)
    cnt_applications = 1
    while prev != new
        prev = new
        new = apply_rules2(new)
        cnt_applications += 1
    end
    count.(el -> el == '#', join.(new, "")) |> sum, cnt_applications
end

function apply_rules2(map)
    result = deepcopy(map)
    width, height = length(map[begin]), length(map)
    for row ∈ 1:height, col ∈ 1:width
        if map[row][col] == "."
            continue
        end
        neigbours = count_neighbours2(map, row, col)
        if map[row][col] == "L" && neigbours == 0
            result[row][col] = "#"
        elseif map[row][col] == "#" && neigbours ≥ 5
            result[row][col] = "L"
        end
    end
    result
end

function count_neighbours2(map, row, col)
    cnt = 0
    for row_dir ∈ -1:1, col_dir ∈ -1:1
        if row_dir == 0 && col_dir == 0
            continue
        end
        dist = 0
        while true
            dist += 1
            y = row_dir * dist + row
            x = col_dir * dist + col
            if !(1 ≤ y ≤ length(map) && 1 ≤ x ≤ length(map[1]))
                break
            end
            if map[y][x] == "L"
                break
            end
            if map[y][x] == "#"
                cnt += 1
                break
            end
        end
    end
    cnt
end

@time begin
    INPUT = readlines("files/11.in") .|> str -> split(str, "")
    part1(INPUT) |> println 
    part2(INPUT) |> println
end