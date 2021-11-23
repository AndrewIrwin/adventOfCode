# read lines of text
# pattern n-m l: [a-z]*

# count to be sure l appears between n and m times
# count number of failures

import Base

function check(n,m,l,s)
  "Does s contain at least n l and no more than m l?"
  "Count the number of l in s"

  c = 0
  for i in 1:length(s)
    if s[i] == l[1]
       c += 1
    end
  end

  result = n <= c <= m
  # print("%s: %d-%d (%s) %b" % s, n, m, l, result)
  print(string(n) * "-" * string(m) * " " * l * ": " * s * " -- " * string(result)* "---" * string(c) * "\n")
  result
end

function check_two(n,m,l,s)
  "check to see that postion n and m (1-indexed) contain exactly one l"
  xor(s[n] == l[1], s[m] == l[1])
end

function parse_input(s)
  "read a line of text of the form 'n-m l: s' and return the components"
  re = r"([0-9]*)-([0-9]*) ([a-z]): ([a-z]*)"
  m = match(re, s)
  (parse(Int, m[1]), parse(Int, m[2]), m[3], m[4])
end

function read_file()
  numberBad = 0;
  numberGood = 0;
  text = Base.readlines("input.txt");
  for i in text
    a,b,c,d = parse_input(i)
    if check_two(a,b,c,d)
       numberGood += 1
    else
       numberBad += 1
    end
  end
  (numberBad, numberGood)
end

print("Number bad: " * string(read_file()))


