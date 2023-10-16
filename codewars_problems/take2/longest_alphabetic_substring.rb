# Longest Alphabetical Substring

=begin
Find the longest substring in alphabetical order.
Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".
There are tests with strings up to 10 000 characters long so your code will need to be efficient.
The input will only consist of lowercase characters and will be at least one letter long.
If there are multiple solutions, return the one that appears first
=end

=begin

Notes:

Problem:
input: a string
output: a new string

write a method that takes a string and returns the longest substring where every
character is >= to the preceding character (in ascii value)

rules:
input strings will contain at least one character
input strings will consist only of lowercase letters
if there are two equal-sized alphabetic substrings, return the one that occurs first
assume return a new string

Examples / test cases:

a
s?
a s
d? no
as d
as is longest, return as

Data Structures:

[a] - buffer
start iteration at 1 upto last index inclusive
  if current character is >= last element in buffer
    add it to the buffer
  else
    add the buffer to a substrings array
    buffer = current character
set longest := length of first substring

Algorithm:
Given a string, string
Set substrings := empty array
Set buffer := first character of string
Iterate index for 1 upto string size exclusive
  if string[index] is >= last character in buffer
    Append string[index] to buffer
  else
    Append the buffer to substrings array
    buffer = string[index]
Append buffer to substrings
Set longest := first element in substrings
Iterate for index from 1 to substrings size exclusive
  Set length := size of substrings[index]
  If length > size of longest
    longest = substrings[index]
Return longest
=end

def longest(string)
  substrings = []
  buffer = string[0]
  (1...string.size).each do |index|
    if string[index] >= buffer[-1]
      buffer << string[index]
    else
      substrings << buffer
      buffer = string[index]
    end
  end
  substrings << buffer

  longest = substrings.first
  (1...substrings.size).each do |index|
    longest = substrings[index] if substrings[index].size > longest.size
  end
  longest
end

def longest(string)
  substrings = string.chars.chunk_while { |a, b| a <= b }.map(&:join)
  substrings.max_by(&:size)
end

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') =='fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'

# 21:35