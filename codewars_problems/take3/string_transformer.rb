# String Transformer

=begin
Given a string, return a new string that has transformed based on the input:
Change case of every character, ie. lower case to upper case, upper case to lower case.
Reverse the order of words from the input.
Note: You will have to handle multiple spaces, and leading/trailing spaces.
For example:
"Example Input" ==> "iNPUT eXAMPLE"
You may assume the input only contain English alphabet and spaces.
=end

=begin

Notes:

one approach:
regex to get chunks of spaces or chunks of letters
/\s+|\S+/

buffer = first char
iterate through remaining chars
  if current char is a letter and buffer last char is a letter OR
     current char is a space and buffer last char is a space
    Append current char to buffer
  Else
    Append buffer to tokens array
    buffer = current char
Append buffer to tokens array

Problem:
input: a string
output: a new string

Write a method that takes a string and
Swaps the case of every letter
Reverses the order of words while preserving
the order of quantities of spaces between words

rules:
  assume return a new string
  must preserve quantities of spaces between words
  assume input string will only consist of letters and spaces

Examples / test cases:

[ ' ', word, ' ', word, ' ', word, ' ' ]
   0   1      2    3     4    5     6

[1, 3, 5 7]

midpoint = 4 / 2 = 2

count up to not including midpoint
count down

Data Structures:

need an array for indexes containing words

Algorithm:
Given a string, string
Swap the case of every letter in string
Set tokens := Convert string into an array of substrings where the spaces between words are chunks and the words are chunks
Set indexes := empty array
Iterate over each token in tokens with an index
  If token contains letters
    Append index to indexes
Set midpoint := size of indexes / 2 (intdiv)
Set upcount := 0
Set downcount := size of indexes - 1
Iterate while upcount < mipoint
  Swap tokens[indexes[upcount]] with tokens[indexes[downcount]]
  Increment upcount
  Decrement downcount
Concatenate all tokens to a single string
Return that string
=end

# What I thought they meant and wrote the algorithm for
def string_transformer(string)
  string = string.swapcase
  tokens = string.scan(/\s+|\S+/)
  indexes = tokens.filter_map.with_index do |token, index|
    index if token =~ /[a-zA-Z]/
  end
  midpoint = indexes.size / 2
  upcount = 0
  downcount = indexes.size - 1
  while upcount < midpoint
    tokens[indexes[upcount]], tokens[indexes[downcount]] =
        tokens[indexes[downcount]], tokens[indexes[upcount]]
    upcount += 1
    downcount -= 1
  end
  tokens.join
end

# # What they actually meant
# def string_transformer(string)
#   string = string.swapcase
#   tokens = string.scan(/\s+|\S+/)
#   tokens.reverse!
#   tokens.join
# end

# Basically I solved a harder problem than the one they asked for
# but imo they simply aren't clear about what they want so don't do it again
# In real life you could ask questions rather than puzzling it out from failed
# tests that lack the input context

p string_transformer('Example string') == 'STRING eXAMPLE'
p string_transformer(' another   Example  STRING   ') == ' string   eXAMPLE  ANOTHER   '
p string_transformer("You Know  When  THAT Hotline Bling") == "bLING hOTLINE  that  wHEN kNOW yOU"
# 21:03
