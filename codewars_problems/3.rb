# Return substring instance count

=begin

Notes:

questions:
  Is the search case-sensitive? The examples suggest only
    lowercase strings will be given
  What to do if search_text is greater in size than full_text?
  I SHOULD HAVE ASKED - what to do if either text is empty?
  Certain ways of solving this will give strange answers for
  an empty search_text string because of fenceposting stuff
  (that Djikstra paper etc)
  And my actual solution crashes if the search_text is empty
Problem:
input: two strings, full_text, search_text
output: integer representing number of times search_text appears in full_text

  Write a method such that it returns the number of times
  a search substring appears in a full text string

rules:
  assume case-sensitive
  
Examples:

DS:

Algorithm:
Given two strings, full_text and search_text
Convert full_text to array of character strings
Set counter := 0
Iterate through each consecutive subarray of size of search_text
  join current subarray
  if joined string is equal to search_text
    increment counter
Return counter

=end

# Passes all tests on Codewars but throws exception if
# search_text is empty because 0 is not a valid arguement to
# each_cons 
def solution(full_text, search_text)
  counter = 0
  full_text.chars.each_cons(search_text.size) do |subarray|
    counter += 1 if subarray.join == search_text
  end
  counter
end

def solution(full_text, search_text)
  full_text.scan(search_text).size
end

def solution(full_text, search_text)
  (0..full_text.size - search_text.size).count do |start_index|
    full_text.slice(start_index, search_text.size) == search_text
  end
end


p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1
p solution('abcd', '')
# 13:54