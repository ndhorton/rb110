
=begin
Given an array of n positive integers and a positive integer, find the minimal length of a contiguous subarray for which the sum >= integer.

p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0
=end

=begin

Thoughts:

a leading_subarrays method
all_subarrays method

or iteratively try larger sizes of slice
so first check if any number >= integer passed as argument
then if the sum of any two-element array >= integer argument
then if the sum of any three-element array >= integer argument
...
then if sum of the whole array >= integer argument
else
return 0

Problem:

Given an array of positive integers, and another positive integer,
find the length of the smallest contiguous subarray whose sum >= the integer argument

input: an array of integers; an integer
output: an integer representing the size of the smallest subarray that satisfies
argument

rules:
  subarrays must feature consecutive numbers from original array
  if there is no such subarray, return 0

Examples:

p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2

whole array size = 6
  when subarray size is 1, last starting index is array size - 1
  when subarray size is whole array, last starting index is array size - array size

2, 3, 1, 2, [4, 3] size == 2

p minSubLength([1, 10, 5, 2, 7], 9) == 1

1 [10] size == 1

p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4

p minSubLength([1, 2, 4], 8) == 0

So if there is no such subarray, return 0

DS:

Algorithm:

Given an array, arr, and an integer, target
Iterate from 1 through the size of arr, representing subarray_size
  Iterate from 0 through (array size - subarray_size), representing starting_index
    Generate subarray of subarray_size length starting at current starting_index
    If the sum of the elements of this subarray are >= target
      Return subarray_size
Return 0 (since no subarray satisfying requirements could be found)

=end

def minSubLength(arr, target)
  (1..arr.size).each do |subarray_size|
    (0..(arr.size - subarray_size)).each do |starting_index|
      current_subarray = arr.slice(starting_index, subarray_size)
      return subarray_size if current_subarray.sum >= target
    end
  end 
  0
end

p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0