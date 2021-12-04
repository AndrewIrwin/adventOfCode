# read input file
# scan for each of these strings until a blank line
# byr: iyr: eyr: hgt: hcl: ecl: pid: cid:
# report number in total and if cid found
# count number of valid (must have 8 not including cid)
# evaluate sum on blank line

import Base

passports = Base.readlines("input.txt")

codes = ("byr:", "iyr:", "eyr:", "hgt:", "hcl:", "ecl:", "pid:") #  "cid:")

valid = 0
invalid = 0
n = 0
count = 0

for i in 1:length(passports)
  if passports[i] == ""
     n += 1
     print(string(count)*"\n")
     if count < 7
       invalid += 1
     else
       valid += 1
     end
     count = 0
  end

  for c in codes
    if match(Base.Regex(c), passports[i]) != nothing
      count += 1
    end
  end
   # error does not detect repeated fields

end

