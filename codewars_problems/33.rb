# Replace With Alphabet Position

=begin
Notes:

Problem:
input:
output:

  Write a method that takes a string and returns a new string
  with every letter replaced by its index in the alphabet (a = 1, b = 2, etc)


rules:
  the numbers in the return string should be space-separated
  any non-letter characters should simply be left out of the return string (including original spaces)
  must ignore case, so normalize case of string before analysis

Examples and test cases:

Data structures:

Algorithm:
subprocess letter_index
Given a single-character string, char
Return ASCII value of char - 96

subprocess alphabet_postion
Given a string, text
text = covert text to lowercase
Set letter_indices := empty array
Iterate through each character in text
  If character is a lowercase letter
    Append letter_index(character) to letter_indices
Set result := join string representations of letter_indices elements to a single string around ' '
Return result
=end

def alphabet_position(text)
  text = text.downcase
  letter_indices = []
  text.each_char do |char|
    letter_indices << (char.ord - 96) if char >= 'a' && char <= 'z'
  end
  letter_indices.join(' ')
end

p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""
