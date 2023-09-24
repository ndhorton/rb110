# Dubstep

=begin
Notes:

One approach would be gsub
- need to replace with a space and then squeeze the
  string to only have one space for each group of spaces

One approach would be to split on WUB using a regex
- this would mean removing empty strings before joining

Problem:
input: a string of uppercase letters
output: a new string cleansed of WUB 

  Write a method that takes a string of uppercase letters and removes
  every occurrence of 'WUB' from it

rules:
  0 or more WUB before the first word
  1 or more WUB between words (examples don't seem to match this, could be 0)
  0 or more WUB after the last word
  the input string will not be empty, will only contain uppercase letters
  string length <= 200 characters
  assume you return a new string

Examples and test cases:

Data structures:

Algorithm:
Given a string, remix
Set result := replace each occurrence of "WUB" in remix with " "
Remove any spaces beyond a single space from result from between the words
Remove any trailing or leading spaces
Return result
=end

def song_decoder(remix)
  remix.gsub("WUB", " ").squeeze(" ").strip
end

def song_decoder(remix)
  remix.split(/WUB/).reject(&:empty?).join(' ')
end

p song_decoder("AWUBBWUBC") == "A B C"
p song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
p song_decoder("WUBAWUBBWUBCWUB") == "A B C"

# 15:54