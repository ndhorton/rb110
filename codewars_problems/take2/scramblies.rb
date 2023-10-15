# Scramblies
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
    Return false
Return true
=end

def scramble(str1, str2)
  occurrences = Hash.new(0)
  str1.each_char { |character| occurrences[character] += 1 }
  str2.each_char do |character|
    occurrences[character] -= 1
    return false if occurrences[character].negative?
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

# 12:56
