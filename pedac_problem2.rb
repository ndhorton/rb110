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

questions:
  

probably need to have a special check and explicit return for empty array


Problem:
input: array of letters in alphabetical order except with a one-letter lacuna


rules:
  empty array returns empty array
  output letter must be in the same case as the letters in the input array

Examples:

p determine_missing_letter(['a','b','c','d','f']) == 'E'

p determine_missing_letter(['o','q','r','s']) == 'P'

p determine_missing_letter(['H','J','K','L']) == 'i'

p determine_missing_letter([]) == []

DS:

Algorithm:

=end

p determine_missing_letter(['a','b','c','d','f']) == 'E' 
p determine_missing_letter(['o','q','r','s']) == 'P'
p determine_missing_letter(['H','J','K','L']) == 'i'
p determine_missing_letter([]) == []