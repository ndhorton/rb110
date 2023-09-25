# Duplicate Encoder

=begin
Notes:

One approach:
To build the string as you go
But this means running count on each iteration

Another:
Transform an array of character-strings derived from string such that
  each character maps to its count
Transform resulting array such that
  each count > 1 -> ')'
  each count == 1 -> '('

Problem:
input: a string
output: a new string

  Write a method that takes a string and returns a new string
  where each character in sequence is mapped to '(' if that character
  only appears once and ')' if that character occurs more than once
  in input string

rules:
  ignore case, so normalize input string case before procededing

Examples and test cases:

Data structures:

Algorithm:
Given a string, string
string = convert all letters in string to lowercase
Set counts := empty array
Iterate through each character in string
  count the occurences of that character in the string
  append count to counts
Set result := empty string
Iterate through each character_count in counts
  if character_count == 1
    append '(' to result
  else
    append '}' to result
Return result
=end

def duplicate_encode(string)
  string = string.downcase
  counts = string.chars.map { |char| string.count(char) }
  encoded_chars = counts.map { |char_count| char_count == 1 ? "(" : ")" }
  encoded_chars.join
end

p duplicate_encode("din") == "((("
p duplicate_encode("recede") == "()()()"
p duplicate_encode("Success") == ")())())"
p duplicate_encode("(( @") == "))(("

# 9:58
