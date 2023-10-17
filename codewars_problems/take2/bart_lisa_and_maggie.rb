# Format a string of names like 'Bart, Lisa & Maggie'

=begin
Given: an array containing hashes of names
Return: a string formatted as a list of names separated by commas except for the last two names, which should be
separated by an ampersand.
Example:
list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ])
# returns 'Bart, Lisa & Maggie'
list([ {name: 'Bart'}, {name: 'Lisa'} ])
# returns 'Bart & Lisa'
list([ {name: 'Bart'} ])
# returns 'Bart'
list([])
# returns ''
Note: all the hashes are pre-validated and will only contain A-Z, a-z, '-' and '.'.
=end

=begin

Notes:

[{name:'string'}, {name:'string'} ...]
First transform array of hashes into array of strings


Problem:
input: an array of hashes
output: a string

Write a method that takes an array of hashes containing
  strings and returns a formatted string

rules:
if empty return empty string
1 name: simply return that name
2 names: join around ' & '
3 names or more: remove last element,
                 join remaining elements around ', '
                 append " & #{final_name}"


Examples / test cases:
Bart, Lisa
Bart, Lisa & Maggie

Data Structures:

Algorithm:
Given an array of hashes, name_data
Set names := an array containing only the string names from name_data
If size of names is 0
  Return empty string
Else if size of names is 1
  Return first element of names
Else if size of names is 2
  Return first element + ' & ' + last element
Else
  Set final_name := remove last element
  Set result := join names around ', '
  Append ' & ' + final_name to result
  Return result
end
=end


def list(name_data)
  names = name_data.map { |hash| hash[:name] }
  case names.size
  when 0
    ''
  when 1
    names.first
  when 2
    names.first + ' & ' + names.last
  else
    final_name = names.pop
    names.join(', ') + ' & ' + final_name
  end
end

p list([{name: 'Bart'},{name: 'Lisa'},{name: 'Maggie'},{name: 'Homer'},{name: 'Marge'}]) == 'Bart, Lisa, Maggie, Homer & Marge'
p list([{name: 'Bart'},{name: 'Lisa'}]) == 'Bart & Lisa'
p list([{name: 'Bart'}]) == 'Bart'

# 13:18
