# inside triangle

function inside(p, p0, p1, p2)
   px, py = p
   p0x, p0y = p0
   p1x, p1y = p1
   p2x, p2y = p2

   s = (p0y*p2x - p0x*p2y + (p2y - p0y)*px + (p0x - p2x)*py);
   t = (p0x*p1y - p0y*p1x + (p0y - p1y)*px + (p1x - p0x)*py);
   # s and t should be scaled /= by 2*Area, but only sign matters
   Area= 0.5 *(-p1y*p2x + p0y*(-p1x + p2x) + p0x*(p1y - p2y) + p1x*p2y)
   s /= 2*Area
   t /= 2*Area

   # (s,t,1-s-t, Area)
   (s > 0) & (t>0) & ((1-s-t) > 0)
end

inside((0,0), (1,1), (-1,1), (0,-4))
inside((5,0), (1,1), (-1,1), (0,-4))

v = readlines("triangles.txt")
originInside = 0

for vv in v
  p0x, p0y, p1x, p1y, p2x, p2y = parse.(Int, split(vv, ","))
  if inside((0,0), (p0x, p0y), (p1x, p1y), (p2x, p2y))
     originInside += 1
  end
end


