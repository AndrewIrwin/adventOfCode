
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
# recompute the most common bit from each filtered subset
# if equal numbers of 0s and 1s, interpret as 1 for oxygen, 0 for co2

# common = [ bitOnes[i] >= n/2 ? 1 : 0 for i in 1:length(bitOnes)]

# write a filter function based on the task description
# this is hideous, but it works

function filter(v, position, ties, mostCommon)  # ties is '0' or '1' (who wins on a tie), mostCommon is true or false
   count = 0
   for i in v
      if i[position] == '1'
        count += 1
      end
   end

   keep = '1'
   if count == length(v)/2
     keep = ties
   elseif (mostCommon & (count < length(v)/2)) | ( (!mostCommon) & (count > length(v)/2) )
     keep = '0'
   end

   result = []
   for i in 1:length(v)
     if v[i][position] == keep
       append!(result, [v[i]])
     end
   end
   result
end

# filter(v, 1, '1', true)

o2 = filter(v, 1, '1', true)
i = 2
while (length(o2)>1)
  o2 = filter(o2, i, '1', true)
  i += 1
end

co2 = filter(v, 1, '0', false)
i = 2
while (length(co2)>1)
  co2 = filter(co2, i, '0', false)
  i += 1
end

parse(Int, co2[1], base = 2) * parse(Int, o2[1], base = 2)
# 3379326

