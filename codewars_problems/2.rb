# Find all Pairs

=begin

Notes:

You could take the uniq values and count them in a tally
any odd value will have the +1 removed by ineger division by 2
any unitary value will be zeroed by division by 2
So as you count, divide by 2 and that should give the numeber of pairs
Then you could add that to a running count of total pairs so
you need only iterate once over the uniq values and `count` is an
efficient method

To get an empty array or an array with no pairs to return zero
you simply need to initialize the total count variable,
uniq returns an empty array, using an iterator it will simply
skip the logic and you can return the total count variable still at 0

questions:

Problem:
input:
output:

  Given an array of integers, return the count of all pairs

rules:
  a pair is the occurence of the same number twice
  if array is empty or contains only one value, must return 0
  there can be more than one pair of the same number

Examples:

[1, 2, 3, 4]
1
1 / 2 intdiv = 0
pairs += 0

DS:

Algorithm:

Given an array of integers, array
Set pairs_count := 0
Set numbers := only the unique values from array
# If numbers.size == array.size
#   Return pairs_count
Iterate over each number in numbers
  Set current_number_count := count the occurrences of number in array
  pairs_count += current_number_count / 2 [integer division]
Return pairs_count

=end

def pairs(array)
  pairs_count = 0
  numbers = array.uniq
  numbers.each do |number|
    current_number_count = array.count(number)
    pairs_count += current_number_count / 2
  end
  pairs_count
end

# after refactoring
def pairs(array)
  array.uniq.reduce(0) do |accumulator, unique_number|
    current_number_count = array.count(unique_number)
    accumulator + current_number_count / 2
  end
end

p(pairs([1, 2, 5, 6, 5, 2]) == 2)
p(pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4)
p(pairs([0, 0, 0, 0, 0, 0, 0]) == 3 )
p(pairs([1000, 1000]) == 1)
p(pairs([]) == 0)
p(pairs([54]) == 0)

# 21:00 - included spending ages trying to find the module for the codewars assert
#         method, see about finding it for next time
