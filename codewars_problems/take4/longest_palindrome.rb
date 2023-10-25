# Longest Palindrome

=begin
Notes:

palindromes must be consecutive but
not necessarily leading

I think you do need to look at every substring to check if it's a palindrome

One approach:
Iterate through each index as leading index
  Iterate from that index to the the last index
    slice from leading index to limit index
    if slice is the same reversed, add to palindromes array
find longest element in the palindromes array (maximum by length rather than string value)
Return the size of that element

Problem:
input: a string
output: an integer

Write a method that takes a string and returns
the length of the longest substring that is the same reversed.

rules:
  if the length of the input string is 0 -> return 0
  if a single letter is the longest -> return 1
  palindromes are not limited to letters
  assume case-sensitive? yes

Examples and test cases:

b a a b c d
0 1 2 3 4 5
0..5
  0..5
b ->
b a
b a a
b a a b ->
b a a b c
b a a b c d

b ->
b a
b a a
a ->
a a ->
a ->

Data structures:

an array to collect palindromes, no
not even that

Algorithm:
Given a string
Set longest_length := empty array
Iterate for leading_index from 0 upto size of string exclusive
  Iterate for closing_index from leading_index upto size of string exclusive
    Set current_slice := copy from leading_index to closing_index of string
    If current_slice == current_slice reversed &&
       size of current_slice > longest_length
      longest_length = size of current_slice
Return longest_length
=end

def longest_palindrome(string)
  longest_length = 0
  (0...string.size).each do |leading_index|
    (leading_index...string.size).each do |closing_index|
      current_slice = string[leading_index..closing_index]
      next unless current_slice == current_slice.reverse
      if current_slice.length > longest_length
        longest_length = current_slice.size
      end
    end
  end
  longest_length
end

def all_substrings(string)
  result = []
  (0...string.length).each do |leading_index|
    (leading_index...string.length).each do |closing_index|
      result << string[leading_index..closing_index]
    end
  end
  result
end

def all_substrings(string)
  (0...string.size).each_with_object([]) do |leading_index, result|
    (leading_index...string.size).each do |closing_index|
      result << string.slice(leading_index..closing_index)
    end
  end
end

p longest_palindrome('a') == 1
p longest_palindrome('aa') == 2
p longest_palindrome('baa') == 2
p longest_palindrome('aab') == 2
p longest_palindrome('baabcd') == 4
p longest_palindrome('baablkj12345432133d') == 9

p all_substrings('baab')

# 19:05
