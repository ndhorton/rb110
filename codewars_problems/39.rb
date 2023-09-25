# Largest product in a series

=begin
Notes:

one approach: use each_cons(5)

Problem:
input:
output:

  Write a method that computes and returns the greatest possible product
  of 5 consecutive digits in a string of digits

rules:
  input string always has at least 5 digits

Examples and test cases:

Data structures:

Algorithm:
Given a string, digit_string
Set digits := split digit_string into an array of single-character strings
Transform each digit in digits to an integer
Set products := empty array
Iterate through each consecutive group of five digits
  Take the product of the five digits
  Append product to products
Find the maximum of products
Return maximum
=end

def greatest_product(digit_string)
  digits = digit_string.chars.map(&:to_i)
  products = []
  digits.each_cons(5) do |group|
    product = group.reduce(1) { |acc, number| acc * number }
    products << product
  end
  products.max
end

# without using each_cons
def greatest_product(digit_string)
  digits = digit_string.chars.map(&:to_i)
  products = []
  (4...digits.size).each do |last_index|
    group = digits[last_index - 4..last_index]
    product = group.reduce(1) { |acc, number| acc * number }
    products << product
  end
  products.max
end

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

# 5:33
