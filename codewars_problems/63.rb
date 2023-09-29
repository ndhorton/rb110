# Find the Parity Outlier

=begin
Notes:

partition the first 3 numbers
whichever array is larger will tell you whether the array
is basically odd or basically even

Problem:
input: an array of integers
output:

  Write a method that takes an array of numbers and returns the
  incongruous number. If the majority of the numbers are odd, return
  the only even number; if the majority are even, return the only
  even number. 

rules:
  there will be at least 3 integers in the array

Examples and test cases:

2 4 0, -

Data structures:

Algorithm:
Given an array, numbers
Set odd_count := 0
Iterate through the first three number in numbers
  If number is odd
    odd_count = odd_count + 1
If odd_count > 1
  Find the even number
  Return the even number
Else
  Find the odd number
  Return the odd number
=end

def find_outlier(numbers)
  majority_odd = false
  odd, even = numbers[0..2].partition(&:odd?)
  majority_odd = true if odd.size > even.size

  if majority_odd
    numbers.find { |number| number.even? }
  else
    numbers.find { |number| number.odd? }
  end
end

def find_outlier(numbers)
  odd_count = numbers[0..2].count(&:odd?)
  if odd_count > 1
    numbers.find(&:even?)
  else
    numbers.find(&:odd?)
  end
end

p find_outlier([0, 1, 2]) == 1
p find_outlier([1, 2, 3]) == 2

# 11:23
