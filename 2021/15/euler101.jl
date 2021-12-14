# optimum polynomial

# given vector v of length n
# find interpolating polynomials for v[1], v[1:2], ..., v[1:n]

using Polynomials

function genSequence(N)
  n = 1:N 
  f(n) = 1 -n + n^2 -n^3 + n^4 -n^5 +n^6 -n^7 +n^8 -n^9 +n^10
  f.(n)
end

function interpoly(v)
  f = fit(1:length(v), v)
  f
end

# test data
s1 = [x^3 for x in 1:4]
interpoly(s1[1])
interpoly(s1[1:2])
interpoly(s1[1:3])
interpoly(s1[1:4])

function anomaly(s1)
  a = Int128(0)
  f0 = interpoly(s1)
  for i in 1:length(s1)
    f1 = interpoly(s1[1:i])  
    if f1(i+1) != f0(i+1)
      a += Int128(f1(i+1))
    end
  end
  a
end

anomaly(s1)

# problem data
s1 = genSequence(11)
anomaly(s1)
# 37076114526

