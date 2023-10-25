# Common Prefix

=begin

Notes:

Problem:
input: an array of strings
output: a string

Write a method that takes an array of strings and returns
the longest prefix that all strings have in common. If there
is no such common prefix, return an empty string

rules:
  All input strings will consist only of lowercase letters

Examples / test cases:

f other string (each in turn) =~ /^#{f}
fl
flo
flow
flowe
flower

Data Structures:

Algorithm:
Given an array of strings, words
words = make a shallow copy of words
Set first_word := remove first element from words
Set largest_prefix := empty string
If first_word is falsey
  Return largest_prefix
Iterate for index from 0 upto length of first_word exclusive
  Set current_slice := copy first_word at index 0 upto index inclusive
  Iterate through each remaining word in words
    If current_slice matches word starting at first index onwards
      largest_prefix = current_slice
    Else
      Return largest_prefix
Return largest_prefix
=end

def common_prefix(words)
  words = words.dup
  longest_prefix = ''
  first_word = words.shift
  return longest_prefix unless first_word

  (0...first_word.size).each do |index|
    current_slice = first_word[0..index]
    if words.all? { |word| word =~ /^#{current_slice}/ }
      longest_prefix = current_slice
    else
      break
    end
  end

  longest_prefix
end

def matches_all?(substring, words)
  words.all? do |word|
    word_slice = word[0, substring.size]
    substring == word_slice
  end
end

def common_prefix(words)
  words = words.dup
  longest_prefix = ""
  first_word = words.shift
  return longest_prefix unless first_word

  (0...first_word.size).each do |index|
    current_slice = first_word[0..index]
    if matches_all?(current_slice, words)
      longest_prefix = current_slice
    else
      break
    end
  end

  longest_prefix
end

# based on solution in video, better no regex, single char slices
def common_prefix(words)
  longest_prefix = []
  (0...words[0].size).each do |index|
    current_char = words[0][index]
    if words.all? { |string| string[index] == current_char }
      longest_prefix << current_char
    else
      break
    end
  end

  longest_prefix.join
end

def common_prefix(words)
  longest_prefix = ''
  (0...words[0].size).each do |index|
    current_char = words[0][index]
    if words.all? { |string| string[index] == current_char }
      longest_prefix << current_char
    else
      break
    end
  end

  longest_prefix
end

p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"

# 21:03
