# Anagram difference

=begin
Given two words, how many letters do you have to remove from them to make them anagrams?
Example
First word : c od e w ar s (4 letters removed)
Second word : ha c k er r a nk (6 letters removed)
Result : 10
Hints
A word is an anagram of another word if they have the same letters (usually in a different order).
Do not worry about case. All inputs will be lowercase.
=end

=begin

Notes:

Problem:
input: two string
output: an integer

Write a method that takes two strings
and returns the sum of the counts of letters
you would have to remove from each word
to make them anagrams

rules:
  all inputs will be lowercase
  one or both inputs may be empty
  if both empty -> 0
  if one empty, the sum of the quantities will be
    the size of the string that isn't empty

Examples / test cases:

a a b
  2 1
a
-1

a
1

a a b
-2  -1

a => -1
b => -1
return | (-1) + (-1) |

a => 1
b => 1
return 2

Data Structures:

a hash to collect all positive values from string1
                  all negative values from string2
Then apply absolute value function when summing the
hash values

Algorithm:
Given two strings, string1 and string2
Set result := 0
Set counts := an empty hash
Iterate through each char in string1
  If char is a key in counts
    counts[char] = counts[char] + 1
  Else
    Set counts[char] := 1
Iterate through each char in string2
  If char is a key in counts
    counts[char] = counts[char] - 1
  Else
    Set counts[char] := -1
Iterate through only the values of counts hash
  result = result + | current count |
Return result
=end

def anagram_difference(string1, string2)
  counts = Hash.new(0)
  string1.each_char { |char| counts[char] += 1 }
  string2.each_char { |char| counts[char] -= 1 }
  counts.values.sum(0) { |value| value.abs }
end

p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10

# 13:09
