v = readlines("input.txt")[1:200];
# v = readlines("test.txt");
vv = split.(v, " ");

count1478 = 0

for x in vv
  i =  length.(x[(end-3):end])
  count1478 += sum( (i .== 2) .| (i .== 3) .| ( i .== 4) .| (i .==7))
end

# now decode values
# and report sum

# length 2 code is 1, contains 'cf' which are also in 0, 3, 9
# length 3 code is 7, contains 'acf' which are in 0, 3, 9 as well
# length 4 code is 4, contains 'bcdf' which is in 9
# length 7 code is 8, contains 'abcdef'

# diagnostics
# 9: contains same letters as 4 + 2 more ('ag') missing only 'e'
# 0: missing only 'd'
# 2:
# 3:
# 5:
# 6:

function decode(vvv) 
  # vvv has 10 entries representing each digit, plus 4 to decode
  k = [join(sort(collect(s))) for s in vvv[1:10]]
  n = [join(sort(collect(s))) for s in vvv[12:end]]
  d = zeros(Int, 10)  # which digit is each
  dInv = zeros(Int, 10)  # inverse function
  for i in 1:10
    if length(k[i]) == 2
       d[i] = 1
       dInv[1+1] = i
    elseif length(k[i]) == 3
       d[i] = 7
       dInv[1+7] = i
    elseif length(k[i]) == 4
       d[i] = 4
       dInv[1+4] = i
    elseif length(k[i]) == 7
       d[i] = 8
       dInv[1+8] = i
    end
  end
  # now use these 4 to decode the last 6 numbers
  for i in 1:10
    if length(k[i]) == 5  # digit 2, 3, 5
      if length(setdiff(k[i], k[dInv[1+7]])) == 2  # found the 3
        d[i] = 3
        dInv[1+3] = i
      elseif length(setdiff(k[i], k[dInv[1+4]])) == 2  # found the 5
        d[i] = 5
        dInv[1+5] = i
      else
        d[i] = 2
        dInv[1+2] = i
      end 
    elseif length(k[i]) == 6  # digit 0, 6, 9
      if length(setdiff(k[i], k[dInv[1+1]])) == 5  # found the 6
        d[i] = 6
        dInv[1+6] = i
      elseif length(setdiff(k[i], k[dInv[1+4]])) == 2  # found the 0
        d[i] = 9
        dInv[1+9] = i
      else
        d[i] = 0
        dInv[1+0] = i
      end 
    end
  end
  #  d
  sum([d[i .== k][1] for i in n] .* [10^k for k in 3:-1:0])
end

# decode each line and report number detected

a = decode.(vv)
sum(a)

