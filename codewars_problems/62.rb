# Who Likes It?

=begin
Notes:

Problem:
input: an array of strings
output: a string

  Write a method that takes an array containing 0 or more strings
  and formats them according to the rules given.

rules:
  array size 0 -> "no one likes this"
             1 -> "[name] likes this"
             2 -> "[name1] and [name2] like this"
             3 -> "[name1], [name2] and [name3] like this"
             4..n -> "[name1], [name2], and [n - 2] others like this"

Examples and test cases:

Data structures:

Algorithm:
Given an array, names
If size of names == 0
  Return "no one likes this"
Else if size of names == 1
  Return first element of names + " likes this"
Else if size of names == 2
  Return "{names[0]} and {names[1]} like this"
Else if size of names == 3
  Return "{names[0]}, {names[1]} and {names[2]} like this"
Else
  Set first := names[0]
  Set second := names[1]
  Set remaining := size of names - 2
  Return "{first}, {second} and {remaining} others like this"
=end

def likes(names)
  case names.size
  when 0
    "no one likes this"
  when 1
    "#{names.first} likes this"
  when 2
    "#{names[0]} and #{names[1]} like this"
  when 3
    "#{names[0]}, #{names[1]} and #{names[2]} like this"
  else
    "#{names[0]}, #{names[1]} and #{names.size - 2} others like this"
  end
end

p likes([]) == ('no one likes this')
p likes(['Peter']) == ('Peter likes this')
p likes(['Jacob', 'Alex']) == ('Jacob and Alex like this')
p likes(['Max', 'John', 'Mark']) == ('Max, John and Mark like this')
p likes(['Alex', 'Jacob', 'Mark', 'Max']) == ('Alex, Jacob and 2 others like this')

# 12:34
