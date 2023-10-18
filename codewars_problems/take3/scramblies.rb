# Scramblies

=begin
Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match
str2, otherwise returns false.
Notes:
Only lower case letters will be used (a-z). No punctuation or digits will be included.
Performance needs to be considered
Input strings s1 and s2 are null terminated.
=end

=begin

Notes:

Problem:
input: two strings
output: boolean true or false

Write a method that takes two strings, str1 and str2
and returns true if some or all of the characters
in str1 can be rearranged to make str2

rules:
  will either string be empty? no
  inputs will only contain lowercase letters

Examples / test cases:

r k q o d l w
1 1 1 1 1 1 1
-1
0 1 1 0 0 0 0

w o r l d
1 1 1 1 1

k a t a s
1   1 2 1
-1
0   0
s t e a k
    -1

Data Structures:

Hash to record counts of characters in str1
Subtract 1 for each character in str2

Algorithm:
Given two strings, str1 and str2
Set counts := a hash
Iterate through each character in str1
  If character is a key in counts
    counts[character] = counts[character] + 1
  Else
    Set counts[character] := 1
Iterate through each character in str2
  If character is a key in counts
    counts[character] = counts[character] - 1
  Else
    Set counts[character] := -1
  If counts[character] < 0
    Return false
Return true
=end

def scramble(str1, str2)
  counts = Hash.new(0)
  str1.each_char { |char| counts[char] += 1 }
  str2.each_char do |char|
    counts[char] -= 1
    return false if counts[char].negative?
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

# 11:46
