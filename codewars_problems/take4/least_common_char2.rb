# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

=begin

normalize case lower case
iterate once to build counts hash

get the minimum from the values of counts
iterate through string again
  if current_char == minimum
    return the char

Set least_char := first character in string
Set least_count := counts[least_char]
iterate from 1 upto last index
  if counts[current_char] < least_count
    least_count = counts[current_char]
    least_char = current_char

P:
input: string
output: a single character string

rules:
  normalize case to lower case

E:

h e l l o w o r l d

D:

a hash with the count of each character

A:
Given a string, string
Normalize case of string to lower case
Set counts := an empty hash with 0 default value
Iterate through each char in string
  counts[char] = counts[char] + 1
Set least_char := first character in string
Set least_count := counts[least_char]
Iterate for index from 1 upto size of string exclusive
  Set current_char := string[index]
  if counts[current_char] < least_count
    least_count = counts[current_char]
    least_char = current_char
Return least_char
=end

def least_common_char(string)
  string = string.downcase
  counts = Hash.new(0)
  string.each_char { |char| counts[char] += 1 }
  least_char = string[0]
  least_count = counts[least_char]
  (1...string.size).each do |index|
    current_char = string[index]
    if counts[current_char] < least_count
      least_count = counts[current_char]
      least_char = current_char
    end
  end
  least_char
end

# Examples:

p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'

# The tests above should print "true".
