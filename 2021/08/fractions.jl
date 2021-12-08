# for project euler problem 26
# perform long division of 1/n
# return pairs (result, remainder) for each step of long division,
# stopping when periodicity is detected

function oneStep(a, b) 
  # divide a/b to one decimal place, return result + remainder
  result = Int(floor(a/b))
  remainder = a % b
  (result, remainder)
end

function sequenceSteps(a,b)
  sequence = []
  while true # for i in 1:10 # while true
    if a > b
      os = oneStep(a,b)
    else
      os = oneStep(10*a, b)
    end 
    if os in sequence
      append!(sequence, [os])  # for detecting repeat length
      break
    else
      append!(sequence, [os])
    end
    a = os[2]
  end
  sequence 
end

# Find length of digital expansion (a few errors, e.g, for 1/1)

repeatLength = zeros(1000);
for i in 1:1000
  repeatLength[i] = length(sequenceSteps(1,i)) - 1 
end

findmax(repeatLength)  # max value, index

# Find length of repeating part of 1/n for n = 1:1000

repeatLength = zeros(1000);
for i in 1:1000
  ss = sequenceSteps(1,i)
  # find first occurrence (findnext() doesn't work)
  first = 1
  repeatLength[i] = length(sequenceSteps(1,i)) - first
end

