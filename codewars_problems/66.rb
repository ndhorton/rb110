# Integer reduction

=begin
Notes:

use #combination(number of digits - k)

Problem:
input: two integers, n and k
output: the smallest number formed by removing k digits from n

  Write a method that takes two integers n and k and returns the
  smallest number possible by removing k digits from n

rules:
  order of digits must remain the same
  do i have to check arguments? not looking at example tests
  will k ever be 0 or less? no see above

Examples and test cases:

1 2 3 0 5 6   , 1
12305
12306
12356
12056 <- smallest
13056
23056

Data structures:

easiest to join digits as strings
array for digits

Algorithm:
Given two integers, n and k
Set digit_string := convert n to string
Set digits := split digit_string into array of single-character digit strings
Set combinations := find every order-preserving combination of (size of digits - k) digits
Set first_group := destructively remove first element from combinations
Set result := concatenate first_group to a single string
Set smallest :=  convert result to integer
Iterate through each group in combinations
  Set string := concatenate group into single string
  Set number := convert string into integer
  If number < smallest
    smallest = number
    result = string
Return result
=end

# 28:10 - missed that i had to return result as a string, which could never be allowed
#         to be an integer because of disappearing leading zero

def solve(n, k)
  digits = n.to_s.chars
  digit_strings = digits.combination(digits.size - k).map(&:join)
  digit_strings.min { |a, b| a.to_i <=> b.to_i }
end
