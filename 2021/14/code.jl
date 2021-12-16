v = readlines("test.txt")
v = readlines("input.txt")

v1 = v[1]
vv = split.(v[3:end], " -> ")
vd = Dict()
for i in vv
  vd[i[1]]=i[2]
end


# polymer transformation rule

function polymerTransform(s1)
  s2 = string(s1[1])
  for i in 1:(length(s1)-1)
    # s2 *= string(s1[i])
    s2 *= string(vd[s1[i:(i+1)]])
    s2 *= string(s1[i+1])
  end
  s2 
end

v2 = polymerTransform(v1)
v3 = polymerTransform(v2)
v4 = polymerTransform(v3)
v5 = polymerTransform(v4)

vv = deepcopy(v1)
for i in 1:10
  vv = polymerTransform(vv)
end

# count frequencies
function countFreq(s) 
  counts = Dict()
  for i in 1:length(s) 
    si = s[i]
    if si in keys(counts)
      counts[si] += 1
    else
      counts[si] = 1
    end
  end
  counts
end

countFreq(v5)
cf = countFreq(vv)
maximum(values(cf)) - minimum(values(cf))

# Part 2
# rewrite as a recursion
# counting the number of pairs
# each pair gives rise to two pairs

# sd: dictionary of original string, with counts for number of occurrences
# vd: transformation rules dictionary

# string as Dict with counts
sd = Dict()
for i in 1:(length(v1)-1)
    si = v1[i:(i+1)]
    if si in keys(sd)
      sd[si] += 1
    else
      sd[si] = 1
    end
end

# transform Dict
function transformDict(d)
  nd = Dict()
  for i in d
    i1 = vd[i[1]]
    n1 = string(i[1][1]) * string(i1)
    n2 = string(i1) * string(i[1][2])
    if n1 in keys(nd)
      nd[n1] += i[2]
    else
      nd[n1] = i[2]
    end
    if n2 in keys(nd)
      nd[n2] += i[2]
    else
      nd[n2] = i[2]
    end
  end
  nd 
end

nd = deepcopy(sd)
for i in 1:10
  nd = transformDict(nd)
end

# count number of each letter: use first letter in each key, plus add one of 
# last letter in v1

# count frequencies
function countFreq(d) 
  counts = Dict()
  counts[v1[end]] = 1
  for i in d
    si = i[1][1]
    if si in keys(counts)
      counts[si] += i[2]
    else
      counts[si] = i[2]
    end
  end
  counts
end

nd = deepcopy(sd)
for i in 1:40
  nd = transformDict(nd)
end

cf = countFreq(nd)
maximum(values(cf)) - minimum(values(cf))


