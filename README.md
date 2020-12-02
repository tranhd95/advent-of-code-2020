# Advent of Code 2020 in Julia 🟢🔴🟣!
- [The Julia Programming Language Official Website](https://julialang.org/)

## Julia Features Notes

**Nested loops syntactic sugar**

```julia
collection = [1, 2, 3]
for i in collection, j in collection
	print(i, j)
end
# 11 12 13 
# 21 22 23 
# 31 32 33
```

**Local variable that can be used as a Walrus operator**

- https://docs.julialang.org/en/v1/base/base/#local

```julia
if (local foo = 1) > 0
	println(foo)
end
# 1
```

**count(el -> Bool, collection) and probably more useful collection utilities**

- https://docs.julialang.org/en/v1/base/collections/#Base.count

```julia
count(i -> (4 ≤ i ≤ 6), [2,3,4,5,6]) 
# 3
```