# Max Sequence (LS video 3)

=begin

Notes:

Problem:
input: an array of integers
output: an integer

Write a method that takes an array of integers and returns
the maximum sum of a consecutive subsequence of those numbers

rules:
  An empty array sums to 0
  'The empty array' is a valid subsequence of a populated array
    so if an array contains only negative numbers, return 0

Examples / test cases:

iterate through the numbers
for each number consider whether adding it would cause
  the current_sum to drop below zero
if so, reset to zero
else add the number
if the current_sum is > largest_sum
then largest_sum = current_sum

largest_sum = 0

-2  - still 0
1   - add 1 - we have 1 largest_sum also = 1
-3  - reset to 0
4   - add 4 - current_sum 4, largest_sum also 4
-1  - not below zero, add -1, current_sum 3, largest_sum stil  4
2   - add 2, we have 5
1   - add 1, we have 6 largest_sum 6
-5  - add -5, current_sum 1, largest_sum 6
4   - add 4, current_sum 5, largest_sum still 6

-2,  still 0
1,  1 ls
-7, 0
4,  4 largest_sum
-10 0
2   2
1   3
5   8 largest
4   12 largest

Data Structures:

Algorithm:
Given an array, numbers
Set current_sum := 0
Set largest_sum := 0
Iterate through each number in numbers
  If current_sum + number < 0
    current_sum = 0
    next iteration
  current_sum = current_sum + number
  If current_sum > largest_sum
   largest_sum = current_sum
Return largest sum
=end

def max_sequence(numbers)
  current_sum = 0
  largest_sum = 0
  numbers.each do |number|
    if current_sum + number < 0
      current_sum = 0
      next
    end
    current_sum += number
    largest_sum = current_sum if current_sum > largest_sum
  end
  largest_sum
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12

# 18:18
