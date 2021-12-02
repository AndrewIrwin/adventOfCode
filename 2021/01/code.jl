v = readlines("input.txt")
x = parse.(Int64, v[1:2000])  # drop blank line at end

# part 1
sum( diff(x) .> 0)

# part 2
# make running sum of length 3
rs = [ x[i] + x[i+1] + x[i+2] for i in 1:(length(x)-2)]
rs = [ sum(x[i:(i+2)]) for i in 1:(length(x)-2)]


# then do same check
sum( diff(rs) .> 0)

# alternative
using RollingFunctions
sum(diff(rolling(sum,vec(x),3)) .> 0)
