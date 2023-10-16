# WeIrD StRiNg CaSe

=begin
Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, and returns the same string with all even
indexed characters in each word upper cased, and all odd indexed characters in each word lower cased. The indexing
just explained is zero based, so the zero-ith index is even, therefore that character should be upper cased.
The passed in string will only consist of alphabetical characters and spaces(' '). Spaces will only be present if there are
multiple words. Words will be separated by a single space(' ').
=end

=begin

Notes:

Problem:
input:
output:

Write a method that takes a string,
breaks it into words
and for each word
  even indexed characters are converted to upper case
  odd indexed chars to lower case
Joins words back together around a single space
And returns new string

rules:
  casing is done by the word, not the whole string
  for each word, even index chars upcase, odd index chars downcase
  words will be separated by a single space
  string input will only contain words made up of letters seperated by
    a single space between each word
  assume 'the same string' refers merely to origin of value not object identity

Examples / test cases:

Weird string case

W e i r d
0 1 2 3 4
W e I r D

Data Structures:

Algorithm:
Given a string, string
Set words := split string on whitespace into an array of substrings
Set cased_words := empty array
Iterate through each word in words
  Set cased_word := an empty string
  Iterate through each char in word with index
    If index even
      Append upper case version of char to cased_word
    Else
      Append lower case verion of char to cased_word
  Append cased_word to cased_words
Concatenate cased_words to a single string
Return that string
=end

def weirdcase(string)
  words = string.split
  words.map! do |word|
    word.chars.map.with_index do |char, index|
      index.even? ? char.upcase : char.downcase
    end.join
  end
  words.join(' ')
end

p weirdcase( "String" ) == "StRiNg"
p weirdcase( "Weird string case" ) == "WeIrD StRiNg CaSe"

# 13:48
