# Delete a Digit

=begin
Notes:

one approach:
create string version of n
n_digits = size of string_n
Iterate n_digits times, index
  convert string_n to an array of characters
  delete at index
  convert back to string
  convert to an integer
  push to an array
Find the maximum of the array and return

Problem:
input: an integer, n
output: largest integer obtained by removing 1 digit from n

  Write a method that takes a number and returns the greatest value number
  you can obtain by deleting exactly one digit

rules:
  number will have at least 2 digits and no more than 7

Examples and test cases:

Data structures:

Algorithm:
Given an integer, n
Set n_string := string representation of n
Set n_digits := size of n
Set candidates := empty array 
Iterate for index from 0 upto n_digits exclusive
  Set n_chars := convert n_string to array of single-character strings
  delete element at index from n_chars
  Convert n_chars to a single string
  Convert string to an integer and push to result
Return maximum integer from candidates
=end

def delete_digit(n)
  n_string = n.to_s
  n_digits = n_string.size
  candidates = []
  n_digits.times do |index|
    n_chars = n_string.chars
    n_chars.delete_at(index)
    candidates << n_chars.join.to_i
  end
  candidates.max
end 

p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1

# 13:13
