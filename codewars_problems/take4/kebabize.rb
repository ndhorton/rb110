# Kebabize

=begin
Modify the kebabize function so that it converts a camel case string into a kebab case.
kebabize('camelsHaveThreeHumps') // camels-have-three-humps
kebabize('camelsHave3Humps') // camels-have-humps
Notes:
the returned string should only contain lowercase letters
=end

=begin

Notes:

Problem:
input: a string
output: a new string

Write a method that takes a string, camel,
in camelCase and returns a version of that
  string in kebab-case.

rules:
  assume return a new string
  the returned string must only contain lowercase letters and hyphens

Examples / test cases:

m y
C a m e l
C a s e
S t r i n g

Data Structures:

Algorithm:
Given a string, camel
Convert to an array of characters
Purge array of non-letter characters
Set buffer := empty string
Set words := empty array
Iterate through each character in characters
  If character is uppercase
    If buffer is not empty
      Push buffer to words
    buffer = lowercase version of character
  Else
    Append character to buffer
Push buffer to words
Concatenate words strings to a single string with a '-' separator
Return that string
=end

def kebabize(camel)
  characters = camel.chars.select { |char| char =~ /[a-zA-Z]/ }
  words = []
  buffer = characters.shift
  return '' unless buffer
  characters.each do |char|
    if char =~ /[A-Z]/
      words << buffer
      buffer = char.downcase
    else
      buffer << char
    end
  end
  words << buffer
  words.join('-')
end

def kebabize(camel)
  characters = camel.chars.select { |char| char =~ /[a-zA-Z]/ }
  words = characters.slice_when { |a, b| b =~ /[A-Z]/ }.map do |slice|
    slice.join.downcase
  end
  words.join('-')
end

p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'

# 10:48
