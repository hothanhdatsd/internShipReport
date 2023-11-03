# frozen_string_literal: true

# cong khoang cach giua cac phan tu trong mang
def sum_of_intervals(intervals)
  count = 0
  complement = Hash.new(0)
  intervals.map do |value|
    complement[value.first] = value.last
  end
  complement.each do |item, value|
    count += value - item
  end
  count
end

p sum_of_intervals([[1, 5]])
p sum_of_intervals([[1, 5], [6, 10]])
p sum_of_intervals([[1, 5], [1, 5]])
p sum_of_intervals([[1, 4], [7, 10], [3, 5]])

# noi chuoi co dieu kien
# def likes(names)
#   return 'no one likes this' if names.empty?

#   str = ''
#   names.each do |name|
#     if name == names.first && name == names.last
#       return str += "#{name} likes this"
#     elsif names.length == 2
#       str += name == (names.last) ? "and #{name} " : "#{name} "
#     else
#       str += name == (names.last) ? "and #{name} " : "#{name}, "
#     end
#   end
#   str += 'like this'
# end

# p likes([])
# p likes(['Peter'])
# p likes(%w[Jacob Alex])
# p likes(%w[Max John Mark])
# p likes(%w[Alex Jacob Mark Max])

def number_to_string(num)
  num.to_s
end

# doi chu sang so
def alphabet_position(text)
  positions = []
  text.each_char do |char|
    char.downcase!
    if char.match(/[a-z]/)
      position = char.ord - 'a'.ord + 1
      positions << position
    end
  end
  positions.join(' ')
end

result = alphabet_position("The sunset sets at twelve o' clock.")
puts result

# dem so lan nhan giua cac phan tu con
def persistence(number)
  count = 0
  while number >= 10
    number = number.to_s.chars.map(&:to_i).reduce(1) { |a, b| a * b }
    count += 1
  end
  count
end

p persistence(39)
p persistence(4)
p persistence(25)
p persistence(999)
p persistence(444)

# lay gia tri o giua cau
def get_middle(str)
  str.length.even? ? str[str.length / 2 - 1..str.length / 2] : str[str.length / 2]
end
p get_middle('test')
p get_middle('testing')
p get_middle('middle')
p get_middle('A')
p get_middle('of')

# dem gia tri true
def count_sheeps(array)
  array.count(true)
end
array1 = [true,  true,  true,  false,
          true,  true,  true,  true,
          true,  false, true,  false,
          true,  false, false, true,
          true,  true,  true,  true,
          false, false, true,  true]

p count_sheeps(array1)

# dao nguoc cau chuoi  theo dieu kien
def spin_words(string)
  string.chars.map do |value|
    value.length <= 5 ? value.reverse : value
  end.join
end

p spin_words('Welcome')
p spin_words('Hey fellow warriors')

# cong hai gia tri nho nhat
def sum_two_smallest_numbers(numbers)
  numbers.sort.take(2).reduce(:+)
  # numbers.min(2).reduce(:+)
end
p sum_two_smallest_numbers([5, 8, 12, 18, 22])
p sum_two_smallest_numbers([7, 15, 12, 18, 22])
p sum_two_smallest_numbers([25, 42, 71, 12, 18, 22])

# lay tu upcase o dau moi gia tri chuoi
def abbrev_name(name)
  result = []
  name.split(' ').select do |value|
    result << value.chars.first.upcase
  end
  result.join('.')
end

# def abbrev_name(name)
#   name.split.map { |s| s[0] }.join('.').upcase
# end
# p abbrev_name('Sam Harris')

# loai bo gia tri va noi chuoi theo dieu kien

def to_camel_case(str)
  str = str.gsub(/[-_]/, ' ')
  str.split.map do |value|
    str.split.first == value ? value : value.capitalize
  end.join
end

# def to_camel_case(str)
#   str.gsub(/[_-](.)/) { Regexp.last_match(1).upcase.to_s }
# end

p to_camel_case('')
p to_camel_case('the_stealth_warrior')
p to_camel_case('The-Stealth-Warrior')
p to_camel_case('A-B-C')

# tao so dien thoai
def create_phone_number(numbers)
  "(#{numbers[0...3].join}) #{numbers[3...6].join}-#{numbers[6..9].join}"
end

# def create_phone_number(array)
#   '(%d%d%d) %d%d%d-%d%d%d%d' % array
# end

p create_phone_number([1, 2, 3, 4, 5, 6, 7, 8, 9, 0])
p create_phone_number([1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
p create_phone_number([1, 2, 3, 4, 5, 6, 7, 8, 9, 0])

# so sanh su khac nhau giua hai mang
def array_diff(array1, array2)
  p array1 - array2
end

array_diff([1, 2], [1])
array_diff([1, 2, 2], [1])
array_diff([1, 2, 2], [2])
array_diff([1, 2, 2], [])
array_diff([], [1, 2])
array_diff([1, 2, 3], [1, 2])

# dem so lan xuat hien cua moi tu

def count_chars(str)
  count = Hash.new(0)
  str.split('').each do |value|
    count[value] += 1
  end
  count
end

p count_chars('aba')
# p count_chars("")

# cong cac tu chia het cho 3 va 5 nho hon gia tri tham so dau vao

def solution(number)
  return 0 if number.zero?

  num = 1
  arr = []
  while num < number
    arr << num if (num % 3).zero? || (num % 5).zero?
    num += 1
  end
  arr.reduce(:+)
end

# def solution(number)
#   (1...number).select { |i| (i % 3).zero? || (i % 5).zero? }.inject(:+)
# end

p solution(10)

# tra ve do dai cua mang con thieu

def get_length_of_misssing_array(array_of_arrays)
  return 0 if array_of_arrays.empty?

  arr_length = array_of_arrays.map(&:length).sort
  arr_length = (arr_length[0]..arr_length[-1]).find { |length| !arr_length.include?(length) }
end
p get_length_of_misssing_array([[1, 2], [4, 5, 1, 1], [1], [5, 6, 7, 8, 9]])
p get_length_of_misssing_array([[5, 2, 9], [4, 5, 1, 1], [1], [5, 6, 7, 8, 9]])
p get_length_of_misssing_array([[false], [false, false, false]])
p get_length_of_misssing_array([%w[a a a], %w[a a], %w[a a a a], ['a'],
                                %w[a a a a a a]])
p get_length_of_misssing_array([])

# loai bo cac phan tu trung lap gan nhau

def unique_in_order(iterable)
  pattern = /(\w)\1*/
  iterable.scan(pattern).map(&:first)
end
p unique_in_order('AAAABBBCCDAABBBA')

# lay tu co gia tri cao nhat khi quy doi sang so'

def high(words)
  words = words.downcase.split(' ')
  find_max_word(words)
end

def find_max_word(words)
  alphabet = ('a'..'z').to_a

  words.max_by { |word| calculate_points(word, alphabet) }
end

def calculate_points(word, alphabet)
  word.chars.sum { |letter| alphabet.include?(letter) ? letter.ord - 'a'.ord + 1 : 0 }
end

p high('abc b bcd')

# module Foo
#   World = 'Hello, World!'
#   Bar = 'Hello, Bar!'
#   FromTheOtherSide = 'Hello, FromTheOtherSide!'
#   Zenith = 'Hello, Zenith!'
#   Zealot = 'Hello, Zealot!'
#   Yearn = 'Hello, Yearn'
#   Yawner = 'Hello, Yawner'
# end
# p Foo::World

# hang doi sap xep

def queue_time(customers, number)
  return 0 if customers.empty?
  return customers.sum if number == 1
  return customers.max if number >= customers.length

  queues = Array.new(number, 0)

  customers.each do |customer|
    shortest_queue = queues.min
    shortest_queue_index = queues.index(shortest_queue)
    queues[shortest_queue_index] += customer
  end

  queues.max
end

p queue_time([], 1)
p queue_time([5], 1)
p queue_time([2], 5)
p queue_time([1, 2, 3, 4, 5], 1)
p queue_time([1, 2, 3, 4, 5], 100)
p queue_time([2, 2, 3, 3, 4, 4], 2)
