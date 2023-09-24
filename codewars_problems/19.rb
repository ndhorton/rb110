# Title Case

=begin
Notes:

Problem:
input:
output:

  Write a method that will convert a string into title case
    based on an optional second argument of minor words

rules:
  Every word is capitalized unless it is given as a minor word
  The first word is always capitalized even if it is a minor word
  If no minor words are given, every word is capitalized
  The case of the words given as minor words should be normalized
  The minor words, if given, will be given as a string
  Does 'convert a string' mean retain object identity? No

Examples and test cases:

Data structures:

Algorithm:
Given a string, title, and a string, minor_words
Convert both title and minor_words to lowercase
Set words := split title on whitespace into an array of strings
Set exceptions := split minor_words on whitespaces into an array of strings
Destructively capitalize first element in words
Iterate over each word in words starting from the second element
  If word is included in exceptions
    Next iteration
  Else
    Destructively capitalize word
Set result := join all strings in words into one string around single spaces
Return result
=end

def title_case(title, minor_words = '')
  title = title.downcase
  minor_words = minor_words.downcase

  words = title.split
  exceptions = minor_words.split
  words[0].capitalize!
  words[1..-1].each do |word|
    next if exceptions.include?(word)
    word.capitalize!
  end
  words.join(' ')
end

p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'

# 13:54
