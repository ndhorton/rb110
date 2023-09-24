# Mean Square Error

=begin
Notes:

Problem:
input: two integer arrays of equal length
output: a float average of element-wise squared differences

  Write a method that takes two arrays of integers, arr1 and arr2,
  takes the difference of each corresponding pair of elements and squares it
  and then takes the average of the squared differences


rules:
  do i have to arguments? no

Examples and test cases:

given

Data structures:

Algorithm:
Given two arrays of integer, arr1, arr2
Set square_differences := empty array
Iterate for 0 up to size of arr1, index
  Set difference := absolute value of arr1[index] - arr2[index]
  Set square_difference := difference * difference
  Append square_difference to square_differences
Set result := float division of sum of square_differences / size of square_differences
Return result
=end

def solution(arr1, arr2)
  square_differences = []
  (0...arr1.size).each do |index|
    square_differences << (arr1[index] - arr2[index]) ** 2
  end
  square_differences.sum.fdiv(square_differences.size)
end

p solution([1, 2, 3], [4, 5, 6]) == 9
p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
p solution([-1, 0], [0, -1]) == 1

# 14:00
