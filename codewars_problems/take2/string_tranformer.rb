# String Transformer

=begin
Given a string, return a new string that has transformed based on the input:
Change case of every character, ie. lower case to upper case, upper case to lower case.
Reverse the order of words from the input.
Note: You will have to handle multiple spaces, and leading/trailing spaces
You may assume the input only contain English alphabet and spaces
=end

=begin

Notes:

scan for /\S+|\s+/

Problem:
input: a string
output: a new string

Write a method that takes a string and
swaps the case of every letter character
reverses the order of words while preserving the
exact quantity of spaces around words

rules:
  you will have to handle multiple spaces between
    words, before and after the sentence
  if the order of words is reversed, do the quantities of
    spaces stay where they are? assume yes

Examples / test cases:

['  ', 'The', '   ', 'Elephant', ' ', 'Gun', '    ']
  0      1       2      3         4     5      6
  indexes [1, 3, 5]
           0  1  2
size = 3, 3 / 2 intdiv = 1
count up from 0 to 0
count down from 2 to 2
  tokens[indexes[count up]], tokens[indexes[count down]] =
    tokens[indexes[count down]], tokens[indexes[count up]]

['  ', 'gUN', '   ', 'eLEPHANT', ' ', 'tHE', '    ']

Data Structures:

Array to hold the tokens
Array to hold the indexes of alphabet strings

Algorithm:
Given a string, string
Convert all lowercase letters to uppercase and vice versa
Set tokens := empty array
Set characters := split string into characters
Set buffer := first character
Iterate for index from 1 upto size of characters exclusive
  If characters[index] is a space && buffer[-1] is a space ||
      characters[index] is not a space && buffer[-1] is not a space
    Push characters[index] to buffer
  Else
    Push buffer to tokens
    buffer = characters[index]
Push buffer to tokens

Set word_indexes := empty array
Iterate over each token in tokens with an index
  If token includes letter characters
    Push index to word_indexes

Set midpoint := size of word_indexes / 2
Set upcount := 0
Set downcount := size of word_indexes - 1
Iterate while upcount < midpoint
  Swap tokens[word_indexes[upcount]] with tokens[word_indexes[downcount]]
  Increment upcount
  Decrement downcount
Concatenate all strings in tokens into a single string
Return that string
=end

def string_transformer(string)
  string = string.swapcase
  tokens = []
  characters = string.chars
  buffer = characters.first
  (1...characters.size).each do |index|
    if (characters[index] == ' ' && buffer[-1] == ' ') ||
       (characters[index] =~ /[a-zA-Z]/ && buffer[-1] =~ /[a-zA-Z]/)
      buffer << characters[index]
    else
      tokens << buffer
      buffer = characters[index]
    end
  end
  tokens << buffer

  word_indexes = []
  tokens.each_with_index do |token, index|
    word_indexes << index if token =~ /[a-zA-Z]/
  end

  midpoint = word_indexes.size / 2
  upcount = 0
  downcount = word_indexes.size - 1
  while upcount < midpoint
    tokens[word_indexes[upcount]], tokens[word_indexes[downcount]] =
      tokens[word_indexes[downcount]], tokens[word_indexes[upcount]]
    upcount += 1
    downcount -= 1
  end
  tokens.join
end

def string_transformer(string)
  # Convert upper to lower and lower to upper case
  string = string.swapcase

  # Get array of space chunks and letter chunks
  tokens = string.scan(/\s+|\S+/)

  # Get indexes of word tokens
  word_indexes = tokens.filter_map.with_index { |token, index| index if token =~ /[a-zA-Z]/ }

  # Reflect only words over midpoint
  midpoint = word_indexes.size / 2
  upcount = 0
  downcount = word_indexes.size - 1
  while upcount < midpoint
    tokens[word_indexes[upcount]], tokens[word_indexes[downcount]] =
      tokens[word_indexes[downcount]], tokens[word_indexes[upcount]]
    upcount += 1
    downcount -= 1
  end

  # Concatenate tokens to string
  tokens.join
end

p string_transformer('Example string') == 'STRING eXAMPLE'
p string_transformer('  The   Elephant Gun    ') == '  gUN   eLEPHANT tHE    '

# 30:30