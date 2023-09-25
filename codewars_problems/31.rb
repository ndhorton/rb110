# Anagram Detection

=begin
Notes:

Problem:
input: two strings
output: true or false

  Write a method that takes two string arguments and returns true
  if they are anagrams of each other, false otherwise

rules:
  should be case insensitive
  will the strings contain anything other than letters? No, based on examples

Examples and test cases:

Data structures:

Algorithm:
Given a string, word1, and a string, word2
Set sorted_word1 := 
  Convert word1 to lowercase
  Convert word1 to a character-string array
  Sort the array
  Join the strings in the array around into a new string
Set sorted_word2 :=
  Repeat the above steps for word2
Return the boolean result of comparing sorted_word1 and sorted_word2
=end

def is_anagram(word1, word2)
  word1.downcase.chars.sort.join == word2.downcase.chars.sort.join
end

p is_anagram('Creative', 'Reactive') == true
p is_anagram("foefet", "toffee") == true
p is_anagram("Buckethead", "DeathCubeK") == true
p is_anagram("Twoo", "WooT") == true
p is_anagram("dumble", "bumble") == false
p is_anagram("ound", "round") == false
p is_anagram("apple", "pale") == false
