# Detect Pangram

=begin
A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).

Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.
=end

=begin
Notes:

Problem:
input: a string
output: boolean true or false

Write a method that takes a string and returns true if the string
contains every letter of the alphabet AT LEAST once

rules:
  must normalize case to lowercase before anything else
  do not count non-lowercase letter characters

Examples and test cases:

Data structures:

Use a range ('a'..'z') both to build the hash and test if you should count chars
Use a hash to count instances only of lowercase letters

Algorithm:
Given a string, text
text = convert all letters in text to lowercase
Set alphabet := a range of characters from 'a' to 'z'
Set counts := a hash
Iterate over each letter in alphabet
  Set counts[letter] := false
Iterate over each char in text
  If char is a lowercase letter
    counts[char] = true
Iterate over only each value in the values from the counts hash
  If value is true
    Next iteration
  Else
    Return false
Return true
=end

def pangram?(text)
  text = text.downcase

  alphabet = ('a'..'z')
  counts = alphabet.each_with_object({}) do |letter, hash|
    hash[letter] = false
  end

  text.each_char do |char|
    if alphabet.cover?(char)
      counts[char] = true
    end
  end
  
  counts.values.all?
end

p pangram?("The quick brown fox jumps over the lazy dog.") == true
p pangram?("This is not a pangram.") == false

# 13:44