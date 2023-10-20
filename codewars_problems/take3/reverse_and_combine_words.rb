# Reversing and Combining Text

=begin
Your task is to Reverse and Combine Words.
Input: String containing different "words" separated by spaces
1. More than one word? Reverse each word and combine first with second, third with fourth and so on...
(odd number of words => last one stays alone, but has to be reversed too)
2. Start it again until there's only one word without spaces
3. Return your result…
=end

=begin

Notes:

Problem:
input: a string
output: a new string

Write a method that takes a string, text,
which is a series of words separated by spaces and
if there is more than one word
  reverse each word
  combine first with second, third with fourth, etc
  if there is an odd word at the end it doesn't need to be
    concatenated yet
repeat until there is only one word

rules:
  assume return a new string

Examples / test cases:

abc def
cbafed

Data Structures:

Algorithm:
Given a string, text
Split text into an array of substrings on whitespace, words
Iterate while size of words != 1
  Reverse each word
  Set combined_words := empty array
  Iterate through two words at a time, sub_array
    If sub_array size == 2
      Concatenate the two words into a single string
      Push string to combined words
    Else
      Push first element of sub_array to combined_words
  words = combined_words
Return the first element of words
=end

def reverse_and_combine_text(text)
  words = text.split
  while words.size > 1
    words.map!(&:reverse)
    combined_words = []
    words.each_slice(2) do |sub_array|
      combined_words << sub_array.join
    end
    words = combined_words
  end
  words.join
end

p reverse_and_combine_text("abc def") == "cbafed"
p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi"
p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"
p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12 44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf"

# 13:30
