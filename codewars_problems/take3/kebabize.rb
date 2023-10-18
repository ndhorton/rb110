# kebabize

=begin
Modify the kebabize function so that it converts a camel case string into a kebab case.
kebabize('camelsHaveThreeHumps') // camels-have-three-humps
kebabize('camelsHave3Humps') // camels-have-humps
Notes:
the returned string should only contain lowercase letters
=end

=begin

Notes:

General approach:
purge the string of non-letters characters
first

one approach:
buffer = string[0]
words = []
Iterate through each char in string[1..-1]
  if char is uppercase
    push buffer to words
    buffer = char
  else
    append char to buffer
push buffer to words

another approach:
slice_when.to_a


Problem:
input: a string
output: a new string

Write a method that takes a camelCase string
and returns a 'kebab-case' string

rules:
  assume return a new string? yes
  returned string should contain only lowercase letters and hypen separators

Examples / test cases:

m y
C a m e l
C a s e d
S t r i n g

Data Structures:

Algorithm:
Given a string, camel
camel =
  convert camel to array of character-strings
  select only letter characters
  join all strings to a single string

Set words := empty array
Set buffer := first char in camel
Iterate over each char in camel from second onwards
  if char is upper case
    covert char to lowercase
    Push buffer to words
    buffer = char
  else
    Push char to buffer
Push buffer to words
Concatenate all strings in words into a single string with a '-' separator
Return that string
=end

def kebabize(camel)
  camel = camel.chars.select {|char| char =~ /[a-zA-Z]/ }.join

  words = []
  buffer = camel[0]
  (1...camel.size).each do |index|
    if camel[index] =~ /[A-Z]/
      words << buffer
      buffer = camel[index].downcase
    else
      buffer << camel[index]
    end
  end
  words << buffer

  words.join('-')
end

p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'

# 15:56
