# Scramble

=begin

Notes:

approach:
count the characters in str1
count the characters in str2
if all counts of str1 characters are >= to counts for those
characters in str2, return true
otherwise, return false

Problem:
input: two strings
output: boolean true or false

Write a method that takes two strings and returns true if a portion
of the first string's characters can be rearranged to form second string

rules:
  both strings will only contain lowercase letters

Examples / test cases:

Data Structures:

use one hash for both
increment for string1
decrement for string2
at the end, check only chars from string2
  if that char in the hash has a negative value
    return false
return true

Algorithm:
Given two strings, str1, str2
Set counts := empty hash
Iterate through each character in str1
  If character is a key in counts
    counts[character] = counts[character] + 1
  Else
    Set counts[character] = 1
Iterate through each character in str2
  If character is a key in counts
    counts[character] = counts[character] - 1
Iterate through each character in str1
  If character is a key in counts
    counts[character] = counts[character] + 1
  Else
    Set counts[character] = 1
Iterate through each character in str2
  if counts[character] < 0
    Return false
Return true
=end

def scramble(str1, str2)
  counts = Hash.new(0)
  str1.each_char { |char| counts[char] += 1 }
  str2.each_char { |char| counts[char] -= 1 }
  str2.chars.none? { |char| counts[char].negative? }
end

def scramble(str1, str2)
  available = str1.dup

  str2.each_char do |char|
    next if available.sub!(char, '')
    return false
  end
  true
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true

# 10:37
