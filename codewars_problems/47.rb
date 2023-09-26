# Array.diff

=begin
Notes:

Problem:
input:
output:

  Write a method that removes all values from input array1 that are
  present in input array2; remove all occurrences of each value.

rules:

Examples and test cases:

Data structures:

Algorithm:
Given two arrays, array1, array2
Return the result of subtracting array2 from array1


Given two arrays, array1, array2
Set result := shallow copy of array1
Iterate through each value in array2
  Delete all occurrences of value from result
Return result
=end

def array_diff(array1, array2)
  array1 - array2
end

def array_diff(array1, array2)
  result = array1.dup
  array2.each { |value| result.delete(value) }
  result
end

p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([], [1,2]) == []

# 2:46 first solution

# 5:01 second solution
