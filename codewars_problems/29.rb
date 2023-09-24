# Split Strings

=begin
Notes:

One approach: to iterate over each character with index
when index is odd
  push buffer to result array
Could be done while each_char.with_index.slice_when 

Problem:
input: a string, string
output: an array containing string, pairs of characters

  Write a method that takes a string and returns an array
  containing strings, each of which is a consecutive pair of characters
  from the argument string. If the size of the argument string is odd,
  the final 'pair' should be padded with a trailing '_'

rules:
  odd-sized string final pair should be padded with trailing '_'
  an empty string should return an empty array

Examples and test cases:

'abc'
buffer = ''
'a' << a
'ab' << b, buffer size is 2, push to result, set buffer to ''
'c' << c
After iteration, if buffer not empty, append '_', push buffer to result

Data structures:

Algorithm:
Given a string, string

Set result := an empty array
Set buffer := ''

Iterate over each char in string
  Append char to buffer

  if buffer size == 2
    append buffer to result
    buffer = empty string

If buffer size == 1
  append '_' to buffer
  append buffer to result
Return result
=end

def solution(string)
  result = []
  buffer = ''

  string.each_char do |char|
    buffer << char
    if buffer.size == 2
      result << buffer
      buffer = ''
    end
  end

  if buffer.size == 1
    buffer << '_'
    result << buffer
  end

  result
end

def solution(string)
  result = string.scan(/.{1,2}/)
  if result.last && result.last.size == 1
    result.last << '_'
  end
  result
end

p solution('abc') == ['ab', 'c_']
p solution('abcdef') == ['ab', 'cd', 'ef']
p solution("abcdef") == ["ab", "cd", "ef"]
p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
p solution("") == []

# 17:08 - bad algorithm, I didn't check for even string sizes and the logic for the
# buffer suffered and required patching, and then refactoring to get a neat solution
