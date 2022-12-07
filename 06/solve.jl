
function start_of_x(buffer, n)
    buffer = collect(buffer)
    for i in 1:length(buffer)
        if allunique(buffer[1:n])
            return i+n-1
        end
        popfirst!(buffer)
    end
    throw(ErrorException)
end

start_of_packet(buffer) = start_of_x(buffer, 4)
start_of_message(buffer) = start_of_x(buffer, 14)

println("part 1: $(start_of_packet(readline("input")))")
println("part 2: $(start_of_message(readline("input")))")
