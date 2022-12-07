#                 [M]     [W] [M]
#             [L] [Q] [S] [C] [R]
#             [Q] [F] [F] [T] [N] [S]
#     [N]     [V] [V] [H] [L] [J] [D]
#     [D] [D] [W] [P] [G] [R] [D] [F]
# [T] [T] [M] [G] [G] [Q] [N] [W] [L]
# [Z] [H] [F] [J] [D] [Z] [S] [H] [Q]
# [B] [V] [B] [T] [W] [V] [Z] [Z] [M]
#  1   2   3   4   5   6   7   8   9

stacks = Dict(
    1 => ['B', 'Z', 'T'],
    2 => ['V', 'H', 'T', 'D', 'N'],
    3 => ['B', 'F', 'M', 'D'],
    4 => ['T', 'J', 'G', 'W', 'V', 'Q', 'L'],
    5 => ['W', 'D', 'G', 'P', 'V', 'F', 'Q', 'm'],
    6 => ['V', 'Z', 'Q', 'G', 'H', 'F', 'S'],
    7 => ['Z', 'S', 'N', 'R', 'L', 'T', 'C', 'W'],
    8 => ['Z', 'H', 'W', 'D', 'J', 'N', 'R', 'M'],
    9 => ['M', 'Q', 'L', 'F', 'D', 'S']
)

start = 11
moves = [(parse.(Int, move[2]), parse.(Int, move[4]), parse.(Int, move[6])) for move in split.(readlines("input")[start:end])]

for move in moves
    nitems, from, to = move
    for i in 1:nitems
        crate = pop!(stacks[from])
        push!(stacks[to], crate)
    end
end

println("Part 1:")
display(stacks)

for i in 1:length(stacks)
    print(stacks[i][end])
end
println("")


# part 2

stacks = Dict(
    1 => ['B', 'Z', 'T'],
    2 => ['V', 'H', 'T', 'D', 'N'],
    3 => ['B', 'F', 'M', 'D'],
    4 => ['T', 'J', 'G', 'W', 'V', 'Q', 'L'],
    5 => ['W', 'D', 'G', 'P', 'V', 'F', 'Q', 'm'],
    6 => ['V', 'Z', 'Q', 'G', 'H', 'F', 'S'],
    7 => ['Z', 'S', 'N', 'R', 'L', 'T', 'C', 'W'],
    8 => ['Z', 'H', 'W', 'D', 'J', 'N', 'R', 'M'],
    9 => ['M', 'Q', 'L', 'F', 'D', 'S']
)


for move in moves
    nitems, from, to = move
    l = length(stacks[from])
    crates = splice!(stacks[from], (l-nitems+1):l)
    stacks[to] = vcat(stacks[to], crates)
end

println("Part 2:")
display(stacks)

for i in 1:length(stacks)
    print(stacks[i][end])
end
println("")
