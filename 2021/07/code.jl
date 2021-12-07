
v = readlines("input.txt")
# v = readlines("test.txt")

vv = split(v[1], ",")
x = parse.(Int, vv)

mean(x) = sum(x)/length(x)

# Find an integer z such that sum |x-z| is minimized
# not too clear why this isn't approximately the mean...

distance(x, z) = sum(abs.(x .- z))

d_min = Inf
z_min = 0

for z in minimum(x):maximum(x)
  d = distance(x,z)
  if d < d_min
    d_min = d
    z_min = z
  end
end

# part 2
# distance is now the triangular number n(n+1)/2

function distance2(x, z) 
  delta = abs.(x .- z)
  tri = delta .* (delta .+ 1) .÷ 2
  sum(tri)
end

d_min = Inf
z_min = 0

for z in minimum(x):maximum(x)
  d = distance2(x,z)
  if d < d_min
    d_min = d
    z_min = z
  end
end


