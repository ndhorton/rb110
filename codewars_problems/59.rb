# Which are In?

=begin
Notes:

Problem:
input: two arrays of strings
output: a new array of strings

Write a method that takes two arrays of strings a1 and a2
and returns a sorted array containing only those string elements from a1
which are substrings of any of the strings in a2

rules:
  assume 'lexicographical order' means standard ASCII order? yes
  the returned array must be sorted
  don't mutate input
  returned array must be unique strings from a1, no duplicates

Examples and test cases:

For each element in 'arp, 'live', 'strong'
  if there are any 'arp' strings in a2
    add 'arp' to result

Data structures:

Algorithm:
Given two arrays of strings, a1 and a2
Set result := empty array
Iterate through each substring in a1
  If there are any strings in a2 that have substring as a sub-string
    Append substring to result
Sort result
Return result
=end

def in_array(a1, a2)
  result = a1.select do |substring|
    a2.any? { |string| string =~ /#{substring}/ }
  end
  result.sort
end

a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
p in_array(a1, a2) == ["arp", "live", "strong"]
a1 = ["tarp", "mice", "bull"]
p in_array(a1, a2) == []

# 11:02
