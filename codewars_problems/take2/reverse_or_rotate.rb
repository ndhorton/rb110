# Reverse or Rotate

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

Write a method that takes a string of digits and
an integer sz.
1) Cut the string into chunks where
each chunk has sz characters; if the final chunk
is smaller than sz, discard it.
2)
  a) If the sum of the digits in the substring chunk, each
     cubed before addition, is even => reverse the chunk
  b) otherwise, rotate chunk left by 1 digit
3) Join chunks to a single string and return


rules:
  if sz == 0 OR string is empty, return new empty string
  if sz > size of string, return new empty string

Examples / test cases:

123456 987654
1 + 8 + 27 + 64 + 125 + 216

cube of odd is odd, cube of even is even

Data Structures:

Algorithm:
Given a string, str, and an integer sz
Set chunks := empty array
Set buffer := empty string
Iterate through each char in str
  If buffer size < sz
    Append char to buffer
  Else
    Append buffer to chunks
    buffer = char
If buffer size == sz
  Append buffer to chunks
Set processed_chunks := empty array
Iterate throuh each chunk in chunks
  Set digits := convert chunk string digits to array of integer digits
  Set cube_sum := sum the cubes of each digit in digits
  If cube_sum is even
    Reverse chunk
  Else
    Rotate chunk 1 to the left
  Append chunk to processed_chunks
Concatenate all chunks to a single string
Return string
=end

def revrot(str, sz)
  # return "" if sz <= 0

  # chunks = str.scan(/[0-9]{#{sz}}/)
  chunks = []
  buffer = ""
  characters = str.chars
  (0...characters.size).each do |index|
    if buffer.size < sz
      buffer << characters[index]
    elsif buffer.size == sz
      chunks << buffer
      buffer = characters[index]
    end
  end
  chunks << buffer if buffer.size == sz

  processed_chunks = chunks.map do |chunk|
    cube_sum = chunk.chars.sum(0) do |char|
      char.to_i ** 3
    end
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

# 27:26
