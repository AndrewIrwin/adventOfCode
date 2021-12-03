
v = readlines("input.txt")
# v = readlines("test.txt")# bug in test data / analysis for 5th bit; not eq.

# count number of 1s in each bit position

bitOnes = zeros(Int, length(v[1]))
n = length(v)
for i in 1:length(v[1])
  for j in 1:n
    if v[j][i] == '1'
       bitOnes[i] += 1;
    end
  end
end

gamma = 0
epsilon = 0
power = 1
for i in length(bitOnes):-1:1
   if bitOnes[i] > n/2
      gamma += power
   else
      epsilon += power
   end
   power *= 2
end

gamma*epsilon

# part 2
# find the number with the most commmon (or not) bit in each position
# move from L to R (high bit to low bit) and stop when only one remains
# implement this with two vectors of flags and stop when only one remains
# if equal numbers of 0s and 1s, interpret as 1 for oxygen, 0 for co2

common = [ bitOnes[i] >= n/2 ? 1 : 0 for i in 1:length(bitOnes)]
oxygen = ones(Int, n)
co2 = ones(Int, n)
for j in 1:length(common)
  for i in 1:n
    if v[i][j] == string(common[j])[1]  # most  common bit
      if sum(co2) > 1
        co2[i] *= 0  # get rid of co2
      end
    else
      if sum(oxygen) > 1
        oxygen[i] *= 0
      end
    end
  end
  if (sum(co2) == 1 ) & (sum(oxygen) == 1)
    break
  end
end

# get the entries
v[co2 .== 1][1]
v[oxygen .== 1][1]

# and the common string
Tuple( string.(common))
*("0", "0", "0", "0", "1", "0", "1", "1", "0", "0", "0", "1")
 # not sure why *(Tuple(string.(common)))  # fails

parse(Int, v[co2 .== 1][1], base = 2) * parse(Int, v[oxygen .== 1][1], base = 2)
# 688864

# bug? where is my confusion?
# 
