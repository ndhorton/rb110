# Longest vowel chain

=begin

Notes:

If char is a vowel AND last index
  Increment current_vowel_count by 1
  max_cons_vowels = whichever is greater, current vowel count or previous max
Else if last index
  max_cons_vowels = whichever greater, current or previous max
Else if char is a vowel
  Increment current_vowel_count by 1
Else
  max_cons_vowels = whichever greater, current or previous max
End if

Last element problem


questions:

Problem:
input:
output:

  Write a method that takes a string as argument and determines
  the longest substring that only consists of vowels

rules:
  the string will be lowercase, no spaces or non-alphabetic chars

Examples:

DS:
a string containing 'aeiou'

Algorithm:
Given a string, s
Set max_consecutive_vowels := 0
Iterate over each char in s with index
  If char is a vowel AND it's the last index
    Increment current_vowel_count by 1
    max_consecutive_vowels = whichever greater, current or previous max
  Else if last index
    max_consecutive_vowels = whichever greater, current or previous max
  Else if char is a vowel
    Increment current_vowel_count by 1
  Else
    max_consecutive_vowels = whichever greater, current or previous max
    current_vowel_count = 0
Return max_consecutive_vowels
=end

VOWELS = 'aeiou'

def solve(s)
  max_consecutive_vowels = 0
  current_vowel_count = 0
  s.each_char.with_index do |char, index|
    if index == s.size - 1
      current_vowel_count += 1 if VOWELS.include?(char)
      max_consecutive_vowels = [max_consecutive_vowels, current_vowel_count].max
    elsif VOWELS.include?(char)
      current_vowel_count += 1
    else
      max_consecutive_vowels = [max_consecutive_vowels, current_vowel_count].max
      current_vowel_count = 0
    end
  end
  max_consecutive_vowels
end

def solve(s)
  s.scan(/[aeiou]+/).map(&:size).max
end

p(solve("codewarriors") == 2)
p(solve("suoidea") == 3)
p(solve("iuuvgheaae") == 4)
p(solve("ultrarevolutionariees") == 3)
p(solve("strengthlessnesses") == 1)
p(solve("cuboideonavicuare") == 2)
p(solve("chrononhotonthuooaos") == 5)
p(solve("iiihoovaeaaaoougjyaw") == 8)

# 23:23
