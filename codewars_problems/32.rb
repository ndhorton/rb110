# Highest Scoring Word

=begin
Notes:

One approach:
  write a scoring method
Approach to scoring:
- take the ascii value of a character and subtract 96
- hash, 'a' => 1, etc
- an array would have to be padded for the 0-index

Problem:
input: a string
output: the highest scoring word

  Write a method that accepts a string of space-separated words
  and returns the highest scoring word, according to the value of
  each letter alphabetically (where a = 1, b = 2, ..., z = 26)
  summed together

rules:
  strings will only contain lowercase letters and spaces separating words
  if two or more strings score the same, return the first of the words in the string

Examples and test cases:

'aaa' is only worth more than 'b' if 'a' is 1 rather than 0

Data structures:

set a variable to an 2-element array and make sure not to update it
unless the new word scores higher rather than equal

Algorithm:
subprocess score
Given a string, word
Set word_score := 0
Iterate through each char in word
  word_score = word_score + the ASCII value of char - 96
Return word_score

subprocess high
Given a string, text
Set words := split text into an array of substrings on whitespace
Set highest_scoring := array containing empty string and 0
Iterate over each word in words
  current_score = score(word)
  if current_score > last element of highest_scoring
    highest_scoring[0] = word
    highest_scoring[1] = current_score
Return first element from highest_scoring
=end

def score(word)
  word_score = 0
  word.each_char do |char|
    word_score += char.ord - 96
  end
  word_score
end

def high(text)
  words = text.split
  highest_scoring = ["", 0]
  words.each do |word|
    current_word_score = score(word)
    if current_word_score > highest_scoring.last
      highest_scoring[0] = word
      highest_scoring[1] = current_word_score
    end
  end
  highest_scoring.first
end

p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak') == 'semynak'
p high('aaa b') == 'aaa'

# 19:42
