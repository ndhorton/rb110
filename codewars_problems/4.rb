# Alphabet Symmetry

=begin

Notes:

case-sensitivity: easiest to normalize string

The example says, e.g, a is 1, but this detail is important

questions:


Problem:
input: an array of strings
output: an array of counts of letters that are in the same place in the
string as they are in the alphabet (assuming a is 1 and 1 means index 0)

  Write a method that takes an array of strings and returns a new array
  of counts for each string where the count is of letters that are in the
  same position in the string as they would be in a string containing
  the alphabet.

rules:
  must be case-insensitive
  input consists of alphabetic chars of both cases,
    no spaces
  must downcase all input strings before checking

Examples:

DS:

a string containing the alphabet in lowercase

Algorithm:
Given an array of strings, arr
Set alphabet := 'abcdefghijklmnopqrstuvwxyz'
Set normalized_strings := transform arr such that all strings are lowercase
Set counts := empty array
Iterate over each string in normalized_strings
  Set counter := 0
  Iterate index for 0 through string length - 1
    If string at index is equal to alphabet at index
      counter += 1
  Append counter to counts
Return counts
=end

ALPHABET = 'abcdefghijklmnopqrstuvwxyz'

def solve(arr)
  arr.each_with_object([]) do |string, counts|
    counter = 0
    (0...string.size).each do |index|
      counter += 1 if string.downcase[index] == ALPHABET[index]
    end
    counts << counter
  end
end

# Based on a Codewars solution (Jesus_Castello)
def solve(arr)
  arr.map do |word|
    word.downcase.chars.each_with_index.count do |char, index|
      char == ALPHABET[index]
    end
  end
end

# Top Codewars solution (Unnamed et al)
def solve(arr)
  arr.map { |s| s.downcase.each_char.zip('a'..'z').count { |a, b| a == b } }
end

p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

# 12:33
