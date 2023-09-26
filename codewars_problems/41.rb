# Backspaces in String

=begin
Notes:

One approach would be to 
while the string contains hashes
  list = scan(/.#?/)
  iterate through list destructive substituting list item with ''
  if string only contains hashes
    delete all hashes
    break from iteration

Problem:
input: a string
output: the same string with indicated characters deleted

  Write a method that takes a string containing 0 or more characters
  0 or more of which are # characters. Hashes signify backspace characters.
  Return a string processed to implement the backspaces.

rules:
  a string with only hashes returns an empty string
  an empty string returns an empty string
  hashes
  return a new string? Yes 

Examples and test cases:

a b c# d# # c
[c#, d#]
a b# c
[b#]
a c

Data structures:

Algorithm:
Given a string
Copy string
Iterate while the string contains '#' chars
  Set matches := get an array containing any non-# characters immediately followed by a #
  Iterate through each match in matches
    Delete only the first instance of match in string
  If the string only contains # chars
    Delete all # chars
    Break from iteration
Return string

Non-Regex Approach:

Subprocess mark_pairs
Given a string
Set result := empty array
Set buffer := empty string
Iterate over each char in string
  If there is a character in buffer AND
     char == '#'
    Append char to buffer
    Append buffer to result
    Clear buffer
  Else if char == '#'
    Next iteration
  Else
    buffer = char
Return result

Subprocess only_hashes?
Given a string
Iterate through each char in string
  if char != '#'
    return false
return true

Subprocess clean_string
Given a string, string
Copy string for processing
Iterate while string contains '#' character(s)
  marked_pairs = mark_pairs(string)
  Iterate through each pair in marked_pairs
    Delete only first instance of pair from string
  If only_hashes?(string)
    Delete all '#' from string
Return string
=end

def only_hashes?(string)
  string.each_char { |char| return false if char != '#' }
  true
end

def mark_pairs(string)
  result = []
  buffer = ''
  string.each_char do |char|
    next if char == '#' && buffer.empty?
    if char == '#'
      buffer << char
      result << buffer
      buffer = ''
      next
    end
    buffer = char
  end
  result
end

# With Regex
def clean_string(string)
  string = string.dup
  while string.include?('#')
    matches = string.scan(/.#+?/)
    matches.each { |match| string.sub!(match, '') }
    string.delete('#') unless string.match?(/[^#]/)
  end
  string
end

# Without
def clean_string(string)
  string = string.dup
  while string.include?('#')
    marked_pairs = mark_pairs(string)
    marked_pairs.each { |pair| string.sub!(pair, '') }
    string.delete!('#') if only_hashes?(string)
  end
  string
end

p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == ""

# 26:50
