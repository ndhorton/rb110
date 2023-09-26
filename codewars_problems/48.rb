# Where is my Parent? (cry)

=begin
Notes:



Problem:
input: a string containing only letters
output: a new string

  Write a method that takes a string containing only letters with
  unique uppercase letters and return a new string where the input
  characters have been arranged so that uppercase 'A' is followed by
  all occurrences of lowercase 'a', 'B' by 'b' and so on...

rules:
  input string contains only letters
  uppercase letters are unique
  assume return a new string
  assume all children have parents

Examples and test cases:

Data structures:

Algorithm:
given a string, party
create an empty hash, parent_child
iterate through each character in party
  if character >= 'A' && character <= 'Z'
    create a new key in parent_child and associate to an empty array
iterate through each character in party
  if character >= 'a' && character <= 'z'
    Append character to parent_child[uppercase version of character] array
Set result := empty string
Iterate through an alphabetically sorted array of the keys from parent_child
  Append key to result
  Concatenate every string in the associated value array
  Append new string to result
Return result
=end

def find_children(party)
  parent_child = {}
  party.each_char do |char|
    parent_child[char] = [] if char >= 'A' && char <= 'Z'
  end
  party.each_char do |char|
    parent_child[char.upcase] << char if char >= 'a' && char <= 'z'
  end
  result = ''
  parent_child.keys.sort.each do |parent|
    result << parent
    parent_child[parent].each { |child| result << child }
  end
  result
end

# first codewars solution
def find_children(party)
  party.chars.sort_by { |char| [char.downcase, char] }.join
end

p find_children("abBA") == "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""

# 19:30
