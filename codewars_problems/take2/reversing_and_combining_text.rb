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

Write a method that takes a string, splits it into
words and then
If there is only 1 word, return a copy of that word
If there are more than one word,
  reverse every word
  concatenate the first and second word, third and fourth,
    and so on
  repeat until there is only one word

rules:
  if there is only one word return that word
  assume return a new string

Examples / test cases:

abc def
cbafed

Data Structures:

Algorithm:
Given a string, text
Set words := split text on whitespace into array of substrings
Iterate while words has more than one element
  Iterate through each word in words
    Reverse word
  Set final_word := nil
  If size of words is odd
    final_word = Pop last element from words
  Set combined_words := empty array
  Set index := 0
  Iterate while index < size of words
    Concatenate words[index] with words[index + 1]
    Push resulting string to combined_words
    index = index + 2
  words = combined_words
  If final_word is not nil
    Push final_word to words
Return the first element of words
=end

def reverse_and_combine_text(text)
  words = text.split
  while words.size > 1
    words.map!(&:reverse)
    final_word = nil
    final_word = words.pop if words.size.odd?
    combined_words = []
    index = 0
    while index < words.size - 1
      combined_words << words[index] + words[index + 1]
      index += 2
    end
    words = combined_words
    words << final_word if final_word
  end
  words.first
end

def each_slice(array, n)
  index = 0
  while index < array.size
    yield(array[index, n])
    index += n
  end
end

def reverse_and_combine_text(text)
  words = text.split
  while words.size > 1
    words.map!(&:reverse)
    combined_words = []
    words.each_slice(2) { |slice| combined_words << slice.join }
    words = combined_words
  end
  words.first
end

p reverse_and_combine_text("abc def") == "cbafed"
p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi"
p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"
p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12 44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf"

# 17:48

