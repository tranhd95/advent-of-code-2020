DECKS = split.(split(read("files/22.in", String), "\n\n"), "\n") .|>
        cards -> map(x -> parse(Int32, x), cards[2:end])
function part1(input)
    deck1, deck2 = input[1], input[2]
    while length(deck1) > 0 && length(deck2) > 0
        deck1, deck2 = play_round1(deck1, deck2)
    end
    sum(deck1 .* collect(length(deck1):-1:1)) + sum(deck2 .* collect(length(deck2):-1:1))
end

function play_round1(deck1, deck2)
    c1 = popfirst!(deck1)
    c2 = popfirst!(deck2)
    if c1 > c2
        push!(deck1, c1)
        push!(deck1, c2)
    else
        push!(deck2, c2)
        push!(deck2, c1)
    end
    deck1, deck2
end

# function part2(input)
#     deck1, deck2 = input[1], input[2]
#     history = Array{Array{Int,1},1}()
#     history[1][1] = copy(deck1), copy(deck2)
#     round = 1
#     while length(deck1) > 0 && length(deck2) > 0
#         deck1, deck2 = play_round(deck1, deck2, history)
#         round += 1
#         history[1][round], history[2][round] = copy(deck1), copy(deck2)
#     end
#     # sum(deck1 .* collect(length(deck1):-1:1)) + sum(deck2 .* collect(length(deck2):-1:1))
# end

# function play_round2(deck1, deck2, history)
#     if deck1 in history[1] && deck2 in history[2]

#     c1 = popfirst!(deck1)
#     c2 = popfirst!(deck2)
#     if c1 > c2
#         push!(deck1, c1)
#         push!(deck1, c2)
#     else
#         push!(deck2, c2)
#         push!(deck2, c1)
#     end
#     deck1, deck2
# end

# part1(DECKS)
