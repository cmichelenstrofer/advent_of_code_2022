# By Gunnar Farnebäck
# https://julialang.zulipchat.com/#narrow/stream/357313-advent-of-code-.282022.29/topic/day.2001/near/313224810

part1(input) = maximum(sum, parse_input(input))
part2(input) = sum(sort(sum.(parse_input(input)), rev=true)[1:3])
parse_input(input) = (x -> parse.(Int, split(x, "\n"))).(split(readchomp(input), "\n\n"))
