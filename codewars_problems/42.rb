# Sort Arrays (Ignoring Case)

=begin
Notes:

Problem:
input: an array of strings
output: a new array, sorted case-insensitive

  Write a method that takes an array of strings and sorts the array
  case-insensitive

rules:
  should i return a new array or mutate input array? new array
  the array of strings should be sorted alphabetically (asciibetically? yes)
  the array of strings should be sorted case-insensitive

Examples and test cases:

Data structures:

Algorithm:
Given an array of strings, strings
Sort strings so that they are sorted by a lowercase version as sort key
Return sorted version of strings
=end

def sortme(strings)
  strings.sort_by { |string| string.downcase }
end

def sortme(strings)
  strings.sort_by(&:downcase)
end

def sortme(strings)
  strings.sort do |a, b|
    a.downcase <=> b.downcase
  end
end

p sortme(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm", "there"]
p sortme(["C", "d", "a", "Ba", "be"]) == ["a", "Ba", "be", "C", "d"]
p sortme(["CodeWars"]) == ["CodeWars"]

# 6:02
