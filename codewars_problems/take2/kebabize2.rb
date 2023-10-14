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

purge string of non-letter characters before converting to kebab case
you have to handle the possibility of 1 character being left after
purging, in which case it should be returned as a lowercase string

Problem:
input: a string
output: a new string

Write a method that takes a string in lower camelCase and converts it
to lowercase 'kebab-case'.

rules:
  returned string should only contain lowercase letters and hypens
  assume new string? yes

Examples / test cases:

c a m e l s 
H a v e
H u m p s

Data Structures:

Algorithm:
Given a string, camel
Set characters := convert camel to an array of single-character strings
Purge characters of non-letter chars
Set words := empty array
Set buffer := empty string
Iterate through each character in characters
  If character is lowercase
    Append character to buffer
  Else
    Append buffer to words
    buffer = lowercase version of character
Append buffer to words
Join words to a single string with separator '-'
Return that string
=end

def kebabize(camel)
  characters = camel.chars.select { |character| character =~ /[a-zA-Z]/ }

  words = []
  buffer = ''
  characters.each do |character|
    if character =~ /[a-z]/
      buffer << character
    else
      words << buffer
      buffer = character.downcase
    end
  end
  words << buffer

  words.join('-')
end

def kebabize(camel)
  characters = camel.chars.select { |character| character =~ /[a-zA-Z]/ }

  slices = characters.slice_when { |a, b| b =~ /[A-Z]/ }
  words = slices.map { |word| word.join.downcase }

  words.join('-')
end

p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'
