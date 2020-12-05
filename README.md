# Advent of Code 2020 in Julia 🔵🟢🔴🟣!
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

**Function composition**

- https://docs.julialang.org/en/v1/manual/functions/#Function-composition-and-piping

- Function composition

$$
f(g(h(x))) = (f\circ g \circ h)(x)
$$

```julia
# ∘ \circ<tab>
(sqrt ∘ +)(3, 6) # -> 3.0
∘(sqrt, +)(3, 6) # -> 3.0

# Multiple functions
square = x -> x^2
∘(sqrt, square, sqrt, square)(32) # -> 32.00000000000001
```

**Unpacking list of arguments**

```julia
arguments = [sqrt, square, sqrt, square]
∘(arguments...)(32) # -> 32.00000000000001
```

**Piping**

- https://docs.julialang.org/en/v1/manual/functions/#Function-composition-and-piping

```julia
square = x -> x^2
increment = x -> x+1
5 |> increment |> square |> print # -> 36

# Elementwise application
numbers = [1, 2, 3]
numbers .|> increment .|> square # -> [4, 9 ,16]
# Equivalent to
map(x -> x |> increment |> square, numbers)
```

**Measuring the execution time**

```julia
@time begin
    ...
end
```









