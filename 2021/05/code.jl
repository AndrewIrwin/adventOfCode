v = readlines("input.txt")

# split on -> and then on , to get 0-index x,y and x,y pairs
# then make array of 0s sufficiently large
# then fill in the lines

vv = split.(v, " -> ")

starts = [ parse.(Int, split.(vv[i], ",")[1]) for i in 1:length(v) ]
stops  = [ parse.(Int, split.(vv[i], ",")[2]) for i in 1:length(v) ]

n = maximum( [ maximum(maximum(starts)), maximum(maximum(stops))] )

board = zeros(Int, n+1, n+1)

for i in 1:length(v)
   if (starts[i][1] == stops[i][1] )  # increase in y only
     m1 = minimum((starts[i][2], stops[i][2]))
     m2 = maximum((starts[i][2], stops[i][2]))
     for j in m1:m2
        board[starts[i][1], j] += 1
     end
   elseif ( starts[i][2] == stops[i][2])  # increase in x only
     m1 = minimum((starts[i][1], stops[i][1]))
     m2 = maximum((starts[i][1], stops[i][1]))
     for j in m1:m2
        board[j, starts[i][2]] += 1
     end
   end
end

sum(board .== 2)
sum(board .>= 2)

# error - I didn't use 0 offset, so I suppose my matrix might be too small by 1 in each dimension. got away with it,

# part 2, include diagonal lines at 45 degree angle


board = zeros(Int, n+1, n+1)

for i in 1:length(v)
   if (starts[i][1] == stops[i][1] )  # increase in y only
     m1 = minimum((starts[i][2], stops[i][2]))
     m2 = maximum((starts[i][2], stops[i][2]))
     for j in m1:m2
        board[starts[i][1], j] += 1
     end
   elseif ( starts[i][2] == stops[i][2])  # increase in x only
     m1 = minimum((starts[i][1], stops[i][1]))
     m2 = maximum((starts[i][1], stops[i][1]))
     for j in m1:m2
        board[j, starts[i][2]] += 1
     end
   else # no need to check the diagonal lines are at the right slope
     d1 = sign(stops[i][1] - starts[i][1])
     d2 = sign(stops[i][2] - starts[i][2])
     for j in 0:abs(stops[i][1] - starts[i][1])
        board[starts[i][1] + j*d1, starts[i][2] + j*d2] += 1
     end
   end
end

sum(board .== 2)
sum(board .>= 2)



