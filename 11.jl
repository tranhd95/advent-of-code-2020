INPUT = readlines("files/11.in") .|> str -> split(str, "")

function part1(input)
    prev = deepcopy(input)
    new = apply_rules(deepcopy(input))
    while prev != new
        prev = deepcopy(new)
        new = apply_rules(new)
        # joint = new .|> line -> join(line, "") 
        # show(stdout, "text/plain", joint)
        # println()
    end
    count.(el -> el == '#', join.(new, "")) |> sum
end

function apply_rules(map)
    result = deepcopy(map)
    width, height = length(map[begin]), length(map)
    for row ∈ 1:height 
        for col ∈ 1:width
            if map[row][col] == "."
                continue
            end
            neigbours = count_neighbours(map, row, col)
            # print(neigbours)
            if map[row][col] == "L" && neigbours == 0
                result[row][col] = "#"
            elseif map[row][col] == "#" && neigbours ≥ 4
                result[row][col] = "L"
            end
        end
        # println()
    end
    result
end

function count_neighbours(map, row, col)
    cnt = 0
    for y ∈ row - 1:row + 1, x ∈ col - 1:col + 1
        if y == row && x == col
            continue
        end
        try
            if map[y][x] == "#"
                cnt += 1
            end
        catch
        end
    end
    cnt
end

function part2(input)
    prev = deepcopy(input)
    new = apply_rules(deepcopy(input))
    while prev != new
        prev = deepcopy(new)
        new = apply_rules2(new)
        # joint = new .|> line -> join(line, "") 
        # show(stdout, "text/plain", joint)
        # println()
    end
    count.(el -> el == '#', join.(new, "")) |> sum
end

function apply_rules2(map)
    result = deepcopy(map)
    width, height = length(map[begin]), length(map)
    for row ∈ 1:height 
        for col ∈ 1:width
            if map[row][col] == "."
                continue
            end
            neigbours = count_neighbours2(map, row, col)
            # print(neigbours)
            if map[row][col] == "L" && neigbours == 0
                result[row][col] = "#"
            elseif map[row][col] == "#" && neigbours ≥ 5
                result[row][col] = "L"
            end
        end
        # println()
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

# part1(INPUT)           
part2(INPUT)             