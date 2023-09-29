# Is Integer Array?

=begin
Notes:

Problem:
input: an object
output: true or false

  Write a method that returns true if the object passed as argument is
  1) an empty array
  2) an array that contains only whole number (Float or Integer class)
  false otherwise

rules:
  return true if every number in input array is Integer or a Float with no fractional part
  return true if array is empty
  return false for every other input

Examples and test cases:

Data structures:

Algorithm:
Given an object, numbers
If object responds to Enumerable methods
  Iterate through each number in numbers
    If rounded number == number
      Next iteration
    Else
      Return false
Else
  Return false
Return true
=end

def is_int_array(arr)
  arr.respond_to?(:all?) && arr.all? do |number|
    number.respond_to?(:round) && number == number.round
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

# 10:32 - forgot to check examples thoroughly and missed that the elements in
#         the potential array could be non-numbers
