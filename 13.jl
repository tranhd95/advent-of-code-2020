INPUT = readlines("files/13.in")
EARLIEST = parse(Int, INPUT[1])
BUSES = split(INPUT[2], ",")
BUSES_WITHOUT_X =  parse.(Int, filter(id -> id != "x", split(INPUT[2], ",")))
TEST = readlines("files/13.test")

function part1(earliest, buses)
    waits = []
    for bus_id ∈ buses
        time = 0
        while time < earliest
            time += bus_id
        end
        push!(waits, time - earliest)
    end
    shortest_wait_id = argmin(waits)
    buses[shortest_wait_id] * waits[shortest_wait_id]
end

function part2(buses)
    #= 
    We find the solution by solving this system of congruence equations:
    x ≡ 0                       (mod bus₁)
    x ≡ bus₂ - bus₂'s position  (mod bus₂)
    ...
    x ≡ busₙ - busₙ's position   (mod busₙ) =#
    bus_indices = findall(x -> x != "x", buses)
    buses = parse.(Int128, buses[bus_indices])
    offsets = buses .- bus_indices .+ 1 # 1-based indexing
    chineseremainder(buses, offsets)
end

# Shamelessly stolen from https://rosettacode.org/wiki/Chinese_remainder_theorem#Julia
function chineseremainder(n::Array, a::Array)
    # n - moduli
    # a - remainders
    Π = prod(n)
    mod(sum(ai * invmod(Π ÷ ni, ni) * Π ÷ ni for (ni, ai) in zip(n, a)), Π)
end

part1(EARLIEST, BUSES_WITHOUT_X) |> println
part2(BUSES) |> println