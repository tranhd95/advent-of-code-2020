LINES = readlines("files/6.in")
ANSWERS = split(join(LINES, "-"), "--")

# Part 1
sum(setdiff.(ANSWERS, '-') .|> length) |> println
# Part 2
groups = split.(ANSWERS, '-')
mapreduce(group -> intersect((group |> Set)...) |> length, +, groups) |> println