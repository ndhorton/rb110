# Common Chars - LS video 1

=begin



Notes:

Problem:
input: an array of strings
output: a new array of new strings (assume)

Write a method that takes an array of strings and returns an array of the characters
(with correct multiplicities) that are common to all the input strings.

rules:
  inputs strings will only contain lowercase letters
  assume array will not be empty? yes
  assume array will contain at least 2 words? yes

Examples / test cases:

bella label roller

b e l l a - the only letters to be common to all would be in one

b => 1
e => 1
l => 2
a => 1

[label roller]
for each remaining string
  for each key in hash
    set char_count := count occurrences of this key in this string
      hash[key] = (char_count < hash[key]) ? char_count : hash[key]

Data Structures:

hash to store the first string's characters with their counts

Algorithm:
Given an array of strings, strings
Set first_word := first element of strings
Set remaining_words := remaining elements of strings
Set counts := empty hash
Iterate through each char in first_word
  If char is a key in counts
   counts[char] = counts[char] + 1
  Else
   Set counts[char] := 1
Iterate through each string in remaining strings
  Iterate through each char_key in counts
    Set current_count := count occurrences of char_key in string
    counts[char_key] = the minimum of current_count and counts[char_key]
Set result := empty array
Iterate through each char, count pair in counts
  Iterate counts times
    Append copy of char to result
Return result
=end

def common_chars(words)
  first_word = words.first
  remaining_words = words[1..-1]
  counts = Hash.new(0)
  first_word.each_char { |char| counts[char] += 1 }

  remaining_words.each do |word|
    counts.each_key do |char|
      current_count = word.count(char)
      counts[char] =
          (current_count < counts[char]) ? current_count : counts[char]
    end
  end

  result = []
  counts.each_pair do |char, count|
    count.times { |_| result << char.dup }
  end
  result
end

# The solution arrived at in the video is simpler
def common_chars(words)
  words = words.map { |word| word.dup }
  characters = words.shift.chars

  characters.select do |char|
    words.all? { |word| word.sub!(char, '') }
  end
end

arr = ["bella", "label", "roller"]

p common_chars(arr) == ["e", "l", "l"]
p arr
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []

# 20:47
