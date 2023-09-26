# Sum of Digits / Digital Root

=begin
Notes:

Problem:
input:
output:

  Write a method that takes a positive integer n and returns the digital root

rules:

Examples and test cases:

Data structures:

Algorithm:
Given a number, n
Set n_digits := get the digits of n and store in array
Iterate until the size of n_digits is 1
  Set digits_sum := sum the numbers in n_digits
  n_digits = get the digits of digits_sum and store in array
Return first element in n_digits
=end

def digital_root(n)
  n_digits = n.digits
  while n_digits.size > 1
    digits_sum = n_digits.sum
    n_digits = digits_sum.digits
  end
  n_digits.first
end

def digital_root(n)
  n % 9
end

p digital_root(16) == 7
p digital_root(456) == 6

# 7:17
