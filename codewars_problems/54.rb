# Are they the "same"?

=begin
Notes:

One approach:
  Iterate through every integer in a
  If the square of the current integer is included in b
    Find first index of square in b
    Delete square at that index in b
  Else
    return false
Return true

Another approach:
Sort a
Sort b
iterate through each integer in a with index
  if square of integer is not at the same index in b
    return false
return true

Problem:
input: two arrays of integers, a and b
output: true or false

  Write a method that takes two arrays a and b, and returns true only if
  for every integer element in a there is an element in b that is the integer
  in a squared. The elements in b will not necessarily be in the matching order
  to the integers in a that they are squares of. If the condition is not met,
  return false.

rules:
  either array might be empty
  a or b arguments may be nil, in which case return false

Examples and test cases:

Data structures:

Algorithm:
Given two arrays, a and b
If either a or b is nil
  Return false
Sort a
Sort b
Iterate through each index of a
  If a[index] * a[index] != b[index]
    return false
Return true
=end

def comp(a, b)
  if a.nil? || b.nil || a.size != b.size
    return false
  end

  a = a.sort
  b = b.sort
  a.each_index { |index| return false unless a[index] ** 2 == b[index] }
  true
end

# first codewars solution
def comp(a, b)
  a.nil? || b.nil? ? false : a.sort.map { |element| element ** 2 } == b.sort
end

# refactor
def comp(a, b)
  return false if a.nil? || b.nil?

  a = a.sort.map { |element| element * element }
  b = b.sort
  a == b
end


p comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361]) == true
p comp([121, 144, 19, 161, 19, 144, 19, 11] , [132, 14641, 20736, 361, 25921, 361, 20736, 361]) == false
p comp(nil, [1, 2, 3]) == false
p comp([1, 2], []) == false
p comp([1, 2], [1, 4, 4]) == false

# 15:25 - I didn't include checks for the empty arrays and by extension the second array being bigger than
#         the first. Further, on codewars' tests, it turns out that BOTH arrays can be empty
#         since the squares of all numbers in an empty set are equal to all numbers in an empty set
#         Basically the whole problem is an exercise in dredging requirements from language formalism
