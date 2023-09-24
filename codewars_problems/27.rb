# Exponent Method

=begin
Notes:

Problem:
input: integer, base, integer, exponent
output: integer power

  Write a method that takes an integer, base, and an integer, exponent
  and returns the base raised to the exponent without using the ** operator method
  Return nil if the exponent is negative

rules:
  return nil if exponent negative
  do I need to check any other aspect of arguments? no, based on examples

Examples and test cases:

2 ** 3
1 (multiplicative identity)
1 * 2 = 2 (iteration 1)
2 * 2 = 4 (iteration 2)
4 * 2 = 8 (iteration 3)

Data structures:

Algorithm:
Given two integers, base, exponent
If exponent < 0
  return nil
Set result := 1
Iterate exponent times
  result = result * base
Return result
=end

def power(base, exponent)
  return nil if exponent.negative?

  result = 1
  exponent.times { |_| result *= base }
  result
end

p power(2, 3) == 8
p power(10, 0) == 1
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(10, 0) == 1
p power(2, 3) == 8
p power(3, 2) == 9
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(8, -2) == nil

# ~10:00 ? possibly less, didn't set timer
