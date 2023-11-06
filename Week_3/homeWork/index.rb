def max_sequence(array)
  p (1..array.size).map { |i| array.each_cons(i).to_a }
end

max_sequence([1, 2, 3])
