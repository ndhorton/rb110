# Longest alphabetical substring

=begin
Find the longest substring in alphabetical order.
Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".
There are tests with strings up to 10 000 characters long so your code will need to be efficient.
The input will only consist of lowercase characters and will be at least one letter long.
If there are multiple solutions, return the one that appears first.
=end

=begin

Notes:

the first value has to be a previous value for
a simple iterative logic to work (without lots of conditionals)

approach:
Set buffer := [first element]
Begin iteration
  Is the current value (second element to start with) >= buffer[-1]
    Add current value to buffer
  Else if buffer size is strictly greater than longest
    longest = buffer
    buffer = [ current value ]
  Else
    buffer = [ current value ]

longest = nothing

Problem:
input: a string
output: a new string

Write a method that takes a string and returns the
longest alphabetical substring that can be formed
without changing the order of letters in the string.

rules:
  assume return a new string
  if there are multiple solutions of the same length, return the
    earliest in order of appearance in the input string
  input string will only contain lowercase letters
  input string will have at least one char

Examples / test cases:

a b

Data Structures:

use a string for buffer
longest is a simple variable

Algorithm:
Given a string, string
Set longest := empty string
Set buffer := first character of string
Iterate for index from 1 to size of string exclusive
  If string[index] >= buffer[ last character ]
    Append string[index] to buffer
    Next iteration

  If size of buffer > size of longest
    longest = buffer

  buffer = string[index]

If buffer size > size of longest
  longest = buffer

Return longest
=end

def longest(string)
  longest = ''
  buffer = string[0]
  (1...string.size).each do |index|
    if string[index] >= buffer[-1]
      buffer << string[index]
      next
    end
    longest = buffer if buffer.size > longest.size
    buffer = string[index]
  end
  longest = buffer if buffer.size > longest.size
  longest
end

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') =='fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'

# 19:47
