v = readlines("input.txt")

# parse each line looking for up/down/forward and a positive integer
# split using space

function updatePD(pos, s)
   position, depth = pos
   direction, mag = split(s, " ")
   magValue = parse(Int64, mag)
   if direction == "forward"
      position += magValue
   elseif direction == "up"
      depth -= magValue
   elseif direction == "down" 
      depth += magValue
   else
      error("Parse error on " * s * "\n")
   end
   (position, depth)
end

pos = (0,0)
# updatePD(pos, v[1])

for i in 1:length(v)
  pos = updatePD(pos, v[i])
end

pos[1]*pos[2]

# part 2

function updatePD2(pos, s)
   position, aim, depth = pos
   direction, mag = split(s, " ")
   magValue = parse(Int64, mag)
   if direction == "forward"
      position += magValue
      depth += magValue * aim
   elseif direction == "up"
      aim -= magValue
   elseif direction == "down"  
      aim += magValue
   else
      error("Parse error on " * s * "\n")
   end
   (position, aim, depth)
end

pos = (0, 0, 0)
# updatePD(pos, v[1])

for i in 1:length(v)
  pos = updatePD2(pos, v[i])
end
 
pos[1]*pos[3]
 
