=begin

Notes:

One approach:
get every substring
test using a helper method that
  while the concatenated string is <= in size to the whole string
    check if it matches the whole string
    add another copy of the substring to the end of the concatenated string

Another approach:
use regex to scan for matches for each substring

Problem:
input: a string
output: boolean true or false

Write a method that takes a string and returns boolean true if
there is a substring such that the substring repeated more than one time
can form the entire string

rules:
  the string will only contain lowercase letters

Examples / test cases:

Surely must be a leading substring because you can't rotate or reorder letters

abab
a -> a

1..string size / 2
2

Data Structures:

Algorithm:
Given a string, string
Set substring := ''
Iterate for index from 0 upto (size of string / 2) exclusive
  Append string[index] to substring
  Set matches := scan string for regex matches of substring
  Set new_string := concatenate matches to a single string
  If new_string == string
    Return true
Return false

subprocess unique_slices?
Given a string, string, and an integer n
Set characters := split string into array of character-strings
Set slices := slice characters into an array of sub-arrays of size n
If there is only 1 unique value in slices
  Return true
Else
  Return false

subprocess repeated_substring_pattern
Given a string, string
Set midpoint := size of string / 2 (int division)
Iterate for slice_size from 1 upto midpoint inclusive
  If unique_slices?(string, slice_size)
    Return true
Return false
=end

def repeated_substring_pattern(string)
  substring = ''
  (string.size / 2).times do |index|
    substring << string[index]
    return true if string.scan(/#{substring}/).join == string
  end
  false
end

def unique_slices?(string, n)
  slices = string.chars.each_slice(n).to_a
  slices.uniq.size == 1
end

def repeated_substring_pattern(string)
  (1..string.size / 2).any? do |slice_size|
    next if string.size % slice_size != 0
    unique_slices?(string, slice_size)
  end
end

# This is best
def repeated_substring_pattern(string)
  (1..string.size / 2).any? do |slice_size|
    next unless string.size % slice_size == 0
    repeats = string.size / slice_size
    string[0, slice_size] * repeats == string
  end
end

# LS student video, split it into 2 loops
def repeated_substring_pattern(string)
  substrings = []
  1.upto(string.length / 2) do |substring_length|
    next unless string.length % substring_length == 0
    substrings << string[0, substring_length]
  end

  substrings.each do |substring|
    repeats = string.length / substring.length
    return true if substring * repeats == string
  end

  false
end

# Clearest solution
def repeated_substring_pattern(string)
  (1..substring.size / 2).do |slice_size|
    next unless string.size % slice_size == 0

    repeats = string.size / slice_size
    return true if string[0, slice_size] * repeats == string
  end

  false
end

p repeated_substring_pattern('abab') == true
p repeated_substring_pattern('aba') == false
p repeated_substring_pattern('aabaaba') == false
p repeated_substring_pattern('abaababaab') == true
p repeated_substring_pattern('abcabcabcabc') == true

# 18:29



