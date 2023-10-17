# Integer Reduction

=begin
In this Kata, you will be given two integers n and k and your task is to remove k-digits from n and return the lowest number possible, without changing the order of the digits in n. Return the result as a string.

Let's take an example of solve(123056,4). We need to remove 4 digits from 123056 and return the lowest possible number. The best digits to remove are (1,2,3,6) so that the remaining digits are '05'. Therefore, solve(123056,4) = '05'.

Note also that the order of the numbers in n does not change: solve(1284569,2) = '12456', because we have removed 8 and 9.

More examples in the test cases.

Good luck!
=end

=begin

Notes:

approach:
take the integer, n, away from size of String
call that target_size
get every combination of digits of target_size
convert to integers
find the minimum
convert the minimum to string and return

Problem:
input: a string of digits, an integer
output: a new string of digits

Write a method that takes a string, number, and an integer, n
and returns the smallest number (again as a string) that
can be made by subtracting n digits from number

rules:
  order of digits is preserved
  leading zeroes are permitted
  assume n won't be larger than size of string? yes

Examples / test cases:

1 2 3 0 5 6

2 3 0 5 6
1 3 0 5 6
1 2 0 5 6
1 2 3 5 6
1 2 3 0 6
1 2 3 0 5

1 2 0 5 6

2 0 5 6
1 0 5 6
1 2 5 6
1 2 0 6
1 2 0 5

1 0 5 6

0 5 6
1 5 6
1 0 6
1 0 5

0 5 6

5 6
0 6
0 5

0 5



Data Structures:

Algorithm:
Given a string, number, and an integer, n
Set digits := split number into character-strings array
Set target_size := digits.size - n
Set combinations := Find every combination of target_size digits
Convert each combination in combination to integers
Find the minimum
Convert minimum to string and return the string
=end

def solve(number, n)
  digs = number.to_s.chars
  target_size = digs.size - n
  combinations = digs.combination(target_size).map do |combination|
    combination.join
  end
  smallest = combinations.min_by do |dig_string|
    dig_string.to_i
  end
  smallest
end

# top codewars solutions

# This I do not quite understand
require 'pry-byebug'
def solve(number, n)
  digit_string = number.to_s
  return '' if digit_string.size == n
  ('0'..'9').each do |d|
    i = digit_string.index(d)
binding.pry
    return d + solve(digit_string[i+1..-1], n-i) if i && i <= n
  end
end

# def solve(n,k)
#   array = n.to_s.chars
#   k.times do
#     set = []
#     array.each_index do |idx|
#       arr = array.clone
#       arr.slice!(idx, 1)
#       set << arr
#     end
#     array = set.min
#   end
#   array.join
# end
#
# =begin
#
# 1 2 3 (2)
# 1 2
# 1 3
# 2 3
#
#
#
# =end
#
# def leading_combination(arr, n)
#
#
# def combination(arr, n)
#   result = []
#   difference = arr.size - n
#   (0...arr.size).each do |leading_idx|
#
#

p solve(123056,1) == '12056'
p solve(123056,2) == '1056'
p solve(123056,3) == '056'
p solve(123056,4) == '05'
p solve(1284569,1) == '124569'
p solve(1284569,2) == '12456'
p solve(1284569,3) == '1245'
p solve(1284569,4) == '124'

# 19:16
