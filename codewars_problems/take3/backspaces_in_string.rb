# Backspaces in string

=begin
Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd"
Your task is to process a string with "#" symbols.
Examples
"abc#d##c" ==> "ac"
"abc##d######" ==> ""
"#######" ==> ""
"" ==> ""
=end

=begin

Notes:

Problem:
input: a string
output: a new string

Write a method that takes a string containing
0 or more '#' symbols and processes them as
backspaces characters. Return a new string
based on the input with the '#' backspaces
effected.

rules:
  excess # symbols don't do anything
  an empty string returns an empty string
  assume you return a new string, don't mutate arg

Examples / test cases:

a c

Data Structures:

an array of characters that can be popped when
a hash is encountered, otherwise put char into array

Algorithm:
Given a string, text
Set characters := empty array
Iterate over each char in text
  If char == '#'
    Remove the last element in characters
  Else
    Append char to characters
Concatenate characters together to a single string
Return that string
=end

def clean_string(string)
  characters = []
  string.each_char do |char|
    if char == '#'
      characters.pop
    else
      characters.push(char)
    end
  end
  characters.join
end

p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == ""

# 9:34
