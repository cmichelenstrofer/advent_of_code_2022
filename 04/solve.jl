
# part 1
pairs = readlines("input")

function is_contained(pair)
    a,b = split(pair, ",")
    as, ae = parse.(Int, split(a, "-"))
    bs, be = parse.(Int, split(b, "-"))
    a_big = as<=bs && ae>=be
    b_big = bs<=as && be>=ae
    (a_big || b_big) && return 1
    return 0
end

println("Part 1 answer: $(sum(is_contained.(pairs)))")

# part 2

function overlap(pair)
    a,b = split(pair, ",")
    as, ae = parse.(Int, split(a, "-"))
    bs, be = parse.(Int, split(b, "-"))
    ((ae < bs) || (as > be)) && return 0
    return 1
end

println("Part 2 answer: $(sum(overlap.(pairs)))")
