# Count and Group Character Occurrences in a String

=begin
Notes:




Problem:
input:
output:

  Write a method that takes a string as an argument and
  returns a hash containing as keys integers representing
  character counts within the string and as values arrays
  containing the characters that occur the number of times
  indicated by the key. Keys should be sorted numerically
  and values should be sorted alphabetically.

rules:
  need to remove 'special characters'
  digits are included
  underscores are 'special characters'? Yes
  String needs to be converted to lowercase
  So string needs to be stripped of non-alphanumeric characters

Examples and test cases:

Data structures:
Need to create an empty hash

Algorithm:
Given a string, string
Convert string to lowercase
string = remove all characters that are not alphanumeric
Create an empty hash, count_tallies
Create an array of unique characters from the string, unique_chars
Iterate over each character in unique_chars
  Set occurrences := count the number of times the character appears in the string
  If occurrences is already a key in count_tallies
    Append the character to the array referenced by that key
  Else
    Create a key-value pair in count_tallies where the key is occurrences and the
      value is an array containing the character
Iterate through each value in count_tallies
  Destructively sort value array in place
Create a new hash, result
Iterate through each key in a sorted array of keys from count_tallies
  Create a new key-value pair in result where the key is the current key and
    the value is the value associated with that key in count_tallies
Return result
=end

def get_char_count(string)
  string = string.downcase
  string.gsub!(/[^a-z0-9]/, '')
  count_tallies = {}
  unique_chars = string.chars.uniq
  unique_chars.each do |char|
    occurrences = string.count(char)
    if count_tallies.key?(occurrences)
      count_tallies[occurrences] << char
    else
      count_tallies[occurrences] = [char]
    end
  end
  count_tallies.values.each { |char_arr| char_arr.sort! }
  result = {}
  count_tallies.keys.sort.each do |count_key|
    result[count_key] = count_tallies[count_key]
  end
  result
end

p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}

# 21:05
# Didn't read the last requirement!
# Had to revise algorithm after first run of the program
# returned falses
