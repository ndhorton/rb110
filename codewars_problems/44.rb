# Counting Duplicates

=begin
Notes:

Problem:
input: a string
output: the number of characters (case-insensitive) that occur more than once in string

  Write a method that takes a string, and returns the number of characters
  (case-insensitive) that occur more than once in the input string.

rules:
  counts of characters should be case-insensitive for letter characters
  input string will only contain alphanumeric characters

Examples and test cases:

Data structures:

Algorithm:
Given a string, string
string = convert letters in string to lowercase, leave the rest as they are
Set unique_chars := remove duplicates from string and split into array of single-character strings
Set counts := empty array
Iterate through each char in unique_chars
  Set current_count := count the number of occurences of char in string
  Push current_count to counts
Return the count of numbers in counts greater than 1
=end

def duplicate_count(string)
  string = string.downcase
  unique_chars = string.chars.uniq
  counts = []
  unique_chars.each do |char|
    counts << string.count(char)
  end
  counts.count { |current_count| current_count > 1 }
end

p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2

# 10:45
