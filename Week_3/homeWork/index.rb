def max_sequence(array)
  p (1..array.size).map { |i| array.each_cons(i) {|e| }}
end

max_sequence([-4,-1,1,2,3,-9,5,-5,-3])
