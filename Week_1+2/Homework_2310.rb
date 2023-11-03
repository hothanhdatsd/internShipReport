def checkArray (array)
    result = false
    if array.length < 2 || array.any? {|str| str.empty?}
        false
    else
        arr1 = array[0].split(//).uniq
        arr2 = array[1].split(//).uniq 
        arr2.each do |value2|
            arr1.each do |value1|
                if value1 == value2
                    result = true
                    break
                else
                    result = false 
                end
            end 
        end
       result
    end
end

# def checkArray(array)
#   if array.length < 2 || array.any? { |str| str.empty? }
#     return false
#   end

#   arr1 = array[0].split(//).uniq
#   arr2 = array[1].split(//).uniq

#   result = arr2.all? { |value1| arr1.include?(value1) }

#   return result
# end

puts checkArray(["abcd", "abc"])  
