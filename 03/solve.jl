
# part 1
file = "input"
items = readlines(file)
priorities_map = Dict(vcat(('a':'z'),('A':'Z')) .=> 1:52)

function find_same(a, b)
    for item in collect(a)
        item in b && return item
    end
    throw(ValueError())
end

function priority(ab)
    id = length(ab) .÷ 2
    a = ab[1:id]
    b = ab[id+1:end]
    p = find_same(a, b)
    return priorities_map[p]
end

priorities = priority.(items)
println("Answer part 1: $(sum(priorities))")


# part 2
function group_badge_priority(abc)
    a,b,c = abc
    for ia ∈ collect(a)
        (ia ∈ b) && (ia ∈ c) &&  return priorities_map[ia]
    end
    throw(ValueError)
end

n = 3
groups = [items[i:min(i + n - 1, end)] for i in 1:n:length(items)]

priorities = group_badge_priority.(groups)
println("Answer part 2: $(sum(priorities))")
