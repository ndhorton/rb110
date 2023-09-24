# Anagram difference

=begin
Notes:

One approach would be to find every substring of both and place in a flat array
find the intersection of the arrays.
find the longest member of the intersection
find the differences in size
add the differences together

The problem with this approach is dealing with a situation where 
there is no common substring, in which case the differences will be the size of the strings

Problem:
input: two strings, string1, string2
output: integer sum of how many letters need to be removed from each to find an anagram

  Write a method that calculates the sum of how many characters you have to
  remove from each of two argument strings in order to make them anagrams

rules:
  if the only way for them to be 'anagrams' is to have two empty strings, so be it
  all inputs will be lowercase

Examples and test cases:

Data structures:

Algorithm:
subprocess leading_substrings
Given a string, string
Set result := empty array
Iterate for 0 up to size of string, exclusive, index
  slice string from index 0 to index index
  append to result
return result

subprocess all_substrings
Given a string, string
Set result := empty array
Iterate for 0 up to size of string, exclusive, index
  result << leading_substrings( slice string from index to last index )
Flatten the result array
Return result

subprocess anagram_difference
Given two strings, string1, string2
Sort string1 (requires char-array conversion and back)
Sort string2
string1_substrings = all_substrings(string1)
string2_substrings = all_substrings(string2)
common_substrings = empty array
Iterate through each substring1 in string1_substrings
  Iterate through each substring2 in string2_substrings
    If substring1 == substring2
      Append substring1 to common_substrings
result = 0
longest_common = find maximum in common_substring
If longest_common
  difference1 = string1 size - longest_common size
  difference2 = string2 size - longest_common size
  result = difference1 + difference2
return result

subprocess all_permutations
given a string, string
Set characters := split string into an array of one-character-strings
Set result := empty array
Iterate for 0 upto string size exclusive, group_size
  current_permutations = find all group_size permutations of characters
  Iterate through each group in current_permutations
    Join group of character-strings to a single string
    Append to result
return result
=end

def leading_substrings(string)
  result = []
  (0...string.size).each do |index|
    result << string[0..index]
  end
  result
end

def all_substrings(string)
  result = []
  (0...string.size).each do |start_index|
    result << leading_substrings(string[start_index..-1])
  end
  result.flatten
end

def anagram_difference(string1, string2)
  common_chars = all_intersections(string1, string2)
  longest_common = common_chars.join

  difference1 = string1.size - longest_common.size
  difference2 = string2.size - longest_common.size
  result = difference1 + difference2
  result
end

def all_intersections(string1, string2)
  characters1 = string1.chars
  characters2 = string2.chars
  result = []
  characters1.each do |char|
    if characters2.include?(char)
      result << char
      index = characters2.index(char)
      characters2.delete_at(index)
    end
  end
  result
end

=begin
1) a a b
2) a a c

iterate through 1
a : is a in 2? yes, remove 1 a from 2) a c
result: a
a : is a in 2? yes, remove 1 a from 2) c
b : is b in 2? no, end


=end

p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10

# 50:00 -- just kept taking wildly long and wrong approaches
# aaand still doesn't pass all tests on codewars
# reason is that intersection doesn't return multiple same characters
# it works like a set operation and discards non-unique members

# Finally, after a shower fixed up an all_intersections method that
# is basically the same logic as scramblies from earlier today
# works on codewars tests
