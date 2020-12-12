INPUT = readlines("files/12.in") .|> x -> [x[1], parse(Int, x[2:end])]

function part1(actions)
    x, y = 0, 0
    deg = 0
    for (instruction, value) ∈ actions
        if instruction == 'N'
            y += value
        elseif instruction == 'S'
            y -= value
        elseif instruction == 'E'
            x += value
        elseif instruction == 'W'
            x -= value
        elseif instruction == 'L'
            deg += value
        elseif instruction == 'R'
            deg -= value
        elseif instruction == 'F'
            x += round(value * cos(deg2rad(deg)))
            y += round(value * sin(deg2rad(deg)))
        end
    end
    abs(x) + abs(y)
end

function part2(actions)
    x, y = 0, 0
    w_x, w_y = 10, 1
    for (instruction, value) ∈ actions
        if instruction == 'N'
            w_y += value
        elseif instruction == 'S'
            w_y -= value
        elseif instruction == 'E'
            w_x += value
        elseif instruction == 'W'
            w_x -= value
        elseif instruction ∈ ['R', 'L']
            value = (instruction == 'R') ? deg2rad(-value) : deg2rad(value)
            R = [cos(value) -sin(value);
                 sin(value) cos(value)]
            w_x, w_y = round.(R * [w_x ;w_y])
        elseif instruction == 'F'
            x += value * w_x
            y += value * w_y
        end
    end
    abs(x) + abs(y)
end

@show part1(INPUT)
@show part2(INPUT)