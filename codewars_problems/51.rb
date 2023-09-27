# Reverse or rotate?

=begin
Notes:

Problem:
input: a string, str and an integer, sz
output: a new string

  Write a method that takes a number in string form, str
  and an integer sz
  and then breaks the digits of str into chunks of size sz
  throwing away the final chunk if it is of size less than sz
  and then for each chunk
  if the sum of the cubes of each digit is even, reverse the chunk
  else rotate the chunk left by 1

rules:
  if sz <= 0 or if str is empty then return empty string
  if sz > length of str return empty string
  remove final chunk if its size is < sz
  assuming to return a new string

Examples and test cases:

1 + 8 + 27 + 64 + 125 + 216 = 441 not even
1 2 3 4 5 6
2 3 4 5 6 1

9 8 7 6 5 4


Data structures:

Algorithm:
Given a string, str, and an integer, sz
If sz <= 0 OR if str is empty string
  Return empty string
Set chunks := empty array
Set buffer := empty array
Iterate through each char in str
  Set number := convert char to integer
  If buffer size < sz
    Append number to buffer
  Else
    Append buffer to chunks
    Clear buffer
    Append number to buffer
If buffer size == sz
  Append buffer to chunks
Iterate through each chunk in chunks
  Set cube_sum := 0
  Iterate through each number in chunk
    cube_sum = cube_sum + (number^3)
  If cube_sum is even
    reverse chunk in place
  Else
    rotate chunk in place left by 1
Convert each element in each chunk to a string
Concatenate each string-digit in each chunk to a single string
Return resulting string
=end

def revrot(str, sz)
  return '' if sz <= 0 || str.empty?
  
  chunks = []
  buffer = []
  str.each_char do |char|
    number = char.to_i
    if buffer.size < sz
      buffer << number
    else
      chunks << buffer
      buffer = [number]
    end
  end
  chunks << buffer if buffer.size == sz


  chunks.map! do |chunk|
    cube_sum = chunk.reduce(0) { |acc, number| acc + (number ** 3) }
    cube_sum.even? ? chunk.reverse : chunk.rotate(1)
  end
  
  chunks.flatten!
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

# 25:43
