# Mexican Wave

=begin
Notes:

in order to determine number of copies, we need to take the size of the string
without including non-letter characters

iterate through characters until count of letter-characters == current letter to be upcased

Problem:
input: a string
output: an array of strings

  Write a method that takes a string and returns an array containing [not string-size but number of letters in string]
  modified copies of that string, where the first string has its first letter in uppercase, rest lowercase
  the second has its second letter uppercase, rest lowercase and so on

rules:
  the input string may be empty -> return empty array
  the input string will always be lowercase
  will the input string contain non-letter characters? yes, in which case
    preserve and ignore

Examples and test cases:

Hello hEllo heLlo helLo hellO

Data structures:

Algorithm:
Given a string, text
Set number_of_copies := count of lowercase letters in text
Set result := empty array
Iterate for pseudoindex from 1 to number_of_copies inclusive
  Set current_copy := empty string
  Set counter := 0
  Iterate through each char in text
    if char >= 'a' && char <= 'z'
      counter = counter + 1
    if counter == pseudoindex
      Append uppercase version of char to current_copy
    else
      Append char to current_copy
  Append current_copy to result
Return result
=end

def wave(text)
  number_of_copies = text.count('a-z')
  result = []
  1.upto(number_of_copies) do |pseudoindex|
    current_copy = ''
    counter = 0
    text.each_char do |char|
      counter += 1 if char >= 'a' && char <= 'z'
      if counter == pseudoindex
        current_copy << char.upcase
      else
        current_copy << char
      end
    end
    result << current_copy
  end
  result
end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs",
"codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs",
"two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]

# 17:06
