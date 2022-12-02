
file = "input"
lines = readlines(file)
idx = vcat(firstindex(lines), findall(x->x=="", lines), lastindex(lines))
separated = [parse.(Int, lines[s:e]) for (s,e) ∈ zip(idx[1:end-1].+1, idx[2:end].-1)]
summed = [sum(cals) for cals∈separated]
summed[1] += parse(Int, lines[1])
println("top elve: $(maximum(summed))")
topthree = partialsort(summed, 1:3, rev=true)
println("top 3: $(sum(topthree))")
