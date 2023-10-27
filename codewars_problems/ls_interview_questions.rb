# Problem 1 - 16:44
# Problem 2 - 15:06
# Problem 3 - 21:09
# Problem 4 - 19:57
# Problem 5 - 25:21 - fuzzy algorithm, didn't understand why my solution worked when it did
# (the reason it worked: hash insertion order - bad to rely on that)

# Making my own each_cons - quite fiddly

def each_cons(array, n)
  return array if array.size < n

  n.upto(array.size) do |limit|
    current_group = array.slice(limit - n, n)
    yield(current_group)
  end

  array
end

# def each_cons(array, n)
#   return array if array.size < n

#   current_group = array.take(n)
#   working_array = array.drop(n)
#   yield(current_group)
#   working_array.each do |element|
#     current_group.shift
#     current_group << element
#     yield(current_group)
#   end

#   array
# end

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
each_cons(arr, 5) { |group| p group }
# arr.each_cons(5) { |group| p group }

# Closest Pair
# first method is what I wrote ( O(n^2) )
# second two should be O(n log n)

def closest_numbers(numbers)
  smallest_difference = (numbers[0] - numbers[1]).abs
  pair = [numbers[0], numbers[1]]
  numbers.each_with_index do |current_number, current_index|
    numbers.each_with_index do |search_number, search_index|
      next if current_index == search_index
      search_difference = (current_number - search_number).abs
      if search_difference < smallest_difference
        smallest_difference = search_difference
        pair = [current_number, search_number]
      end
    end
  end
  pair
end

def closest_numbers(numbers)
  indexes = {}
  numbers.each_with_index { |number, index| indexes[number] = index }
  sorted_numbers = numbers.sort
  smallest_difference = (sorted_numbers[1] - sorted_numbers[0]).abs
  closest_pair = [sorted_numbers[0], sorted_numbers[1]]
  (2...sorted_numbers.size).each do |index|
    current_difference = (sorted_numbers[index] - sorted_numbers[index - 1]).abs
    if current_difference < smallest_difference
      closest_pair = [sorted_numbers[index - 1], sorted_numbers[index]]
      smallest_difference = current_difference
    end
  end
  if indexes[closest_pair[1]] < indexes[closest_pair[0]]
    closest_pair.reverse
  else
    closest_pair
  end
end

def find_closest_pair(numbers)
  smallest_difference = (numbers[0] - numbers[1]).abs
  closest_pair = [numbers[0], numbers[1]]
  numbers.each_cons(2) do |first_number, second_number|
    current_difference = (first_number - second_number).abs
    if current_difference < smallest_difference
      smallest_difference = current_difference
      closest_pair = [first_number, second_number]
    end
  end
  closest_pair
end

def closest_numbers(numbers)
  indexes = {}
  numbers.each_with_index { |number, index| indexes[number] = index }

  closest_pair = find_closest_pair(numbers.sort)

  if indexes[closest_pair.last] < indexes[closest_pair.first]
    closest_pair.reverse
  else
    closest_pair
  end
end

# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

=begin
Notes:

Problem:
input: a string
output: a one-character string

Write a method that takes a string and returns the character
that occurs least often in the string. If there are more than one
candidates, choose the one that appears first in the string
When counting characters, be case-insensitive

rules:
  normalize case to lower case before proceeding with the method

Examples and test cases:
occurences
h => 1
e => 1
l => 3
o => 2
w => 1
r => 1
d => 1

find minimum of values of occurrences
select an array of keys that have that minimum value
find the key from that array that has the least index

earliest_indexes
h => 0
e => 1
l => 2
o => 4
w => 6
r => 8
d => 10

Data structures:

Algorithm:
Given a string, string
string = convert all uppercase letters in string to lowercase
Set occurrences := an empty hash
Iterate over each char in string
  If char is a key in occurences
    occurrences[char] = occurrences[char] + 1
  Else
    Set occurrences[char] := 1
Set indexes := empty hash
Iterate over each char in string with index
  If char is a key in indexes
    Next iteration
  Set indexes[char] := index

----fuzzy
Set least_occurence := find minimum in occurrences by value

Set candidates := array containing keys from occurrences where value == last_occurrences
Set minimum_candidate := find minimum of candidates by the lowest indexes[candidate]
Return minimum_candidate
----^fuzzy

Set minimum_occurrences := find the minimum in only the values of occurrences
Set candidates := empty array
Iterate through each char, count key-value pair in occurrences
  If count == minimum_occurrences
    Push char to candidates
Set least_common := find minimum in candidates by indexes[candidate]
Return least_common
=end


# This only works by luck
# because although hash insertion order can be guarenteed to remain
# in Ruby >= 1.9 (?) (though obviously not portable to earlier rubies)
# min is not guarenteed to return the first-found minimum if there are several
# minimum candidates
def least_common_char(string)
  string = string.downcase
  occurrences = Hash.new(0)
  string.each_char { |char| occurrences[char] += 1 }

  least_occurring = occurrences.min { |a, b| a.last <=> b.last }
  least_occurring.first
end

# Much simpler solution (if slower time complexity)
def least_common_char(string)
  string = string.downcase
  characters = string.chars

  least_occurring = characters[0]
  least_occurrences = characters.count(least_occurring)
  characters.each do |char|
    current_count = characters.count(char)
    if current_count < least_occurrences
      least_occurrences = current_count
      least_occurring = char
    end
  end

  least_occurring
end

# This is what I was trying to do
def least_common_char(string)
  string = string.downcase
  occurrences = Hash.new(0)
  string.each_char { |char| occurrences[char] += 1 }
  indexes = {}
  string.each_char.with_index do |char, index|
    next if indexes.key?(char)
    indexes[char] = index
  end
  minimum_occurrence = occurrences.values.min
  candidates = []
  occurrences.each do |char, count|
    candidates << char if count == minimum_occurrence
  end
  candidates.min { |char| indexes[char] }
end


# Examples:

p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'

# The tests above should print "true".

# 25:21
