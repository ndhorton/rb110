# Transform to Prime

=begin
Notes:

Problem:
input: an array of positive integers
output: a non-negative integer

  Write a method that takes an array of non-negative integers
  and returns the minimum non-negative integer (including 0 potentially)
  which will make the sum of the array's numbers equal to the closest
  prime greater than or equal to the sum of the input array's numbers

rules:
  array will only contain positive numbers
  the number to be inserted must be non-negative but could be
    0 if the array already sums to a prime

Examples and test cases:

Data structures:

Algorithm:
Given an array of positive integers, numbers
Set existing_sum := the sum of the numbers in numbers
Set missing_value := 0
Iterate while (existing_sum + missing_value) is not prime
  missing_value = missing_value + 1
Return missing_value

subprocess prime?
Given a positive integer, number
Set divisor := 2
Iterate while divisor * divisor <= number
  If number % divisor == 0
    Return false
  divisor = divisor + 1
Return true
=end

require 'prime'

def minimum_number(numbers)
  existing_sum = numbers.reduce(:+)
  missing_value = 0
  missing_value += 1 until (existing_sum + missing_value).prime?
  missing_value
end

# def minimum_number(numbers)
#   existing_sum = numbers.reduce(:+)
#   missing_value = 0
#   missing_value += 1 until prime?(existing_sum + missing_value)
#   missing_value
# end

# def prime?(number)
#   divisor = 2
#   while divisor * divisor <= number
#     return false if number % divisor == 0
#     divisor += 1
#   end
#   true
# end

p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2

# 11:46
