# frozen_string_literal: true

# xoa dau !

def remove_exclamation_marks(s)
 s.delete("!")
end
p remove_exclamation_marks("Hello World!")

# lay ra phan tu dau tien trung lapp

def first_non_repeating_letter(s)
  return "" if s.empty?

  char_count = Hash.new(0)

  s.each_char do |char|
    char_count[char.downcase] += 1
  end

  s.each_char do |char|
    if char_count[char.downcase] == 1
      return char
    end
  end

  return ""
end

def  first_non_repeating_letter(s)
	s.chars.find {|i| s.downcase.count(i)==1 || s.upcase.count(i)==1} || ""
end

p first_non_repeating_letter('a')
p first_non_repeating_letter('stress')
p first_non_repeating_letter('moonmen')
p first_non_repeating_letter('')

def sort_by_length(arr)
  arr.sort_by do |value|
    value.length
    end
end

# loc lay mang cac phan tu trung lap nhung khong nam ke nhau

def unique_in_order(iterable)
  result = []
  previous_char = nil

  if iterable.is_a?(Array)
    iterable = iterable.map(&:to_s).join('')
  end

  iterable.each_char do |char|
    # Add the current character to the result list if it's different from the previous one
    if char != previous_char
      result << (char.to_i.to_s == char ? char.to_i : char)
      previous_char = char
    end
  end

  result
end

p unique_in_order([123451323])

# kiem tra ma pin

def validate_pin(pin)
  pin = pin.chars.map do |value|
    if value.match(/[0-9]/)
      value
    end
  end.compact
  pin.length == 4 || pin.length == 6
end
p validate_pin("  + 000000  ")

def sum_mix(x)
  x.map { |element| element.to_i }.reduce(0, :+)
end

# bat dau bang R hoac r

def are_you_playing_banjo(name)
  name.match(/^[Rr]/) ? "#{name} plays banjo" : "#{name} does not play banjo"
end

# Them phuong thuc camelcase va noi chuoite

class String
  def camelcase
    self.split(" ").map!{|value| value.capitalize}.join
  end
end

# ghi de len class Array

class Array
  def square
    map {|x| x*x}
  end

  def cube
    map {|x| x**3}
  end

  def average
    sum / size
  end

  def sum
    reduce(:+)
  end

  def even
    select(&:even?)
  end

  def odd
    select(&:odd?)
  end
end
numbers = [1, 2, 3, 4, 5]

p numbers.square()  # must return [1, 4, 9, 16, 25]
p numbers.cube()    # must return [1, 8, 27, 64, 125]
p numbers.average() # must return 3
p numbers.sum()     # must return 15
p numbers.even()    # must return [2, 4]
p numbers.odd()

# thuc thi proc block va noi lai interation

def exec_block_on_arr(array, iterations, &block)
  result = []
  iterations.times do
    result += array.map(&block)
  end
  result
end

def exec_block_on_arr(arr, iterations, &block)
  arr.map(&block) * iterations
end

proc = Proc.new { |x| x + 1 }
Test.assert_equals(exec_block_on_arr([1, 2, 3], 1, &proc ), [2, 3, 4])
Test.assert_equals(exec_block_on_arr([1, 2, 3], 2, &proc ), [2, 3, 4, 2, 3, 4])
Test.assert_equals(exec_block_on_arr([], 10, &proc ), [])
proc2 = Proc.new { |x| x.upcase }
Test.assert_equals(exec_block_on_arr(["x"], 10, &proc2 ), ["X", "X", "X", "X", "X", "X", "X", "X", "X", "X"])

# sap xep cac phan tu le ma khoong thay thu tu mang ban dau

def sort_array(source_array)
  odds = source_array.select(&:odd?).sort  # Tạo một mảng các số lẻ đã sắp xếp
  source_array.map { |e| e.odd? ? odds.shift : e }  # Sử dụng map để tạo mảng mới đã sắp xếp
end

p sort_array([5, 3, 2, 8, 1, 4, 11]) #  [1, 3, 2, 8, 5, 4, 11]

# true neu khong co phan tu lap lai

def is_isogram(string)
  true if string.empty?
  string.downcase.chars.each do |value|
    if string.downcase.chars.count(value) > 1
      return false
    end
  end
  return true
end
def is_isogram(string)
  string.downcase.chars.uniq == string.downcase.chars
end

p is_isogram("Dermatoglyphics")
p is_isogram("isogram")
p is_isogram("aba")
p is_isogram("moOse")
p is_isogram("isIsogram")
p is_isogram("")

# kiem tra thu hang khi giao luu doi bong

class Football
  def initialize(attributes)
    @names = attributes
    @rankings = {}
  end

  def rankify(str)
    # Initialize the rankings hash
    @names.each_with_index { |name, index| @rankings[name] = "##{index + 1}" }

    # Replace team names with rankings
    str.split(' ').map.with_index do |word|
      if @rankings.key?(word)
        @rankings[word] +" " +  word
      else
        word
      end
    end.join(' ')
  end
end

football = Football.new(['Alabama', 'Nebraska', 'Oklahoma'])
result = football.rankify("Nebraska vs Alabama tonight at 7!")
puts result

# tim index cua needle

def find_needle(haystack)
  valuee  = nil
  haystack.each.with_index do |value,index|
    if value == "needle"
      valuee = index
    end
  end 
  if valuee.positive? ? "found the needle at position #{valuee}" 
end

def find_needle(haystack)
  "found the needle at position #{haystack.index('needle')}"
end

find_needle(['3', '123124234', nil, 'needle', 'world', 'hay', 2, '3', true, false])