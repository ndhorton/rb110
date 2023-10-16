# Scramblies
<<<<<<< HEAD

# Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match
# str2, otherwise returns false
# Only lower case letters will be used (a-z). No punctuation or digits will be included.
# Performance needs to be considered

=begin

Notes:

Approach:
use a hash with a default value of 0
iterate through the first string enumerating occurences using the Hash
iterate through the second string subtracting occurences from the hash
  If any hash value is less than 0, return false
Return true

Problem:
input: two strings
output: boolean true or false

Write a method that return true if str2 can be formed from only those
characters that are present in str1.

rules:
  assume all inputs will only include lowercase letters

Examples / test cases:

Data Structures:

Use a hash with a default value of 0 to count occurrences

Algorithm:
Given two strings, tiles, word
Create a hash, occurrences
Iterate over each tile in tiles
  If tile is a key in occurences
    occurrences[tile] = occurences[tile] + 1
  Else
    occurrences[tile] = 1
Iterate through each letter in word
  If letter is a key in occurrences
    occurrences[letter] = occurrences[letter] - 1
  Else
    Return false
  If occurrences[letter] < 0
=======
# frozen_string_literal: false

=begin
Notes:

Complete the function scramble(str1, str2) that returns true if a portion
of str1 characters can be rearranged to match
str2, otherwise returns false.
Notes:
Only lower case letters will be used (a-z). No punctuation or digits will be included.
Performance needs to be considered

Problem:
input: two strings, str1, str2
output: boolean true or false

Write a method that returns true if str2 can be formed
using only the characters in str1

rules:
  assume input strings will only contain lowercase letters
  assume characters in str1 cannot be used more than once per occurrence in str1

Examples and test cases:

Data structures:

use hash to store occurrences
add 1 for each character in str1
subtract 1 for each character in str2

Algorithm:
Given two strings, str1 and str2
Set occurrences := an empty hash
Iterate through each character in str1
  If character is a key in occurrences
    occurrences[character] = occurrences[character] + 1
  Else
    Set occurrences[character] := 1
Iterate through each character in str2
  If character is NOT a key in occurrences
    Return false
  occurrences[character] = occurrences[character] - 1
  If occurrences[character] < 0
>>>>>>> 5bdb14120e87971a2757d0fb33b05ab1280deea5
    Return false
Return true
=end

<<<<<<< HEAD
def scramble(tiles, word)
  occurrences = Hash.new(0)
  tiles.each_char { |tile| occurrences[tile] += 1 }
  word.each_char do |letter|
    occurrences[letter] -= 1
    return false if occurrences[letter] < 0
=======
def scramble(str1, str2)
  occurrences = Hash.new(0)
  str1.each_char { |character| occurrences[character] += 1 }
  str2.each_char do |character|
    occurrences[character] -= 1
    return false if occurrences[character].negative?
>>>>>>> 5bdb14120e87971a2757d0fb33b05ab1280deea5
  end
  true
end

p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true

<<<<<<< HEAD
# 15:09
=======
# 12:56
>>>>>>> 5bdb14120e87971a2757d0fb33b05ab1280deea5
