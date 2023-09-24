# Where my anagrams at?

=begin
Notes:

Problem:
input: a string, word, an array, list
output: a new array

  Write a method that takes a string, word, and an array, list
  and returns a new array whose elements are only those elements from
  list that are anagrams of word

rules:
  do i return a new array or mutate argument? new array

Examples and test cases:

Data structures:

Algorithm:
Given a string, word, an array, list
Set sorted_word :=
  split word into array of characters
  sort characters
  join character-strings back into a single string

Set result := empty array
Iterate through each potential_anagram in list
  Set sorted_potential_anagram := split potential_angaram into array of character-strings
                sort character-strings
                join character-strings back into a single string
  if sorted_potential_anagram == sorted_word
    Append potential_anagram to result array
Return result
=end

def anagrams(word, candidates)
  sorted_word = word.chars.sort.join

  result = []
  candidates.each do |candidate|
    sorted_candidate = candidate.chars.sort.join
    result << candidate if sorted_candidate == sorted_word
  end
  result
end

p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
p anagrams('laser', ['lazing', 'lazy', 'lacer']) == []

# 11:40
