# Reversing and Combining Text

=begin
Notes:

Problem:
input:
output:

  Write a method that takes an input string and then
  Splits the string into words (whitespace separator)
1) If there is more than one word
    Reverse every word
    Concatenate even-indexed words with following word (if there is one)
  Repeat 1) until there is only one word
  Return word

rules:
  do i need to check input? no

Examples and test cases:

abc def ghi jkl
cbafed ihglkj
defabcjklghi

Data structures:

Algorithm:
Given a string, text
Split text into array of sub-strings on whitespace, words
Iterate while size of words > 1
  Reverse every word
  Set temp := empty array
  Iterate step 2 for 0 upto size of words - 1 exclusive, index
    If index + 1 is a valid index
      concatenate words[index] with words[index + 1]
      push resulting string to temp
    Else
      push words[index] to temp
  words = temp
Return first element in words
=end

def reverse_and_combine_text(text)
  words = text.split
  while words.size > 1
    words.map!(&:reverse)
    temp = []
    0.step(words.size - 1, 2) do |index|
      if index + 1 < words.size
        temp << words[index] + words[index + 1]
      else
        temp << words[index]
      end
    end
    words = temp
  end
  words.first
end

p reverse_and_combine_text("abc def") == "cbafed"
p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi"
p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"
p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12 44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf"

# 19:24 - had to spend ages debugging to realize Integer#step :to is an exclusive upper bound
#         this was after not accounting for having to step by 2 in the first place
#         probably should have used a loop and counter += 2
