# Simpler problem from PEDAC Study Session with Rachele Lang

=begin
Write a method that takes an array of consecutive letters as input and returns the missing letter.

p determine_missing_letter(['a','b','c','d','f']) == 'E' 
p determine_missing_letter(['o','q','r','s']) == 'P'
p determine_missing_letter(['H','J','K','L']) == 'i'
p determine_missing_letter([]) == []
=end

=begin

Thoughts:

iterate through array checking if letter is one letter different from next letter

generate array from range from first letter in array to last
compare arrays
if equal, return letter after last in the array
otherwise return the difference

questions:
  -will the letters ever loop around? e.g %w(y z a b c)?
  -should the empty array returned be the same that is passed in?
  -will the letters ever be mixed case?
  -will there ever be an array with no missing letters besides
    the empty array?

Problem:
input: array of letters in alphabetical order with one-letter lacuna
output: EITHER the missing letter
        OR empty array if input array is empty

rules:
  empty array returns empty array
  assume there will always be a missing letter unless array empty
  assume the returned letter should be
    lowercase if the array contains uppercase letters 
    uppercase if the array contains lowercase letters

Examples:

p determine_missing_letter(['a','b','c','d','f']) == 'E'

p determine_missing_letter(['o','q','r','s']) == 'P'

p determine_missing_letter(['H','J','K','L']) == 'i'

p determine_missing_letter([]) == []

DS:

Algorithm:

1.
Given an array, letters
Iterate through each letter in letter
  If letter is NOT one ascii character less than next element in array
    Return the letter logically after letter in opposite case
Return letters (because empty)

2.
Given an array, letters
If letters is empty
  Return letters
Generate array from range from first element through last
Subtract letters from full range array
Return the only remaining element in the opposite letter case

=end

# 1.
def determine_missing_letter(letters)
  index = 0
  loop do
    break if index > letters.size - 2
    if letters[index].succ != letters[index + 1]
      return letters[index].succ.swapcase
    end
    index += 1
  end
  letters
end

# 2.
# def determine_missing_letter(letters)
#   return letters if letters.empty?
#   full_range = [*(letters.first..letters.last)]
#   missing = full_range - letters
#   missing.first.swapcase
# end

p determine_missing_letter(['a','b','c','d','f']) == 'E' 
p determine_missing_letter(['o','q','r','s']) == 'P'
p determine_missing_letter(['H','J','K','L']) == 'i'
p determine_missing_letter([]) == []
p determine_missing_letter(%w(a b c d e f g))

