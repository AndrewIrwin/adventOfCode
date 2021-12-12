v = readlines("input.txt");
# v = readlines("test.txt");

x = zeros(Int, 10, 10);
for i in 1:10
  for j in 1:10
    x[i,j] = parse(Int, v[i][j])
  end
end

function step1!(x)
  # increase all values by 1
  # if neighbour (8 of them) is 9, increase by 1
  # all 9s get counted as flashes and added to total
  for i in 1:100
    x[i] += 1
  end
  flash = zeros(Int, 10, 10);
  dirty = true # need to check for flashes
  while dirty
    dirty = false # check grid once, unless a new flash is generated
    for i in 1:10
      for j in 1:10
        if (x[i,j] > 9) & (flash[i,j] == 0)
          flash[i,j] = 1
          for k in (-1):1
            for l in (-1):1
              m = i+k
              n = j+l
              if (m>0) & (m <11) & (n>0) & (n<11) 
                x[m,n] += 1
                dirty = true # need to check grid again
              end
            end
          end # end k, l, if, i.e., the flash effect
        end # move on to next cell
      end
    end # done grid this time
  end # no new flashes triggered; grid clean
  for i in 1:100
    if x[i] > 9
      x[i] = 0
    end
  end
  sum(flash)
end

flashes = 0
for i in 1:100
  flashes += step1!(x)
end
flashes

# 1656 for test
# 1585 for real data

# find when all octopusses flash (flash == 100)

step = 1
while step1!(x) < 100
  step += 1
end
step
# 382 for real data
# 195 for test data


