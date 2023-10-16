# Decipher this!

=begin
You are given a secret message you need to decipher. Here are the things you need to know to decipher it:
For each word:
the second and the last letter is switched (e.g. Hello becomes Holle)
the first letter is replaced by its character code (e.g. H becomes 72)
Note: there are no special characters used, only letters and spaces
Examples
decipherThis('72olle 103doo 100ya'); // 'Hello good day'
decipherThis('82yade 115te 103o'); // 'Ready set go'
=end
=begin

Notes:

Problem:
input:
output:

Write a method that takes a string,
splits it into words
for each word,
  1) Convert the number at the start of the word
    to the ascii char it represents
  2) Switch second char with last char
Join back into a sentence

rules:
input strings will only have letters and spaces
assume all spaces will be singular

Examples / test cases:

'65'
-> 65
65 -> 'A'
is size of string bigger than 2? no
Return 'A'

'119esi'
-> 119
119 -> 'w'
['1', '1', '9', 'e', 's', 'i']
drop while char =~ /[0-9]/, join
'esi'
prepend 'w'
'wesi'
is bigger than 2? yes
'wise'
Return 'wise'

Data Structures:

Algorithm:
Given a string, message
Set words := split message on whitespace to array of char-strings
Set decrypted_words := empty array
Iterate through each word in words
  Set number := convert word to integer
  Set first_char := convert number to ascii char
  word = remove leading digits from word
  Prepend first_char to word
  If size of word > 2
    Swap second char in word with last
  Append word to decrypted words
Concatenate all decrypted_words to single string
  with space separator
Return that string
=end

def decipher_this(message)
  words = message.split
  decrypted_words = words.map do |word|
    first_char = word.to_i.chr
    word = word.chars.drop_while { |char| char =~ /[0-9]/ }.join
    word.prepend(first_char)
    if word.size > 2
      word[1], word[-1] = word[-1], word[1]
    end
    word
  end
  decrypted_words.join(' ')
end

p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"

# 17:23
