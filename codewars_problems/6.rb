# Non-even substrings

=begin
Notes:
could use s.chars.each_cons(number_of_chars from 1 to s.size)

Problem:
input: a string of decimal digits
output: integer count of substrings whose integer representation is odd

  Write a method that takes a string of decimal digits and
  returns the count of substrings representing odd numbers

rules:
  substrings must be consecutive
  examples do not suggest you need to account for empty strings or other chars

Examples and test cases:

1 3 5 7  = 4
13 35 57 = 3
135 357  = 2
1357     = 1
= 10

Data structures:

Algorithm:
Given a string of decimal chars, s
Set odd_count := 0
Iterate from 1 through size of s, reprenting substring_size
  Iterate over each substring of size substring_size
    If substring converted to an integer is odd
      increment odd_count
Return odd_count

=end

def solve(s)
  string_chars = s.chars
  odd_count = 0
  (1..s.size).each do |substring_size|
    string_chars.each_cons(substring_size) do |substring_chars|
      number = substring_chars.join.to_i
      odd_count += 1 if number.odd?
    end
  end
  odd_count
end

=begin
[start..end]
Slicing rather than `Enumerable#each_cons`
[start, num_of_chars]
needs a mechanism for slicing only up to:
  final index - 
r a d i u s
0 1 2 3 4 5
i,1 - constraint on i must be no greater than string size - 1
i,2 - constraint on i must be no greater than string size - 2
i,3 - "" no greater than string size - 3
i,4 - "" no greater than string size - 4
i,5 - "" string size - 5
i,6 - "" string size - string size

i...j exclusive range makes more sense i think
outer iterator from 1 through string size, substring_size, given as literals here
inner iterator from 0 through string size - substring_size, given as i
j represents the upper bound of the half-open slice interval
substring size = 1
i goes up from 0 to string size - 1; j = i + 1
size = 2
i upto string size - 2; j = i + 2
size = 3
i upto s s - 3; j = i + 3
size = 4
i upto string size - 4; j = i + 4
size = 5
i upto string size - 5; j = i + 5
size = 6
i upto string size - string size; j = i + string size

=end

# with slice [closed range] - probably most difficult to think about
def solve(s)
  odd_count = 0
  1.upto(s.size) do |offset|
    0.upto(s.size - offset) do |start_index|
      number = s[start_index..start_index + offset - 1].to_i
      odd_count += 1 if number.odd?
    end
  end
  odd_count
end

# with slice [half-open range] - less fiddly to think about
def solve(s)
  odd_count = 0
  1.upto(s.size) do |substring_bound|
    0.upto(s.size - substring_bound) do |start_index|
      number = s[start_index...start_index + substring_bound].to_i
      odd_count += 1 if number.odd?
    end
  end
  odd_count
end

# with slice [start,length] - probably easiest to think about
def solve(s)
  odd_count = 0
  1.upto(s.size) do |num_of_chars|
    0.upto(s.size - num_of_chars) do |start_index|
      number = s[start_index, num_of_chars].to_i
      odd_count += 1 if number.odd?
    end
  end
  odd_count
end

p(solve("1341") == 7)
p(solve("1357") == 10)
p(solve("13471") == 12)
p(solve("134721") == 13)
p(solve("1347231") == 20)
p(solve("13472315") == 28)