# WeIrD StRiNg CaSe

=begin
Notes:

Problem:
input:
output:

  Write a method that takes a string and returns a new string with the same
  value except all even indexed characters should be uppercase (if they are a letter)
  and all odd-indexed characters should be lowercase (if they are a letter).
  The pattern ignores non-letters and letter case depends entirely on the index.

rules:
  Should I assume 'the same string' means object identity? No

Examples and test cases:

Data structures:

Algorithm:
Given a string, string
Split string on whitespace into array of words
Transform each word in words
  Split string into an array of single-character strings, characters
  Transform each character in characters, with index
    if index is even
      map character to uppercase character
    else
      map character to lowercase character
  Concatenate all strings in characters to a single result string
Concatenate all strings in words around separator ' '
Return resulting string
=end

def weirdcase(string)
  words = string.split
  words.map! do |word|
      word.chars.map.with_index do |character, index|
      index.even? ? character.upcase : character.downcase
    end.join
  end
  words.join(' ')
end

def weirdcase(string)
  index = 0
  result = ''
  string.each_char.map do |char|
    if char == ' '
      index = 0
      char
    elsif index.even?
      index += 1
      char.upcase
    else
      index += 1
      char.downcase
    end
  end.join
end


p weirdcase( "String" ) == "StRiNg"
p weirdcase( "Weird string case" ) == "WeIrD StRiNg CaSe"

# 14:26 - didn't read question properly and cost some time after first wrong implementation
#         didn't read 'in each word' as meaning starting indexing again at the start of each
#         word
