# Stop gninnipS My sdroW!

=begin
Notes:
To mutate the string would mean building a second string and
then replacing the value of the input object which is easy
but probably not what is meant

Problem:
input: a string of one or more words
output: the same string mutated so that all words with five or more
  letters are reversed

rules:
  Does 'the same string' mean object identity? No
  string will contain only letters and spaces
  spaces will be included only when more than one word is present

Examples and test cases:

Do I need to account for the possibility of multiple spaces which
need to be preserved? Not according to examples given

Data structures:

Algorithm:
Given a string, text
Set words := split text on whitespace
Iterate through each word in words
  If word length is greater than or equal to 5
    Reverse word
Return words joined to a string aroung a single space
=end

def spinWords(text)
  words = text.split
  words.map! do |word|
    if word.length >= 5
      word.reverse
    else
      word
    end
  end
  words.join(' ')
end

p spinWords("Hey fellow warriors") == "Hey wollef sroirraw"
p spinWords("This is a test") == "This is a test"
p spinWords("This is another test") == "This is rehtona test"
p spinWords('test') == 'test'

# 7:09
