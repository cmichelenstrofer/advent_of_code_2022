# By Gunnar Farnebäck
# https://julialang.zulipchat.com/#narrow/stream/357313-advent-of-code-.282022.29/topic/day.2002/near/313444147

part1(input) = sum(3 * mod(1 + x - a, 3) + 1 + x for (a, x) in parse_input(input))
part2(input) = sum(3 * x + 1 + mod(a + x - 1, 3) for (a, x) in parse_input(input))
parse_input(input) = ((line[1] - 'A', line[3] - 'X') for line in eachline(input))
