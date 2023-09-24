# Kebabize

=begin

Notes:

one approach: convert to chars and use something like
chunk_while the second parameter is a lowercase letter

transform each element of the sliced_when array
  filter element (arr of char-strings) so only letters remain
  join element (array of char-strings)
  downcase joined string

can't downcase before separating into words

questions:

Problem:
input: camelCase string
output: kebab-case string

  Write a method that converts a camelCase string into a
  "kebab-case" string

rules:
  kebab-case means hypenated all-lowercase
  returned string should only contain lowercase letters
Examples:

DS:

[['m', 'y'], ['C', 'a', 'm'...]...]

Algorithm:
Given a string, camel
Split string into array of single-character strings
Set buffer := empty array
split_words := empty array
Iterate over array from index 1 to last index, char, index
  If char is a lowercase letter
    Append array[index - 1] to buffer
  Else
    Append array[index - 1] to buffer
    Append buffer to split_words
    buffer = empty array
If last element is a lowercase letter
  Append last element to buffer
  Append buffer to split_words
Else
  Append buffer to split_words
  Append new array containing last element

Set lowercase_words := empty array
Iterate over each word (arr) in split_words
  select only upper- or -lowercase letters from word
  join word with no separator
  convert word-string to lowercase
  append word-string to empty array
Remove empty strings from lowercase_words
Return result of joining lowercase_words with a '-' separator

So a better, more general algorithm might be:

Given a string, camel
Split camel into characters, characters
Iterate through characters, building an array of arrays of characters
Each sub-array should end when the next character is not a lowercase letter
Assign array of arrays to split_words
Iterate over each word in split_words
  Select only lower- or uppercase letters from word
  Join remaining chars into a string
  Covert string to lowercase
  Append to array processed_words
Remove any empty strings from processed_words
Join the strings in processed words around a '-', kebab
Return kebab

=end

def kebabize(camel)
  characters = camel.chars
  
  buffer = []
  split_words = []
  index = 1
  loop do
    break if index >= characters.size
    if characters[index] =~ /[a-z]/
      buffer << characters[index - 1]
    else
      buffer << characters[index - 1]
      split_words << buffer
      buffer = []
    end
    index += 1
  end
  if characters.last =~ /[a-z]/
    buffer << characters.last
    split_words << buffer
  else
    split_words << buffer
    split_words << [characters.last]
  end

  words = []
  split_words.each do |word|
    word.select! { |char| char =~ /[a-zA-Z]/ }
    words << word.join.downcase
  end
  words.reject!(&:empty?)
  words.join('-')
end

# first solution
def kebabize(camel)
  characters = camel.chars
  split_words = characters.chunk_while { |a, b| b =~ /[a-z]/ }
  words = split_words.map do |word|
    word = word.select { |char| char =~ /[a-zA-Z]/ }
    word.join.downcase
  end
  words.reject!(&:empty?)
  words.join('-')
end

def kebabize(camel)
  split_words = camel.scan(/[a-z]+|[A-Z][a-z]+/)
  split_words.join('-').downcase
end

p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'

# 25:55
