# Reverse or Rotate?

=begin
Reverse or rotate?
The input is a string str of digits. Cut the string into chunks (a chunk here is a substring of the initial string) of size sz
(ignore the last chunk if its size is less than sz).
If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2, reverse that chunk; otherwise
rotate it to the left by one position. Put together these modified chunks and return the result as a string.
If
sz is <= 0 or if str is empty return ""
sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "".
Examples:
revrot("123456987654", 6) --> "234561876549"
revrot("123456987653", 6) --> "234561356789"
revrot("66443875", 4) --> "44668753"
revrot("66443875", 8) --> "64438756"
revrot("664438769", 8) --> "67834466"
revrot("123456779", 8) --> "23456771"
revrot("", 8) --> ""
revrot("123456779", 0) --> ""
revrot("563000655734469485", 4) --> "0365065073456944"
=end

=begin

Notes:

Problem:
input: a string and an integer
output: a new string

Write a method that takes a string, str, and an intger sz and
  breaks str into substrings of size sz, discarding any excess characters that won't form a chunk of size sz
  for each chunk
    if the sum of the cubes of the digits is even
      reverse the chunk
    else
      rotate the digits of the chunk by 1 to the left
Join the chunks to a single string

rules:
  if sz < 1 or str size is < sz then return an empty string
  assume return a new string

Examples / test cases:

7 3 3 0 4   9 9 1 0 8   7 2 8 1 5   ---7 6 4
3 3 0 4 7   9 1 0 8 9   2 8 1 5 7

4466

Data Structures:

Algorithm:
Given a string, str, and an integer, sz
If sz < 1 || size of str < sz
  Return new empty string
Set chunks := using regex, match array of substrings of exactly sz characters in length
Set processed_chunks := empty array
Iterate over each chunk in chunks
  Set cube_sum := 0
  Iterate through each char in chunks
    Convert char to integer
    Raise to the third power
    cube_sum = cube_sum + cubed integer
  If cubed_sum is even
    Reverse chunk
    Push reversed chunk to processed_chunks
  Else
    Convert chunk to array of characters
    Rotate array
    Concatenate characters to a single string
    Push string to processed_chunks
Concatenate processed_chunks to a single string
Return that string
=end

def revrot(str, sz)
  chunks = str.scan(/[0-9]{#{sz}}/)
  processed_chunks = chunks.map do |chunk|
    cube_sum = chunk.chars.sum(0) { |char| char.to_i ** 3 }
    if cube_sum.even?
      chunk.reverse
    else
      chunk.chars.rotate.join
    end
  end
  processed_chunks.join
end

def slice_chunks(str, sz)
  return [] if sz < 1

  chunks = []
  buffer = ''
  counter = 0
  str.each_char do |char|
    if counter == sz
      chunks << buffer
      buffer = char
      counter = 1
    else
      buffer << char
      counter += 1
    end
  end
  chunks << buffer if buffer.size == sz

  chunks
end

def slice_chunks(str, sz)
  return [] if sz < 1
  str.chars.each_slice(sz).filter_map { |chunk| chunk.join if chunk.size == sz }
end

def revrot(str, sz)
  chunks = slice_chunks(str, sz)
  processed_chunks = chunks.map do |chunk|
    cube_sum = chunk.chars.sum(0) { |char| char.to_i ** 3 }
    if cube_sum.even?
      chunk.reverse
    else
      chunk.chars.rotate.join
    end
  end
  processed_chunks.join
end


p revrot("1234", 0) == ""
p revrot("", 0) == ""
p revrot("1234", 5) == ""
p revrot("733049910872815764", 5) == "330479108928157"
p revrot("123456987654", 6) == "234561876549"
p revrot("123456987653", 6) == "234561356789"
p revrot("66443875", 4) == "44668753"
p revrot("66443875", 8) == "64438756"
p revrot("664438769", 8) == "67834466"
p revrot("123456779", 8) == "23456771"
p revrot("", 8) == ""
p revrot("123456779", 0) == ""
p revrot("563000655734469485", 4) == "0365065073456944"

# 19:29
