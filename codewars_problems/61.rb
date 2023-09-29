# Find the missing letter

=begin
Notes:

Problem:
input: an array of single-letter strings
output: missing letter string

  Write a method that takes an array of consecutive letters from the alphabet
  and returns the missing letter.

rules:
  you will always get a valid array
  there will always be exactly one letter missing
  the length of the array will always be at least 2
  the letters will only be of one case, could be either case overall  

Examples and test cases:

a b c d f
start at index 1
is b the successor to a?
yes
continue
index 2 c b ? continue
index 3 d c ? continue
index 4 f d ? no, return successor to d -> e

Data structures:

Algorithm:

Given an array of strings, letters
Iterate through each index from 1 to last index of letters array
  If letters[index] is not the successor to letters[index - 1]
    return successor to letters[index - 1]
=end

def find_missing_letter(letters)
  (1...letters.size).each do |index|
    successor = letters[index - 1].succ
    return successor unless letters[index] == successor
  end
end

p find_missing_letter( ["a","b","c","d","f"] ) == "e"
p find_missing_letter( ["O","Q","R","S"] ) == "P"
p find_missing_letter( ["b","d"] ) == "c"
p find_missing_letter( ["a","b","d"] ) == "c"
p find_missing_letter( ["b","d","e"] ) == "c"

# 10:31
