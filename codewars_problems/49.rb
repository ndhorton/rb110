# Playing with Digits

=begin
Notes:

split number into an array of digits in correct order, number_digits
set p_sum := 0
set k :=
  if p_sum % number == 0 then k = p_sum / number
  else k = -1 

Problem:
input: positive integers number and p
output: either positive integer k, or -1

  Write a method that takes a positive integer number, and a positive integer, p
  and returns either a positive integer k, if it exists, such that, considering
  the digits of number as a,b,c,d...etc,
  (a^p + b^(p+1) + c^(p+2) + d^(p+3) + ...) = number * k
  or
  returns -1 if there is no such k

rules:
  number and p will always be positive integers - no need to check

Examples and test cases:

Data structures:

Algorithm:
Given a positive integer number and a positive integer p
Set number_digits := split number into an array of integer digits in correct order
Set p_sum := 0
Iterate through each digit in number_digits with its index
  p_sum = p_sum + (digit^(p + index))
Set k := -1
If p_sum % number == 0
  k = p_sum / number
Return k
=end

def dig_pow(number, p)
  number_digits = number.digits.reverse
  p_sum = 0
  number_digits.each_with_index do |digit, index|
    p_sum += digit ** (p + index)
  end
  k = -1
  k = p_sum / number if p_sum % number == 0
  k
end

p dig_pow(89, 1) == 1
p dig_pow(92, 1) == -1
p dig_pow(46288, 3) == 51
p dig_pow(695, 2) == 2

# 20:57
