# Alphabetized

=begin
Notes:

Problem:
input: a string
output: a new string

  Write a method that case-insensitively sorts by alphabetical order
  an input string containing only alphabetic characters, punctuation,
  and spaces. Spaces and punctuation should be removed from the return
  value.

rules:
  assume return a new string? yes
  remove non-letter characters
  sort case-insensitively

Examples and test cases:

Data structures:

Algorithm:
Given a string, text
Set characters := split text into array of single-character strings
Remove non-letter characters from characters
Sort characters case-insensitively
Set new_string := concatenate strings in characters into a single string
Return new_string
=end

def alphabetized(text)
  characters = text.chars
  characters = characters.select { |char| char =~ /[a-zA-Z]/ }
  characters.sort! { |a, b| a.downcase <=> b.downcase }
  characters.join
end

p alphabetized("") == ""
p alphabetized(" ") == ""
p alphabetized(" a") == "a"
p alphabetized("a ") == "a"
p alphabetized(" a ") == "a"
p alphabetized("A b B a") == "AabB"
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"

# 9:16
