# read map
# scan each row, incrementing by 3 (periodic boundaries) each line
# count the number of # and .

import Base

map = Base.readlines("input.txt");


function count_trees(right, down)
  width = length(map[1])
  i = 1;
  trees = 0;
  for row in 1:down:length(map)
    j = map[row]
    if j == ""
      break  # handle blank line problem
    end
    print(j[i] *  " - " * j * "\n")
    if j[i] == '#'
       trees += 1
    end
    i += right
    if i > width
      i -= width
    end
  end

  trees
end

print(count_trees(3, 1))

n1 = count_trees(1,1)
n2 = count_trees(3,1)
n3 = count_trees(5,1)
n4 = count_trees(7,1)
n5 = count_trees(1,2)

(n1, n2, n3, n4, n5, n1*n2*n3*n4*n5)

