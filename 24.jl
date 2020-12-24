INPUT = readlines("files/24.in")

function parse_line(line)
    i = 1
    parsed = []
    while i ≤ length(line)
        letter = line[i]
        if letter == 'e'
            push!(parsed, "e")
            i += 1
        elseif letter == 's' && line[i + 1] == 'e'
            push!(parsed, "se")
            i += 2
        elseif letter == 's' && line[i + 1] == 'w'
            push!(parsed, "sw")
            i += 2
        elseif letter == 'w'
            push!(parsed, "w")
            i += 1
        elseif letter == 'n' && line[i + 1] == 'w'
            push!(parsed, "nw")
            i += 2
        elseif letter == 'n' && line[i + 1] == 'e'
            push!(parsed, "ne")
            i += 2
        end
    end
    parsed
end

function part1(lines)
    lines = parse_line.(lines)
    tiles = Dict{Tuple{Int,Int},Bool}((x, y) => true for x = -100:100 for y = -100:100)
    for line in lines
        x, y = 0, 0
        for dir in line
            if dir == "e"
                x += 1
            elseif dir == "w"
                x -= 1
            elseif dir == "se"
                y += 1
            elseif dir == "sw"
                x -= 1
                y += 1
            elseif dir == "nw"
                y -= 1
            elseif dir == "ne"
                x += 1
                y -= 1
            end
        end
        tiles[(x, y)] = !get(tiles, (x, y), true)
    end
    tiles, count(x -> x == 0, values(tiles))
end


function part2(n) 
    is_black, c = part1(INPUT)
    for i = 1:n
        dct = copy(is_black)
        for (k, v) in is_black
            w, b = get_neigbours(is_black, k[1], k[2])
            if v == false && (b == 0 || b > 2)
                dct[(k[1], k[2])] = true
            elseif v == true && b == 2
                dct[(k[1], k[2])] = false
            end
        end
        is_black = dct
    end
    count(x -> x == false, values(is_black))
end


function get_neigbours(tiles, x, y)
    coords = [(x, y - 1), (x + 1, y - 1), (x + 1, y), (x, y + 1), (x - 1, y + 1), (x - 1, y)]
    white, black = 0, 0
    for (a, b) in coords
        color = get(tiles, (a, b), true)
        if color
            white += 1
        else
            black += 1
        end
    end
    white, black
end

part2(100)