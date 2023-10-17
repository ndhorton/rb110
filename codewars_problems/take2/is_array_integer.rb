# Is array integer?

=begin
Write a function with the signature shown below:
def is_int_array(arr)
true
end
returns true / True if every element in an array is an integer or a float with no decimals.
returns true / True if array is empty.
returns false / False for every other input.
=end

=begin

Notes:

Test if element respond_to?(:round)
Test if element.to_i.to_s == element.to_s ||
        element.to_f.to_s == element.to_s

Problem:
input: an array
output: a boolean true or false

Write a method that takes an array
and returns true or false depending on
whether every element is an integer or float

rules:
  an empty array returns true
  the object passed MIGHT NOT BE an array
in which case return false

Examples / test cases:

Data Structures:

Algorithm:
Given an array, numbers
Iterate through each number in numbers
  if number is a float or integer &&
    rounded number == number
    next iteration
  else
    return false
true
=end

def is_int_array(arr)
  arr.respond_to?(:all?) && arr.all? do |number|
    number.respond_to?(:round) &&
      number.round == number
  end
end

p is_int_array([]) == true
p is_int_array([1, 2, 3, 4]) == true
p is_int_array([-11, -12, -13, -14]) == true
p is_int_array([1.0, 2.0, 3.0]) == true
p is_int_array([1, 2, nil]) == false
p is_int_array(nil) == false
p is_int_array("") == false
p is_int_array([nil]) == false
p is_int_array([1.0, 2.0, 3.0001]) == false
p is_int_array(["-1"]) == false

# 11:05
