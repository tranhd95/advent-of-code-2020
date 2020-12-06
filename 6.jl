LINES = map(strip, readlines("files/6.in"))
ANSWERS = split(join(LINES, "-"), "--")

# Part 1
# sum(ANSWERS .|> Set .|> set -> delete!(set, '-') |> length)

# Part 2
groups = ANSWERS .|> a -> split(a, '-')
global summ = 0
for group in groups
    sets = group .|> Set
    global summ += intersect(sets...) |> length
end
summ