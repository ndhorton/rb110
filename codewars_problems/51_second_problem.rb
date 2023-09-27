# Decipher this!

=begin
Notes:

Problem:
input: a string
output: a new string

  Write a method that deciphers a string input according to the rules

rules:
  Each word:
    the second and last letter is switched
    first letter has been replaced by its ASCII code
  no special characters only letters and spaces
  assume return a new string

Examples and test cases:

Data structures:

Algorithm:
Given a string, message
Set words := split message into array of substrings split on whitespace
Set decoded_words := empty array
Iterate through each word in words
  Set first_letter := convert word to integer and convert integer to ascii char
  Delete all digits from word
  Prepend firs_letter
  Swap second and last letter (if second letter exists)
  Append word to decoded_words
Join each word in decoded words into a single string with a space separator
Return that string
=end

def decipher_this(message)
  words = message.split
  decoded_words = words.map do |word|
    first_letter = word.to_i.chr
    word.delete!('0-9')
    word = first_letter + word
    word[1], word[-1] = word[-1], word[1] if word[1]
    word
  end
  decoded_words.join(' ')
end

p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"

# 11:44 - probably should have worked through the examples more to discover that
# single-letter words needed to be accounted for vis-a-vis swapping second and last character
