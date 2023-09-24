# Longest alphabetical substring

=begin
Notes:

One approach would be to get every substring and
remove the non-alphabetical ones and then return the longest

A refinement:
try to find leading alphabetical substring
Once that fails, add what you have to an array
Move to trying to find alpha substring from index 1 onwards
etc

Problem:
input:
output:

  Write a method that takes a string and returns the longest
  alphabetical substring

rules:
  an alphabetical substring means that the substring is a sequence of characters
    where each successive character >= preceding character in alphabetical order
  the input will consist of lowercase characters (assume characters means letters from examples)
  the input will have at least one letter

Examples and test cases:

a s d
a s | d < s not >= s
s | d
d

a b c d e a p b c d e f
a b c d e 
b c d e - discard: not longer than existing maximum
c d e - discard
d e - discard
e - discard
a p - discard
p - discard
b c d e f - discard: not longer (only equal to) existing maximum

Data structures:

Algorithm:
Given a string, text
Set longest_substring := empty string
Iterate for 0 up to text size exclusive, start_index
  Set current_substring := text[start_index]
  Iterate for (start_index + 1) up to text size exclusive, current_index
    If text[current_index] >= last letter in current_substring
      Append text[current_index] to current_substring
    Else
      If size of current_substring > size of longest_substring
        longest_substring = current_substring
        break from iteration (inner loop)
      Else
        break from iteration (inner loop)
  If size of current_substring > size of longest substring
    longest_substring = current_substring
Return longest_substring
=end

def longest(text)
  longest_substring = ''
  current_substring = ''
  (0...text.size).each do |start_index|

    current_substring = text[start_index]
    
    (start_index + 1...text.size).each do |current_index|
      if text[current_index] >= current_substring[-1]
        current_substring << text[current_index]
      elsif current_substring.size > longest_substring.size
        longest_substring = current_substring
        break
      else
        break
      end
    end
    if current_substring.size > longest_substring.size
      longest_substring = current_substring
    end
  end
  longest_substring
end

# from codewars: REGEX solution
REGEX = ([*('a'..'z')].join('*') << '*').freeze

def longest(text)
  text.scan(/#{REGEX}/).max_by(&:size)
end

# from codewars: chars array, slice_when
def longest(text)
  text.chars.slice_when { |a, b| a > b }.max_by(&:size).join
end

# can even do
def longest(text)
  text.each_char.slice_when(&:>).max_by(&:size).join
end

def longest(text)
  all_alpha_substrings = text.each_char.slice_when(&:>)
  all_alpha_substrings.max_by(&:size).join
end

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') =='fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'

# 38:11 - bad algorithm, didn't consider that once you break from inner loop
# you have to check for current_substring size > longest_substring size
# before the next iteration of the outer loop starts
# Then when it didn't work, I thought I'd forgotten to check after 
# *both* loops had ceased iterating. But that was too late to check, since
# the longest alphabetic substring had already been lost
