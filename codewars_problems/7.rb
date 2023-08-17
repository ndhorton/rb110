# Substring fun

=begin
Notes:

Problem:
input: an array containing 0 or more strings
output: a string

  Write a method that takes the char at the index within a string that
  is also the index of the string within the array of strings and
  concatenates them into a word, which should be the return value

rules:
  test cases contain only valid input:
    an array of strings
    an empty array
  each string will have sufficient chars
  n is the index of the string in the array
  an empty array should return an empty string

Examples and test cases:

yoda - index 0
y - index 0
best - 1
e - 1
has - 2
s - 2
y + e + s = yes

Data structures:

Algorithm:
Given an array of strings, words
Set result := empty string
Set index := 0
Iterate while index < size of words
  Set word := words[index]
  Set char := char[index]
  Append char to result
  index = index + 1
Return result

=end

def nth_char(words)
  result = ''
  words.each_index do |index|
  result << words[index][index]
  end
  result
end

def nth_char(words)
  result = ''
  words.each_with_index do |word, index|
    result << word[index]
  end
  result
end

def nth_char(words)
  words.each_with_object('').with_index do |(word, result), index|
    result << word[index]
  end
end

# codewars solutions
def nth_char(words)
  words.map.with_index { |word, index| word[index] }.join
end

p (nth_char(['yoda', 'best', 'has'])) == ('yes')
p (nth_char([])) == ('')
p (nth_char(['X-ray'])) == ('X')
p (nth_char(['No','No'])) == ('No')
p (nth_char(['Chad','Morocco','India','Algeria','Botswana','Bahamas','Ecuador','Micronesia'])) == ('Codewars')

# 9:00
