# Repeated Substring

=begin
Notes:
question: does the output need to be a new string?



Problem:
input: a non-empty string of lowercase Latin letters
output: an array whose first element is a new substring of input string and
whose second element as an integer

  Write a method that takes a non-empty string of lowercase letters
  and returns the shortest substring that can be multiplied by an integer
  to produce the input string and that integer wrapped in an array.

rules:
  do not need to test input, it will be a non-empty string with only
    lowercase letters
  the worst case will be the entire string and the number 1

Examples and test cases:

let s = "ababab"
["ab", 3] 
"ab" * 3 == s

s = 'abcde'
["abcde", 1]

a b a b a b - size 6
0 1 2 3 4 5

substring of 1 char * size of string == string ?
substring of 2 chars * size of string / 2 == string ?
" "          3                          3
" "          4                          4 == string ? not possible can't
                                              divide 6 by 4

Data structures:

Algorithm:

Given a string, s
Iterate from 1 through size of s, slice_size
  If size of string not divisble by slice_size
    next iteration
  Iterate 0 upto size of s - slice_size, start_index
    Set substring := slice slice_size characters from s starting at index start_index
    If substring * (size of s / slice_size) == s
      Return Array{ substring, size of s / slice_size}
=end

def f(s)
  (1..s.size).each do |slice_size|
    next unless s.size % slice_size == 0
    repeats = s.size / slice_size

    (0..(s.size - slice_size)).each do |start_index| # this second iteration
        # is unnecessary because for the substring to tile the whole string
        # it needs to be the first slice_size letters
      substring = s.slice(start_index, slice_size)
      if substring * repeats == s
        return [substring, repeats]
      end
    end
  end
end

# Better
def f(s)
  (1..s.size).each do |slice_size|
    repeats, remainder = s.size.divmod(slice_size)
    next unless remainder.zero?
    substring = s.slice(0, slice_size)
    return [substring, repeats] if substring * repeats == s
  end
end

p (f("ababab") == ["ab", 3])
p (f("abcde") == ["abcde", 1])

# 22:52
