# Triple Trouble

=begin
Notes:

Problem:
input:
output:

Write a method that takes integers num1 and num2 and returns
1 if there are three consecutive digits the same in num1 AND
     there are two consecutive occurrences of THE SAME digit in num2
0 if not

rules:
  it has to be the same digit once that has been found in num1

Examples and test cases:

Data structures:

Algorithm:
Given an integer, num1 and an integer, num2
Set digits1 := convert num1 to string, split string to array of character-strings
Set digit := empty string
Iterate through each consecutive 3 elements in digits1, group
  If every element in group is equal
    digit = first element in group
If digit is still empty
  Return 0
Set digits2 := convert num2 to string, split string to array of character-strings
Iterate through each consecutive 2 elements in digits2, group
  If every element in group is equal to digit
    Return 1
Return 0
=end

def triple_double(num1, num2)
  digit = nil
  num1.to_s.chars.each_cons(3) do |group|
    digit = group.first if group.all?(group.first)
  end
  num2.to_s.chars.each_cons(2) do |group|
    return 1 if group.all?(digit)
  end
  0
end

p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1

# 14:37
