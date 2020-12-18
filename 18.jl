INPUT = readlines("files/18.in")

# Override operations to solve precedence
-(a, b) = a * b
/(a, b) = a + b
replace_multiplication = line -> replace(line, "*" => "-")
replace_addition = line -> replace(line, "+" => "/")

function part1(input)
    input .|> 
        replace_multiplication .|> 
        Meta.parse .|> 
        eval |>
        sum
end


function part2(input)
    input .|> 
        replace_multiplication .|> 
        replace_addition .|> 
        Meta.parse .|> 
        eval |> 
        sum
end

part1(INPUT) |> println
part2(INPUT) |> println
