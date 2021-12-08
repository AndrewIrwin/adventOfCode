v = readlines("input.txt")[1:200];
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

function decode(cvv) 
  # vvv has 10 entries representing each digit, plus 4 to decode
  k = [join(sort(collect(s))) for s in vvv[1:10]]
  n = [join(sort(collect(s))) for s in vvv[12:end]]
  d = zeros(10)  # which digit is each
  for i in 1:10
    if length(k[i]) == 2
       d[i] = 1
    elseif length(k[i]) == 3
       d[i] = 7
    elseif length(k[i]) == 4
       d[i] = 4
    elseif length(k[i]) == 7
       d[i] = 8

end

