LINES = map(strip, readlines("files/6.in"))
ANSWERS = split(join(LINES, "-"), "--")

# Part 1
sum(ANSWERS .|> Set .|> set -> delete!(set, '-') |> length) |> println

# Part 2
groups = ANSWERS .|> a -> split(a, '-')
mapreduce(group -> intersect((group |> Set)...) |> length, +, groups) |> println