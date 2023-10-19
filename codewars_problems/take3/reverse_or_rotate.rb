# Reverse or rotate

=begin
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

could do a test at the start for the "" conditions
and then use each_slice (which can't take a non-positive
argument)

Problem:
input: a string and an integer
output: a new string

Write a method that takes a string of digits, str, and
an integer, sz, and
1) chops the string into chunks of size sz, discarding
   a final chunk of less than sz size
2) if the sum of the cubes of the digits in a chunk is
   even, then reverse the chunk
else, rotate the chunk by 1 to the left

rules:
  if sz <= 0 or sz > the size of str or str is empty
    return an empty string
  assume return a new string

Examples / test cases:

123456 987654

123456

Data Structures:

Algorithm:
subprocess pieces
Given a string, string, and an integer, slice_size
If string is empty or
   string size < slice_size or
   slice_size < 1
  Return empty array
Set buffer := first character in string
Set counter := 1
Set slices := empty array
Iterate for index from 1 upto string size exclusive
  if counter == slice_size
    Push buffer to slices
    buffer = string[index]
    counter = 1
  else
    Append string[index] to buffer
    counter = counter + 1
  index = index + 1
If buffer size == slice_size
  Push buffer to slices
Return slices

subprocess revrot
Given a string, str, and an integer sz
Set chunks := slice str into array of chunks of exactly sz size, discarding smaller chunk if any
Set processed_chunks = empty array
Iterate over each chunk in chunks
  Set cube_sum = 0
  Iterate through each char in chunk
    Convert char to integer
    Cube integer
    cube_sum = cube_sum + cubed integer
  If cube_sum is even
    Reverse chunk
    Append chunk to processed_chunks
  Else
    Split chunk into array of characters
    Rotate array by 1 to the left
    Concatenate array elements to single string
    Append string to processed_chunks
Concatenate processed_chunks to a single string
Return that string
=end

def pieces(string, slice_size)
  if slice_size < 1 || string.size < slice_size
    return []
  end

  buffer = string[0]
  slices = []
  counter = 1
  (1...string.size).each do |index|
    if counter == slice_size
      slices << buffer
      buffer = string[index]
      counter = 1
    else
      buffer << string[index]
      counter += 1
    end
  end
  slices << buffer if buffer.size == slice_size
  slices
end

def revrot(str, sz)
  # if sz > str.size || sz <= 0 || str.empty?
  #   return ""
  # end

  # chunks = str.chars.each_slice(sz).filter_map do |chunk|
  #   chunk.join if chunk.size == sz
  # end

  chunks = pieces(str, sz)

  chunks.map! do |chunk|
    cube_sum = chunk.chars.map { |digit| digit.to_i ** 3}.sum
    if cube_sum.even?
      chunk.reverse
    else
      chunk.chars.rotate.join
    end
  end
  chunks.join
end

# another way with no checks - this is the best way for this problem
def revrot(str, sz)
  chunks = str.scan(/[0-9]{#{sz}}/).map do |chunk|
    cube_sum = chunk.chars.sum(0) { |char| char.to_i ** 3 }
    cube_sum.even? ? chunk.reverse : chunk.chars.rotate.join
  end
  chunks.join
end
=begin
So Algorithm:
Set chunks := Using regex, scan string for matches of any character * exactly sz size
Transform each chunk in chunks
  Set cube_sum := 0
  Split chunk into characters, iterate over each char in characters
    Convert char to integer
    Cube integer
    cube_sum = cube_sum + cubed integer
  If cube_sum is even
    Reverse chunk
  Else
    Split chunk into array of characters
    Rotate array of characters
    Join rotated array of characters to a single string
Join chunks to a single string
Return that string
=end


def revrot(str, sz)
  if sz < 1 || str.size < sz
    return ""
  end

  chunks = str.chars.each_slice(sz).filter_map do |chunk|
    if chunk.size == sz
      cube_sum = chunk.sum(0) { |char| char.to_i ** 3 }
      if cube_sum.even?
        chunk.join.reverse
      else
        chunk.rotate.join
      end
    end
  end

  chunks.join
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

# 42:30
