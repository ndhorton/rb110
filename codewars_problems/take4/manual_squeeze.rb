# Manual squeeze

=begin
Notes:

approach:
Set result_chars := empty array
Iterate through each char in string
  if last element of result_chars == char
    next iteration
  append char to result_chars
Concatenate every string in result chars to a single string
Return that string

Problem:
input: a string
output: a new string

Write a method that takes a string and returns a new string
with all consecutive duplicate chars collapsed into a single character

rules:

Examples and test cases:

Data structures:

Algorithm:
Given a string, string
Set result_chars := empty array
Iterate through each char in string
  if last element of result_chars == char
    next iteration
  Append char to result_chars
Concatenate every string in result chars to a single string
Return that string
=end
def squeeze(string)
  result_chars = []
  string.each_char do |current_char|
    next if result_chars.last == current_char
    result_chars << current_char
  end
  result_chars.join
end

p squeeze('bbbbbbbbb') == 'b'
p squeeze('wwooonndeerrfull woorrlldd') == 'wonderful world'
p squeeze('aaabbbcddddccc') == 'abcdc'
p squeeze('') == ''

# 5:45
