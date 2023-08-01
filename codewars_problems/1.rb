# Count Letters in String

=begin

Notes:
questions:

the tally method does something very like this

Problem:
input: a string
output: a hash of tallies of the occurrences of each lowercase letter that
appears in the string

  Given a string, count the occurrences of every lowercase letter in
  the string and return as a hash where the letter is the key, the count
  is the value

rules:
  the key must be a symbol, not a string
  
Examples:

DS:

Algorithm:
Given a string, text
Convert text to an array of characters, key_chars
Remove repeating characters
Remove characters that are not lowercase letters
Sort key_chars
Create an empty hash, letter_tally
Iterate over each key_char in key_chars
  count the number of times key_char appears in text
  create new key-value pair in letter_tally
    the key is key_char
    the value is the count of times it appears in text
Return letter_tally

=end

def letter_count(text)
  key_chars = text.chars.uniq.select { |char| ('a'..'z').cover?(char) }.sort
  key_chars.each_with_object({}) do |key_char, letter_tally|
    tally = text.count(key_char)
    letter_tally[key_char.to_sym] = tally
  end
end

p(letter_count('codewars')  == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1})
p(letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1})
p(letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2})