# Format a string of names like 'Bart, Lisa & Maggie'

=begin
Notes:

if there are more than 2 names
  array[0..-2].join(', ') + ' & ' + array[-1]
if there are 2 names
  array.first + ' & ' + array.last
if there is one name
  array.first

Problem:
input: an array/nested data structure
output: a string

Write a method that takes an array of hashes, each of which hashes contains a single key-value pair
where the key is :name and the value is a name string.
Return a new string in which all names are listed in the order of the array of hashes from which the
names come, separated by ', ' except the last name which is separated by ' & '

rules:
  names must be of the format 'name1, name2, name3 & name4'
  names will only include A-Z, a-z, '-', and '.'
  therefore, must purge each name of '-' and '.' ?
  must work with empty input array

Examples and test cases:

Data structures:

Algorithm:

subprocess format_names
Given an array of strings, names
If size of names > 2
  Concatenate names from index 0 to the penultimate index with a ', ' separator
  Concatentate resulting string with ' & ' and with the final string in names
  Return string
If size of names == 2
  Concatenate names with ' & ' separator
  Return string
If size of names == 1
  Return first string in names

subprocess list
Given a nested data structure, names
Set only_names = empty array
Iterate through each hash in names
  Set string := hash[:name]
  string = remove all non-letter character from string
  Append string to only_names
Set result := format_names(only_names)
Return result
=end

LIST_SEPARATOR = ', '.freeze
FINAL_SEPARATOR = ' & '.freeze
EMPTY_STRING = ''.freeze

def format_names(names)
  case names.size
  when (3..)
    names[0..-2].join(LIST_SEPARATOR) + FINAL_SEPARATOR + names.last
  when 2
    names.join(FINAL_SEPARATOR)
  when 1
    names.first
  when 0
    EMPTY_STRING
  end
end

def list(names)
  only_names = names.map do |hash|
    name = hash[:name].chars.select { |char| char =~ /[a-zA-Z]/ }.join
    name
  end

  format_names(only_names)
end

p list([{name: 'Bart'},{name: 'Lisa'},{name: 'Maggie'},{name: 'Homer'},{name: 'Marge'}]) == 'Bart, Lisa, Maggie, Homer & Marge'
p list([{name: 'Bart'},{name: 'Lisa'}]) == 'Bart & Lisa'
p list([{name: 'Bart'}]) == 'Bart'

# 17:55 - had to change it because I missed that it had to work with an empty list
#         bad
