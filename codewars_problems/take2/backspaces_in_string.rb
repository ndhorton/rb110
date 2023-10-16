# Backspaces in String

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

Write a method that takes a string with
0 or more '#' symbols and return a new string
where each '#' symbol has been processed as
a backspace character deleting non-'#' chars
from the string

rules:
  assume return a new string
  excess '#' chars simply have no effect and are
    removed from string (like the other hashes)
  an empty input string returns a new empty string

Examples / test cases:

a b c # d # # c

c # # d # c b a

c
backspaces = 2
c
no d, backspaces = 1
backspaces = 2
c
no second c, backspaces = 1
no b, backspaces = 0
c a
reverse to: a c

reverse the string (or simply read backwards and)
is current char a hash?
if so:
  backspaces ++
  filter in nothing
else:
  if backspaces == 0
    filter in char
  else
    backspaces --
    filter in nothing
reverse result


Data Structures:

Algorithm:
Given a string, string
Set result := empty string
Set backspaces := 0
Iterate in reverse order over each char in string
  If char is a '#'
    backspaces = backspaces + 1
  Else if backspaces == 0
    Prepend char to result
  Else
    backspaces = backspaces - 1
Return result
=end

def clean_string(string)
  result = ''
  backspaces = 0
  string.chars.reverse_each do |char|
    if char == '#'
      backspaces += 1
    elsif backspaces == 0
      result.prepend(char)
    else
      backspaces -= 1
    end
  end
  result
end

p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == ""

# 14:38
