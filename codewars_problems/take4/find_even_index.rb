# Find Even Index (Video 6)

=begin
Notes:

slice left side with exclusive range
slice right side from index+1 with exclusive range that terminates before array size

Iterate through each index of array
  left_slice = slice array upto but not including index
  right_slice = slice array from index+1 upto but not including size of array
  if sum of left_slice == sum of right_slice
    Return index
Return -1

Problem:
input: an array
output: an integer

Write a method that takes an array of integers and returns the index, if it exists,
where the sum of the array upto but not including that index is equal to
the sum of the array past that index.

rules:
  the empty array is valid, so that
   at index 0 the left side sums to 0
   at index -1 the right side sums to 0
  if there is no such index, return -1

Examples and test cases:

Data structures:

Algorithm:
Given an array, numbers
Iterate through each index of array
  Set left_slice := slice array from 0 upto but not including index
  Set right_slice := slice array from index+1 upto but not including size of array
  if sum of left_slice == sum of right_slice
    Return index
Return -1
=end

def find_even_index(numbers)
  numbers.each_index do |index|
    left_sum = numbers[0...index].sum
    right_sum = numbers[(index + 1)...numbers.size].sum
    return index if left_sum == right_sum
  end
  -1
end

p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3

# 15:20
