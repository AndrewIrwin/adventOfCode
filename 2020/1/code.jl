# read input (stdio), interpret each line as an integer
# find the two that add together to give 2020
# return their product

# algorithm. Compute all sums (lower triangle).

import Base

# open("input.txt", "r") do io
#       write(io, "Hello world!")
# end;

text = Base.readlines("input.txt");
numbers = parse.(Int64, text);

p = (0,0,0);

N = length(numbers);

for i in 1:(N-1)
  for j in (i+1):N
    if numbers[i]+numbers[j] == 2020
      p = (numbers[i], numbers[j], numbers[i]*numbers[j]);
      print(p)
      print("\n");
    end
  end
end


for i in 1:(N-2)
  for j in (i+1):(N-1)
    for k in (j+1):(N)
      if numbers[i]+numbers[j]+numbers[k] == 2020
      p = (numbers[i], numbers[j], numbers[k], numbers[i]*numbers[j]*numbers[k]);
      print(p)
      print("\n");
    end
  end
end
end


