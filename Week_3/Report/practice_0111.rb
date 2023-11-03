# frozen_string_literal: true

# loai bo khoang trang
def ghostbusters(building)
  # your code here
  building == building.gsub(' ', '') ? "You just wanted my autograph didn't you?" : building.gsub(' ', '')
end
p ghostbusters('Factor y')
p ghostbusters('O  f fi ce')
p ghostbusters('BusStation')

# dem so lan xuat hien le

def find_it(seq)
  seq.uniq.each do |value|
    return value if seq.count(value).odd?
  end
end

p find_it([20, 1, -1, 2, -2, 3, 3, 5, 5, 1, 2, 4, 20, 4, -1, -2, 5])
p find_it([1, 1, 2, -2, 5, 2, 4, 4, -1, -2, 5])
p find_it([20, 1, 1, 2, 2, 3, 3, 5, 5, 4, 20, 4, 5])
p find_it([10])
p find_it([1, 1, 1, 1, 1, 1, 10, 1, 1, 1, 1])

# kiem tra nam nhuan hay khong

def is_leap_year(year)
  DateTime.leap? year
end
p is_leap_year(2000)

# tim so fibonacci

def nth_fibonacci(n)
  if n <= 0
    0
  elsif n == 1
    0
  else
    fib = [0, 1]
    (2..n).each do |i|
      fib[i] = fib[i - 1] + fib[i - 2]
    end
    fib[n]
  end
end
p nth_fibonacci(1)
p nth_fibonacci(2)
p nth_fibonacci(3)
p nth_fibonacci(4)
p nth_fibonacci(5)
p nth_fibonacci(6)
p nth_fibonacci(7)
p nth_fibonacci(8)

# tim so khac so con lai

def find_outlier(integers)
  even_numbers = integers.select(&:even?)
  odd_numbers = integers.select(&:odd?)

  if even_numbers.length == 1
    even_numbers.first
  else
    odd_numbers.first
  end
end

p find_outlier([0, 1, 2])
p find_outlier([1, 2, 3])

# tim tu con thieu trong mang

def find_missing_letter(arr)
  (arr.first..arr.last).each do |char|
    return char unless arr.include?(char)
  end
end
p find_missing_letter(%w[a b c d f])

# tach ra thanh tung cap gia tri

def solution(str)
  i = 0
  arr = []
  while i < str.length
    pair = str[i + 1].nil? ? [str[i], '_'] : [str[i], str[i + 1]]
    arr << pair.join
    i += 2
  end
  arr
end

p solution('abcde')
p solution('abcdefg')

# chinh sua gia tri theo dieu kien

def spin_words(string)
  string.split(' ').map do |value|
    value.length >= 5 ? value.reverse! : value
  end.join(' ')
end

p spin_words('Welcome')
p spin_words('Hey fellow warriors')

# day tuu dau xuong sau chu va dao nguoc

def pig_it(text)
  text.split(' ').map do |value|
    if value.match(/[a-zA-Z]/)
      value += value.chars.first
      # value = value.delete(value.chars.first)
      value.sub(value.chars.first, '').concat('ay')
    else
      value
    end
  end.join(' ')
end

p pig_it('Pig latin is cool')
p pig_it('This is my string')
p pig_it('Hello world !') # elloHay orldway !

# nhan so tu theo vong lap

def accum(s)
  s.chars.each_with_index.map do |value, index|
    (value.upcase + (value.downcase * index))
  end.join('-')
end
p accum('ZpglnRxqenU')

def find_uniq(arr)
  comple = Hash.new(0)
  arr.map do |value|
    comple[value] += 1
  end
  comple.each do |key, value|
    return key if value == 1
  end
end

# tim so khong trung lap

def find_uniq(arr)
  arr.each do |value|
    return value if arr.count(value) == 1
  end
end
p find_uniq([1, 1, 1, 1, 0])
p find_uniq([1, 1, 1, 2, 1, 1])
p find_uniq([0, 0, 0.55, 0, 0])

def isPrime(number)
  if number <= 1
    return false
  elsif number <= 3
    return true
  elsif number.even? || (number % 3).zero?
    return false
  end

  i = 5
  while i * i <= number
    return false if (number % i).zero? || (number % (i + 2)).zero?

    i += 6
  end

  true
end

isPrime(100)
isPrime(20)

def expanded_form(num)
  return num.to_s if num <= 10

  num1 = num / "1#{transfer(num.to_s.length - 1)}".to_i
  num2 = num1 * "1#{transfer(num.to_s.length - 1)}".to_i
  num3 = num - num2
  return num.to_s if num2 === num

  "#{num2} + #{expanded_form(num3)}"
end

def transfer(_length)
  '0' * _length
end
# p expanded_form(42)
p expanded_form(70_304)

def likes(names)
  case names.length
  when 0
    'no one likes this'
  when 1
    "#{names[0]} likes this"
  when 2
    "#{names[0]} and #{names[1]} like this"
  when 3
    "#{names[0]}, #{names[1]} and #{names[2]} like this"
  when 4..Float::INFINITY
    "#{names[0]}, #{names[1]} and #{names.length - 2} others like this"
  end
end

likes([])
likes(['Peter'])
likes(%w[Jacob Alex])
likes(%w[Max John Mark])
likes(%w[Alex Jacob Mark Max])

# tim so nho tiepp theo

def next_smaller(n)
  max = 0
  n_digits = n.to_s.chars.map(&:to_i)

  n_digits.permutation.to_a.map do |value|
    value_num = value.join.to_i
    max = value_num if value_num < n && value_num > max
  end

  max.zero? ? -1 : max
end

def next_smaller(n)
  digits = n.to_s.chars.map(&:to_i)
  length = digits.length
  i = length - 2

  i -= 1 while i >= 0 && digits[i] <= digits[i + 1]

  return -1 if i == -1 # The number is already the smallest.

  j = length - 1
  j -= 1 while digits[j] >= digits[i]

  digits[i], digits[j] = digits[j], digits[i]

  result = digits[0..i] + digits[i + 1..-1].sort.reverse
  result_num = result.join.to_i

  result_num < n ? result_num : -1
end

p next_smaller(531)
p next_smaller(135)
p next_smaller(2071)
p next_smaller(414)
p next_smaller(123_456_798)
p next_smaller(123_456_789)
p next_smaller(1_234_567_908)

# lay gia tri o giua to hop

def middle_permutation(string)
  array = string.split('').sort.permutation.to_a
  array.length.even? ? array[(array.length / 2) - 1].join : array[(array.length / 2)].join
end

# p middle_permutation("abcd")
# p middle_permutation("abcd")
# p middle_permutation("abcdx")
p middle_permutation('abcdxg')
p middle_permutation('abcdxgz')

# lay so lon tiep theo

def next_bigger(n)
  max = 9_999_999_999
  n_digits = n.to_s.chars.map(&:to_i)

  n_digits.permutation.to_a.map do |value|
    value_num = value.join.to_i
    max = value_num if value_num > n && value_num < max
  end

  max.zero? ? -1 : max
end

p next_bigger(12) # ,21)
p next_bigger(513) # ,531)
p next_bigger(2017) # ,2071)
p next_bigger(414) # ,441)
p next_bigger(144) # ,414)

def next_bigger(n)
  chars = n.to_s.chars
  (0..chars.length - 2).reverse_each do |i|
    (i + 1..chars.length - 1).reverse_each do |j|
      if chars[i] < chars[j]
        chars[i], chars[j] = chars[j], chars[i]
        return (chars.first(i + 1) + chars.last(chars.length - 1 - i).sort).join.to_i
      end
    end
  end
  -1
end

# tao cac to hop khong trung lap

def permutations(string)
  string = string.chars.permutation.to_a.map(&:join).uniq
end
p permutations('ab') # sort, ['ab', 'ba'])
p permutations('aabb') # sort, ['aabb', 'abab', 'abba', 'baab', 'baba', 'bbaa'])

def smaller(arr)
  arr.map.with_index { |e, i| arr[i..-1].count { |n| e > n } }
end

p smaller([5, 4, 3, 2, 1])
p smaller([1, 2, 3])
p smaller([1, 2, 0])
p smaller([1, 2, 1])
p smaller([1, 1, -1, 0, 0])
p smaller([5, 4, 7, 9, 2, 4, 4, 5, 6])
p smaller([5, 4, 7, 9, 2, 4, 1, 4, 5, 6])

# kiem tra khi tach roi cong lai co bang gia tri bban dau khong

def narcissistic?(value)
  length = value.to_s.length
  arr = value.to_s.chars.reduce(0) do |sum, value|
    value = value.to_i
    sum += value**length
  end
  arr === value
end

def narcissistic?(value)
  value == value.to_s.chars.map { |x| x.to_i**value.to_s.size }.reduce(:+)
end

p narcissistic?(5)
p narcissistic?(153)
p narcissistic?(1633)

# kiem tra cac dau ngoac co hop le khong

def validBraces(braces)
  while braces.gsub!(/(\(\)|\[\]|\{\})/, '') do; end
  braces.empty?
end

def work_on_strings(a, b)
  if a.length == b.length
    a = a[0...-1] + a[-1].upcase
    b = b[0].upcase + b[1..-1]
  elsif a.length > b.length
    b = b.upcase
  else
    a = a.upcase
  end
  a + b
end

p work_on_strings('abc', 'cde')
# p work_on_strings("abcdeFgtrzw", "defgGgfhjkwqe")
p work_on_strings('abcdeFg', 'defgG')
# p work_on_strings("abab", "bababa")
