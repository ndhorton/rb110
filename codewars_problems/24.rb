# Hashtag Generator

=begin
Notes:

Problem:
input: a string containing 1-or-more-space separated words
output: either a hashtag version of input, or false

  Write a method that takes a string of words separated by 1 or more spaces
  and returns either a hashtag version of the input string, or false if
  the string input is empty or the result would be > 140 characters

rules:
  hashtag must start with '#'
  hashtag must be <= 140 characters
  an empty string input returns false
  a string that contains only spaces returns false
  a hashtag > 140 characters returns false instead
  words can be separated by 1 or more spaces

Examples and test cases:

Codewars is Nice
['Codewars', 'is', 'Nice']
['Codewars', 'Is', 'Nice']
'#CodewarsIsNice'

Data structures:

Algorithm:
Given a string, text
If text is an empty string OR contains only spaces
  Return false
Set words := split text on whitespace into array of strings
Iterate through each word in words
  Capitalize word in place
Set result := "#" prepended to words joined to a single string
If result length > 140 characters
  return false
Return result
=end

def generateHashtag(text)
  text = text.strip
  return false if text.empty?
  words = text.split.map(&:capitalize)
  hashtag = '#' << words.join
  return false if hashtag.length > 140
  hashtag
end

p generateHashtag("") == false
p generateHashtag(" " * 200) == false
p generateHashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag"
p generateHashtag("Codewars") == "#Codewars"
p generateHashtag("Codewars Is Nice") == "#CodewarsIsNice"
p generateHashtag("Codewars is nice") == "#CodewarsIsNice"
p generateHashtag("code" + " " * 140 + "wars") == "#CodeWars"
p
generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false
p generateHashtag("a" * 139) == "#A" + "a" * 138
p generateHashtag("a" * 140) == false

# 14:02
