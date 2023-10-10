# Kebabize

=begin

Notes:

so the first word can optionally be capitalized

approach:
purge non-letter characters1
split on capital letters but include them in the following string
- something like slice_when or chunk_while
convert every resulting string to lowercase
concatenate around '-'

Problem:
input: a string
output: a new string

  Write a method that takes a string in lower camelCase
  and returns a new string in kebab-case.

rules:
  CAMEL -> c-a-m-e-l
  the return string should contain only lowercase letters and hyphens
  this means removing non-letter characters from input
  the first word can optionally be capitalized even though
    it is normally all-lowercase

Examples / test cases:

c a m e l s
H a v e
T h r e e
H u m p s

C
A
M
E
L

Data Structures:

Algorithm:
Given a string, str
Set characters := split str into an array of character-strings
Filter out non-letter characters
Iterate through pairs of characters splitting into subarrays wherever
  the second character is an uppercase letter
Transform this array of arrays so that each subarray of character-strings is joined
  to a single string
  then convert each string to all-lowercase
Join each resulting string around a '-' character
Return the resulting string
=end

def kebabize(str)
  characters = str.chars.select { |char| char =~ /[a-zA-Z]/ }
  words = characters.slice_when { |a, b| b =~ /[A-Z]/ }
  words = words.map { |word| word.join.downcase }
  words.join('-')
end

# 18:44
