
file = "input"
plays = split.(readlines(file))
shape_points = Dict("X"=>1, "Y"=>2, "Z"=>3)
los = [("A", "Z"), ("B", "X"), ("C", "Y")]
tie = [("A", "X"), ("B", "Y"), ("C", "Z")]
win = [("A", "Y"), ("B", "Z"), ("C", "X")]

function my_score(move_elf, move_me)
    score = shape_points[move_me]
    (move_elf, move_me) ∈ los && return score
    (move_elf, move_me) ∈ tie && return score + 3
    (move_elf, move_me) ∈ win && return score + 6
    throw(ArgumentError("move pair ($move_elf, $move_me) not recognized"))
end

score = sum([my_score(x,y) for (x,y) in plays])
println("My total score according to the strategy guide: $score")

## Part 2
strategy_points = Dict("X"=>0, "Y"=>3, "Z"=>6)
new_shape_points = Dict(
    "X" => Dict("A"=>shape_points["Z"], "B"=>shape_points["X"], "C"=>shape_points["Y"]),
    "Y" => Dict("A"=>shape_points["X"], "B"=>shape_points["Y"], "C"=>shape_points["Z"]),
    "Z" => Dict("A"=>shape_points["Y"], "B"=>shape_points["Z"], "C"=>shape_points["X"]),
)

function my_score_correct(move_elf, strategy)
    score = strategy_points[strategy]
    return score + new_shape_points[strategy][move_elf]
end

score = sum([my_score_correct(x,y) for (x,y) in plays])
println("My correct score: $score")
