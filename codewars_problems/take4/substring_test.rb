# Substring Test (LS video 4)

=begin

Notes:

One approach
get every substring for first word
repeat for second word
iterate through each first word substring
  if that substring is conatained in the second word substring array
    return true
return false

Problem:
input: two strings
output: boolean true or false

Write a method that takes two strings and returns boolean true or false
depending on whether there is a substring of at least two characters common
to both strings

rules:
  substrings of one character don't count
  two empty strings don't match
  assume case sensitive? no

Examples / test cases:

S ome t h i n g
H ome

Data Structures:

Algorithm:
subprocess leading_substrings
Given a string
Set result := empty array
Iterate for final_index from 1 upto size of string exclusive
  Slice string at index 0 upto final_index inclusive
  Push slice to result
Return result

subprocess all_substrings
Given a string
Set result := empty array
Iterate for start_index from 0 upto string size - 1 exclusive
  Set current_slice := slice string from start_index to string size - 1 inclusive
  result = result + leading_substrings(current_slice)
Return result

subprocess substring_test
Given two strings, string1 and string2
If string1 size is less than 2 || string2 size is less than 2
  Return false
Set substrings1 := all_substrings(string1)
Set substrings2 := all_substrings(string2)
Iterate over each substring in substrings1
  If substring is contained in substrings2
    Return true
Return false
=end

def leading_substrings(string)
  result = []
  (1...string.size).each do |final_index|
    result << string[0..final_index]
  end
  result
end

def all_substrings(string)
  result = []
  (0...string.size - 1).each do |start_index|
    result.concat(leading_substrings(string[start_index..-1]))
  end
  result
end

def substring_test(string1, string2)
  if string1.size < 2 || string2.size < 2
    return false
  end

  string1 = string1.downcase
  string2 = string2.downcase

  substrings1 = all_substrings(string1)
  substrings2 = all_substrings(string2)

  substrings1.any? { |substring| substrings2.include?(substring) }
end

# Much better method based on idea near start of video
# Specifically, that if the minimum size substring matches, it's safe to return true
def substring_test(string1, string2)
  string1 = string1.downcase
  string2 = string2.downcase

  string1.chars.each_cons(2) do |sub_string_chars|
    sub_string = sub_string_chars.join
    return true if string2.include?(sub_string)
  end
  false
end

# without fancy each_cons method
def substring_test(string1, string2)
  string1 = string1.downcase
  string2 = string2.downcase

  (0...string1.size - 1).each do |index|
    current_substring = string1[index, 2]
    return true if string2.include?(current_substring)
  end
  false
end

p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true

# 22:08
