groups = split(read("files/6.in", String), "\n\n")

# Part 1
sum(setdiff.(groups, "\n") .|> length) |> println

# Part 2
person_answers = split.(groups, "\n", keepempty=false)
mapreduce(p -> intersect(p...) |> length, +, person_answers) |> println