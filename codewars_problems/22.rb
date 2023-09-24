# Scramblies

=begin
Notes:

Problem:
input: a string, str1, a string, str2
output: true or false

  Write a method that checks whether str2 can be formed
  from some or all of str1's characters, true if so, false otherwise

rules:
  only lowercase letters will be present in str1 and str2

Examples and test cases:

r k q o d l w

w o r l d

Data structures:

Algorithm:
Given a string, str1, and a string, str2
Set unique_chars := array containing only unique characters from str2
Iterate through each char in unique_chars
  if count of char in str1 >= count of char in str2
    next iteration
  else
    return false
Return true

=end

# below solutions have time complexity O(n^2) until stated otherwise

def scramble(str1, str2)
  unique_chars = str2.chars.uniq # minor optimization, not really necessary
  unique_chars.all? do |char|
    str1.count(char) >= str2.count(char)
  end
end

def scramble(str1, str2)
  # iterate through each char in str2 (the word)
    # if count of char in str1 >= count of char in str2
      # next iteration
    # else
      # return false
  # return true
  str2.each_char do |char|
    return false unless str1.count(char) >= str2.count(char)
  end
  true
end

def scramble(str1, str2)
=begin
iterate through each char in str2
  Set str1_size := size of str1
  attempt to destructively delete char from str1
  If size of str1 == str1_size
    return false
return true
=end
  str2.each_char do |char|
    str1_size_before = str1.size
    str1 = str1.sub(char, '')
    if str1.size == str1_size_before
      return false
    end
  end
  true
end

def scramble(str1, str2)
  str1 = str1.dup
  str2.each_char do |char|
    str1_size_before = str1.size
    first_occurence = str1.match(char)
    str1[first_occurence] = ''
    if str1_size_before == str1.size
      return false
    end
  end
  true
end

def scramble(str1, str2)
  str1 = str1.dup
  str2.chars.all? { |char| str1.sub!(char, '') }
end

=begin
For time complexity O(n)

Given a string, str1, representing tiles, and a string, str2, representing word
Set available_tiles := empty hash
Iterate through each char in str1
  if char exists as key in available_tiles
    available_tiles[char] = available_tiles[char] + 1
  else
    Create key-value pair in available_tiles, where key is char and value is 1
Iterate through each char in str2
  if char exists as key in available_tiles && available tiles[char] - 1 < 0
    available_tiles[char] = available_tiles[char] - 1
  else
    return false
return true
=end

def scramble(str1, str2)
  available_tiles = {}
  str1.each_char do |char|
    if available_tiles.key?(char)
      available_tiles[char] += 1
    else
      available_tiles[char] = 1
    end
  end

  str2.each_char do |char|
    if available_tiles.key?(char) && available_tiles[char] - 1 >= 0
      available_tiles[char] -= 1
    else
      return false
    end
  end
  true
end

def scramble(str1, str2)
  available_tiles = Hash.new(0)
  str1.each_char do |char|
    available_tiles[char] += 1
  end

  str2.chars.none? do |char|
    available_tiles[char] -= 1
    available_tiles[char].negative?
  end
end

p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true

# 27:32
