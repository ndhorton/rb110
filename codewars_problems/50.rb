# Equal Sides of An Array

=begin
Notes:

Problem:
input: an array of integers, 
output: either an integer index or -1

  Write a method that takes an array of integers, numbers
  and returns the lowest index at which the sum of the numbers to the left
  is equal to the sum of the numbers to the right. This can include index 0
  where the sum to the left is 0, or the last index where the sum to the right
  is 0. Return -1 if no such index exists

rules:
  return the lowest index that meets the specification
  the empty collection to left of index 0 and the right of last index is included

Examples and test cases:

Data structures:

Algorithm:
Given an array of integers, numbers
Iterate through each index of numbers, index
  Set sum_left := the sum of the numbers in the array from 0 to index exclusive
  Set sum_right :=the sum of the numbers in the array from (index + 1) to last index index
  if sum_left == sum_right
    return index
return -1
=end

def find_even_index(numbers)
  numbers.each_index do |index|
    sum_left = numbers[0...index].sum
    sum_right = numbers[index + 1..-1].sum
    return index if sum_left == sum_right
  end
  -1
end

p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1

# 15:31
