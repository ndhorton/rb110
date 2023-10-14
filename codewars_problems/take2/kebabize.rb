# Kebabize

=begin

Notes:

so the first word can optionally be capitalized

approach:
purge non-letter characters1
split on capital letters but include them in the following string
- something like slice_when or chunk_while
convert every resulting string to lowercase
concatenate around '-'

Problem:
input: a string
output: a new string

  Write a method that takes a string in lower camelCase
  and returns a new string in kebab-case.

rules:
  CAMEL -> c-a-m-e-l
  the return string should contain only lowercase letters and hyphens
  this means removing non-letter characters from input
  the first word can optionally be capitalized even though
    it is normally all-lowercase

Examples / test cases:

c a m e l s
H a v e
T h r e e
H u m p s

C
A
M
E
L

Data Structures:

Algorithm:
Given a string, str
Set characters := split str into an array of character-strings
characters = select only letter characters from characters
Iterate through pairs of characters splitting into subarrays wherever
  the second character is an uppercase letter
Transform this array of arrays so that each subarray of character-strings is joined
  to a single string
  then convert each string to all-lowercase
Join each resulting string around a '-' character
Return the resulting string
=end

# slice_when
=begin
Given an array, list
If list size < 1
  Return a new array

Set result := empty array
Set buffer := array containing first element from list
Iterate for index 1 upto list size exclusive
  If anonymous_function(list[index - 1], list[index]))
    Push buffer to result
    buffer = array containing list[index]
  Else
    Push list[index] to buffer
Push buffer to result

Return result
=end
def slice_when(list)
  return [] if list.empty?

  result = []
  buffer = [ list.first ]
  (1...list.size).each do |index|
    if yield(list[index - 1], list[index])
      result << buffer
      buffer = [ list[index] ]
    else
      buffer << list[index]
    end
  end
  result << buffer

  result
end

# chunk_while
def chunk_while(list)
  return [] if list.empty?

  result = []
  buffer = [ list.first ]
  (1...list.size).each do |index|
    if yield(list[index - 1], list[index])
      buffer << list[index]
    else
      result << buffer
      buffer = [ list[index] ]
    end
  end
  result << buffer

  result
end

def chunk(list)
  chunks = {}
  list.each do |element|
    function_result = yield(element)
    if chunks.key?(function_result)
      chunks[function_result] << element
    else
      chunks[function_result] = [ element ]
    end
  end
  chunks.to_a
end

list = (0..10)
p chunk(list) { |i| (i / 3).floor }
p list.chunk  { |i| (i / 3).floor }.to_a

def kebabize(str)
  characters = str.chars.select { |char| char =~ /[a-zA-Z]/ }
  words = characters.slice_when { |a, b| b =~ /[A-Z]/ }
  words = words.map { |word| word.join.downcase }
  words.join('-')
end

p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'

# 18:44
