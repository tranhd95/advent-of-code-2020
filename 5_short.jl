i = readlines("files/5.in")
# Part 1
c = (i .|> p -> parse(Int, map(x -> x ∈ ['B','R'] ? '1' : '0', p), base=2))
# Part 2
setdiff(Set(min(c...):max(c...)), Set(c))