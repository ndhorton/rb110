# Are they the same?

=begin
Given two arrays a and b write a function comp(a, b) that checks whether the two arrays have the "same" elements,
with the same multiplicities. "Same" means, here, that the elements in b are the elements in a squared, regardless of
the order.
Examples
Valid arrays
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a, b) returns true because in b 121 is the square of 11, 14641 is the square of 121, 20736 the square of 144, 361
the square of 19, 25921 the square of 161, and so on. It gets obvious if we write b's elements in terms of squares:
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]
Invalid arrays
If we change the first number to something else, comp may not return true anymore:
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 132 is not the square of any number of a.
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 36100 is not the square of any number of a.
Remarks
a or b might be [] (all languages except R, Shell).
a or b might be nil or null or None or nothing (except in Haskell, Elixir, C++, Rust, R, Shell, PureScript).
If a or b are nil (or null or None), the problem doesn't make sense so return false.
Note for C
The two arrays have the same size (> 0) given as parameter in function comp.
=end

=begin

Notes:

One approach
check if either is nil OR if they are not the same size
  return false if so
sort a
sort b
iterate through the indexes
  if a[index] * a[index] == b[index]
    next iteration
  othewise return false
return true

Problem:
input: two arrays, a and b
output: boolean true or false

Write a method that takes two arrays of numbers
and checks whether for every element in array a
there is the square of that number in b
with the same multiplicities of numbers in a
and squares in b (so if a has two 12 elements,
then b will have two 144 elements)

rules:
  a or b might be empty
  a or b might be nil instead of an array, in which case
    return false
  if the arrays are not of same size, return false

Examples / test cases:

Data Structures:

Algorithm:
Given two arrays, a and b
If !a or !b or size of a != size of b
  return false
Sort a
Sort b
Iterate for index from 0 upto size of a exclusive
  If a[index] * a[index] != b[index]
    Return false
Return true
=end

def comp(a, b)
  return false unless a && b && a.size == b.size

  a = a.sort
  b = b.sort
  a.each_index do |index|
    return false if a[index] ** 2 != b[index]
  end
  true
end

p comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361]) == true
p comp([121, 144, 19, 161, 19, 144, 19, 11] , [132, 14641, 20736, 361, 25921, 361, 20736, 361]) == false
p comp(nil, [1, 2, 3]) == false
p comp([1, 2], []) == false
p comp([1, 2], [1, 4, 4]) == false

# 13:36
