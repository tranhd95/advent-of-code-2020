INPUT = split.(readlines("files/21.in"), "(contains")
INGREDIENTS = split.(getindex.(INPUT,  1), " ", keepempty=false)
INGREDIENTS_ALLERGENS = split.(getindex.(INPUT,  2), " ", keepempty=false) .|>
                        allergens -> replace.(allergens, [')', ','] => "")
UNIQUE_ALLERGENS = union(INGREDIENTS_ALLERGENS...)

function part1()
    may_contain = Dict(allergen => [] for allergen in UNIQUE_ALLERGENS)
    for (i, allergen_lst) in enumerate(INGREDIENTS_ALLERGENS)
        for allergen in allergen_lst
            push!(may_contain[allergen], INGREDIENTS[i])
        end
    end
    contain = Set()
    for (k, v) in may_contain
        push!(contain, intersect(v...)...)
    end
    count = 0
    for ingredients in INGREDIENTS
        for ingredient in ingredients
            if ingredient ∉ contain
                count += 1
            end
        end
    end
    count
end

function part2()
    may_contain = Dict(allergen => [] for allergen in UNIQUE_ALLERGENS)
    for (i, allergen_lst) in enumerate(INGREDIENTS_ALLERGENS)
        for allergen in allergen_lst
            push!(may_contain[allergen], INGREDIENTS[i])
        end
    end
    for (k, v) in may_contain
        may_contain[k] = intersect(v...)
    end
    matches = Dict{String,Array{String,1}}()
    while length(matches) < length(UNIQUE_ALLERGENS)
        for (k, v) in may_contain
            if length(v) == 1
                matches[k] = v
                delete!(may_contain, k)
                for (k2, v2) in may_contain
                    may_contain[k2] = filter(x -> x != first(v), v2)
                end
            end
        end
    end
    join(first.(getfield.(matches |> collect |> sort, 2)), ",")
end

part2()