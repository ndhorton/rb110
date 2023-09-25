# String transformer

=begin
Notes:

get array of words
create array of transformed words with matching indexes
iterate through the indexes
  sub word[index] for transformed[word] index

Problem:
input: a string
output: a new string

  Write a method that takes a string, changes the case of every character and reverses
  the order of the words from the input

rules:
  preserve whitespace from original string

Examples and test cases:

"  example   INPUT"
["example", "INPUT"]
swapcase the string and break into words
["EXAMPLE", "input"]
reverse
["input", "EXAMPLE"]
Then iterate through indexes sub transformed word at that index for word at that index


Data structures:

Algorithm:
Given a string, string
Set words := split string into array of substrings on whitespace
Set transformed_string := reverse the cases of all letters in string
Set transformed_words := split transformed_string into arrays of substrings on whitespace
Reverse transformed_words
Set result := copy of string
Iterate through the indexes of words/transformed_words
  Destructively substitute words[index] with transformed_words[index]
Return result
=end

# def string_transformer(string)
#   words = string.split
#   transformed_words = string.swapcase.split.reverse
#   result = string.dup
#   words.each_index do |index|
#     result.sub!(words[index], transformed_words[index])
#   end
#   result
# end

# p string_transformer("Example Input") == "iNPUT eXAMPLE"

# 11:32 - Didn't work in the way they wanted on codewars

def string_transformer(string)
  string.scan(/\S+|\s/).reverse.map(&:swapcase).join
end

def words_and_spaces(string)
  result = []
  buffer = ''
  string.each_char do |char|
    if char == ' ' && buffer[-1] && buffer[-1] == ' '
      buffer << char
    elsif char == ' ' && buffer[-1]
      result << buffer
      buffer = char
    elsif buffer[-1] && buffer[-1] == ' '
      result << buffer
      buffer = char
    else
      buffer << char
    end
  end
  result << buffer unless buffer.empty?
  result
end

def string_transformer(string)
  tokens = words_and_spaces(string)
  tokens.reverse.map(&:swapcase).join
end

# This is probably the best solution (almagam of codewars solutions)
def string_transformer(string)
  string.swapcase.split(/\b/).reverse.join
end

p string_transformer("Example Input") == "iNPUT eXAMPLE"

p string_transformer("You Know When  THAT  Hotline Bling") == "bLING hOTLINE  that  wHEN kNOW yOU"

# 18:33 - updated solution
