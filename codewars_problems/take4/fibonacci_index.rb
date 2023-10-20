# Is index a fibonacci number?

=begin

Notes:

One approach:

have a fibonacci method that takes a number and
computes the fibonacci numbers up to that number
if there is a match while test_number

Problem:
input: an array
output: a new array

Write a method that takes an array and returns a new array with only those elements
from the argument array whose index is a fibonacci number

rules:
  F(1) = 1, F(2) = 1, F(3) = 2, in this scheme 0 is not a Fibonacci number
  assume return a new array

Examples / test cases:
Fib(1) = 1, Fib(2) = 2
1 1 2 3 5 8 13 21 34 55 89 144


Data Structures:

Algorithm:
subprocess fibonacci?
Given an integer, number
if number == 1
  Return true
Set first := 1
Set last := 1
Iterate
  last = first + last
  first = last - first
  If last >= number
    Break from iteration
Return boolean result of (last == number)

subprocess fibonacci_indexes
Given an array, array
Set result := empty array
Iterate through each element and index of array
  if fibonacci?(index)
     Append element to result array
Return result
=end

def fibonacci?(number)
  return true if number == 1
  first = 1
  last = 1
  loop do
    last = first + last
    first = last - first
    break if last >= number
  end
  number == last
end

def fibonacci_indexes(array)
  array.select.with_index { |element, index| fibonacci?(index) }
end

arr = (0..144).to_a

p fibonacci_indexes(arr[0..10]) == [1, 2, 3, 5, 8]
p fibonacci_indexes(arr) == [1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]

# 16:41
