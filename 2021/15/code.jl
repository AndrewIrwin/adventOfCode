# shortest path

# v = readlines("test.txt")
 v = readlines("input.txt")

# test pattern shows bug in path finding routine - need to check down and maybe right too
v = ["19999", "19111", "11191", "99991", "99991"]

N = length(v)
M = length(v[1])
W = zeros(Int, N, M)  # weight matrix
D = zeros(Int, N, M)  # distance (total risk) matrix

for i in 1:N
   for j in 1:M
      W[i,j] = parse(Int, v[i][j])
   end
end

# start in LR corner.
# if D == 0 then make D = maximum of boundary
# Travel along diagonals

for i in N:-1:1
  for j in M:-1:1
    if (i>1) | (j>1)
      D[i,j] = W[i,j]
    end
    if (i+1 <= N) & (j+1 <= M)
        D[i,j] += minimum([D[i,j+1], D[i+1,j]])
    elseif i+1 <= N
        D[i,j] += D[i+1,j]
    elseif j+1 <= M
        D[i,j] += D[i,j+1]
    end
    # check for down steps. Is there a direction below to shrink pathlength?
    if i+1 <= N
      D[i+1,j] = minimum([D[i+1,j],  D[i,j] + W[i+1,j]])
      # i += 1 # start this row over
      # break # wrong logic, but not sure it will even work
    end
  end
end

# phase 2
# build W5 that is 5x5 times larger from W

NN = 5*N
W5 = zeros(Int, NN, NN)

for i in 1:5
  for j in 1:5
    W5[N*(i-1) .+ (1:N), N*(j-1) .+ (1:N)] = (W .+ (i+j-2) ) 
    W5[W5 .> 9] .-= 9
  end
end 

D5 = zeros(Int, NN, NN)

for i in NN:-1:1
  for j in NN:-1:1
    if (i>1) | (j>1)
      D5[i,j] = W5[i,j]
    end
    if (i+1 <= NN) & (j+1 <= NN)
        D5[i,j] += minimum([D5[i,j+1], D5[i+1,j]])
    elseif i+1 <= NN
        D5[i,j] += D5[i+1,j]
    elseif j+1 <= NN
        D5[i,j] += D5[i,j+1]
    end
  end
end


# works on test data
# but fails to get approved answer on input data

