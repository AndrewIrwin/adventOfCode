v = readlines("input.txt")
xx = split(v[1], ",")
x = parse.(Int, xx)

# have a vector of length 0-6 (7) to contain counts of each age of organism

counts = zeros(Int, 10)

for i in x
  counts[i+1] += 1  # leave room for 0 coutns
end

sum(counts)

# simulate days
# decrease all counters by 1
# make 0s in to 6s
# add one 8

for i in 1:80
  numberZeros = counts[1]
  for j in 2:10
    counts[j-1] = counts[j]
  end
  counts[6+1] += numberZeros
  counts[8+1] += numberZeros

end

sum(counts)


for i in 1:(256-80)
  numberZeros = counts[1]
  for j in 2:10
    counts[j-1] = counts[j]
  end
  counts[6+1] += numberZeros
  counts[8+1] += numberZeros
end

sum(counts)

