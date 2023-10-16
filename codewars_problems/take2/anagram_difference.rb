# Anagram Difference

=begin

lost my notes in Gather

Algorithm:
Given two strings, w1, w2
Set w1_counts := new hash
Iterate through each char in w1
  If char is a key in w1_counts
    w1_counts[char] = w1_counts[char] + 1
  Else
    Set w1_counts[char] := 1
Set w2_counts := new hash
Iterate through each char in w2
  If char is a key in w2_counts
    w2_counts[char] = w2_counts[char] + 1
  Else
    Set w2_counts[char] = 1

Set sum := 0
Iterate through every lowercase char from 'a' to 'z'
  If char is a key in w1_counts AND char is a key in w2_counts
    sum = sum + absolute value of (w1_counts[char] - w2_counts[char])
  Else if char is a key in w1_counts
    sum = sum + w1_counts[char]
  Else if char is a key in w2_counts
    sum = sum + w2_counts[char]
Return sum

Approach 2:
c *o *d e *w a r *s        remove 4
*h a c *k e r *r *a *n *k  remove 6
remove 10 total

Goal: 
1) count all chars in w1 as increments within a common hash
2) count all chars in w2 as decrements within a common hash
common letters will cancel to 0, then extra or extraneous letters in either word
will be expressed as a difference negatively or positively depending on which word
3) sum the absolute values of the hash values 

Iterate through each char in w1 adding 1 to counts[char]
{
  c => 1,
  o => 1,
  d => 1,
  e => 1,
  w => 1,
  a => 1,
  r => 1,
  s => 1
}

Iterate through each char in w2 subtracting 1 from counts[char]
{
  c => 0,
  o => 1
  d => 1,
  e => 0,
  w => 1,
  a => -1,
  r => -1,
  s => 1,
  h => 1,
  n => -1,
  k => -2,
}
Sum 1 + 1 + 1 + |-1| + |-1| + 1 + 1 + |-1| + |-2| = 9

Algorithm 2:
Given two strings, w1 and w2
Set counts := an empty hash

Iterate through each character in w1
  If character is a key in counts
    Incremenet counts[character]
  Else
    Set counts[character] = 1

Iterate through each characer in w2
  If character is a key in counts
    Decrement counts[character]
  Else
    Set counts[character] = -1

Set sum := 0
Iterate through each count in counts hash value-part
  sum = sum + absolute value of value
Return sum
=end

# Approach 1
def anagram_difference(w1, w2)
  w1_counts = Hash.new(0)
  w1.each_char { |char| w1_counts[char] += 1 }
  w2_counts = Hash.new(0)
  w2.each_char { |char| w2_counts[char] += 1 }

  ('a'..'z').sum(0) { |char| (w1_counts[char] - w2_counts[char]).abs }
end

# Approach 2
def anagram_difference(w1, w2)
  counts = Hash.new(0)
  w1.each_char { |char| counts[char] += 1 }
  w2.each_char { |char| counts[char] -= 1 }
  counts.values.reduce(0) { |acc, count| acc + count.abs }
end

# Approach 2 essentially memoizes this more basic polynomial time version
# This is obviously easier to come up with in the first place
def anagram_difference(w1, w2)
  ('a'..'z').reduce(0) do |sum, char|
    sum + (w1.count(char) - w2.count(char)),abs
  end
end

p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10