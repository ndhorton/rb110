# Detect Pangram

=begin

A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence "The
quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).
Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.



Notes:

questions:

Problem:
input: a string
output:

  Write a method that detects whether the argument string is a pangram
  Return true if it is, false if it isn't

rules:
  case-insensitive
  ignore numbers and symbols

Examples:

DS:

Algorithm:

Define constant ALPHABET := every lowercase letter in alphabetical order

subprocess pangram? : string -> boolean
Given a string, text
text = lowercase version of text
Set characters := split text into an array of characters
characters = unique characters
Set letters := empty array
Iterate through each character in characters
  If character is a lowercase letter
    Append letter to letters
Sort letters
Set test_string := convert letters to a string
Return boolean result of test_string == ALPHABET
=end

ALPHABET = [*('a'..'z')].join.freeze

def pangram?(text)
  letters = text.downcase.chars.uniq.select { |char| char =~ /[a-z]/ }
  letters.sort!
  test_string = letters.join
  test_string == ALPHABET
end

p pangram?("The quick brown fox jumps over the lazy dog.") == true
p pangram?("This is not a pangram.") == false

# 12:47
