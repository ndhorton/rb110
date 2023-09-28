# Count letters in string

=begin
Notes:

One approach:
Create a hash with a default value 0
Iterate through each character in the string
  hash[char.to_sym] += 1
Return hash

Problem:
input: a string
output: a hash

Write a method that takes a string as input and returns a hash with
each unique character converted to a symbol as key and 
the count of that character's occurences in the string as value

rules:
  the keys must be character-symbols, not character-strings

Examples and test cases:

Data structures:

Algorithm:
Given a string, string
Set result := empty hash
Iterate through each character in string
  Set key := convert character to symbol
  If key exists in result
    result[key] = result[key] + 1
  Else
    result[key] = 1
Return result
=end

def letter_count(string)
  string.chars.each_with_object(Hash.new(0)) do |character, result|
    result[character.to_sym] += 1
  end
end

p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

# 7:35 - should probably have thought to question whether string needs to be checked
#        whether it only includes lowercase characters, but all the tests on codewars
#        did only have lowercase so I guess it's fine for this problem.
