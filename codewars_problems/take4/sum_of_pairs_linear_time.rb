=begin
Notes:

Problem:
input: an array of numbers, and an integer
output: an array of two numbers, or nil

Write a method that takes an array and an integer, target_sum
and returns an array containing the two numbers from the array
that sum to target_sum where the second number has the lowest index possible
If there is no pair of numbers in the array that sum to target_sum, return nil

rules:
  numbers can be negative (question: does that include target?)
  numbers in array can be duplicates
  if there are more than 1 pair that add up to target_sum, return the pair
  whose second element is at the lowest index possible

Examples and test cases:

1 4 8 7 3 15  == 8

1 2 3 5 6 7 == 8

1 7 99 44 -100 3 == 8

 2
1
3
  1 2
5
  1 2 3
6
  1 2 3 5
7
  1<- (2 3 5 6
1
  search the rest
4
  search the rest (but not 1, we already checked for a match with 1)
8 
  search the rest (7 onwards)
7
  search the rest (etc)

1 7 == 8 add [1, 7] to an array at the end, min by second element
  4 8 7


Data structures:

array to store pairs

Algorithm:
Given an array, numbers and an integer, target_sum
Set pairs_and_index := empty array
Iterate over each first_number in numbers with index, first_index
  Iterate over each second_number in numbers with index, second_index
    If first_index == second_index     
      Next iteration
    If first_number + second_number == target_sum
      Push to pairs_and_index [first_number, second_number, max(first_index, second_index)]
If pairs_and_index is empty
  Return nil
Set minimum := find the minimum of pairs_and_index by the third element
Set result := first two elements of minimum
Return result
=end

# First solution works but too slow time complexity for "excrutiatingly long tests" on codewars
def sum_pairs(ints, s)
  pairs_and_index = []
  ints.each_with_index do |first_number, first_index|
    ints.each_with_index do |second_number, second_index|
      next if first_index == second_index
      if first_number + second_number == s
        pairs_and_index << [
          first_number,
          second_number,
          [first_index, second_index].max
        ]
      end
    end
  end
  return nil if pairs_and_index.empty?
  minimum = pairs_and_index.min { |a, b| a[2] <=> b[2] }
  minimum.take(2)
end

=begin
Algorithm 2:
Given an array, numbers, and an integer, target_sum
Iterate through each number in numbers with index
  Set search_index := 0
  Iterate while search_index < index
    If numbers[search_index] + number == target_sum
      Return [numbers[search_index], number]
    search_index = search_index + 1
Return nil
=end

# Still polynomial time, still too slow
def sum_pairs(numbers, target_sum)
  numbers.each_with_index do |second_number, second_index|
    first_index = 0
    while first_index < second_index
      if numbers[first_index] + second_number == target_sum
        return [numbers[first_index], second_number]
      end
      first_index += 1
    end
  end
  nil # none could be found
end

=begin
data structure:
hash {
  number => index
}
when you build the hash, any duplicates you want the first index found as
  it will be the lowest, so test for key, if it exists => next iteration
so the hash, aside from anything, gives you O(1) lookup lowest index for that number
gives you O(1) does number (key) exist?

example:
target_sum = 8
hash = {
  1  => 0
  4  => 1
  8  => 2
  7  => 3
  3  => 4
  15 => 5
}

1 4 8 7 3 15

8 - 1 == 7
does 7 exist? yes
what is 7 index? 3
if hash[compliment]
  hash_2[hash[compliment]] = [number, compliment]

Algorithm 2:
Set indexes := hash
Iterate through each number in number with index
  Set indexes[number] := index


=end

# Bingo! This O(n) solution works even for "excrutiatingly long tests"
def sum_pairs(numbers, target_sum)
  indexes = {}
  numbers.each_with_index do |number, index|
    indexes[number] = index unless indexes.key?(number)
  end
  pairs = {}
  numbers.each_with_index do |current_number, current_index|
    compliment = target_sum - current_number
    next unless indexes[compliment]
    if current_index < indexes[compliment]
      pair = [current_number, compliment]
      pairs[pair] = indexes[compliment]
    elsif current_index > indexes[compliment]
      pair = [compliment, current_number]
      pairs[pair] = current_index
    end
  end
  pairs.keys.min { |a, b| pairs[a] <=> pairs[b] }
end

# worse
def sum_pairs(numbers, target_sum)
  indexes = {}
  numbers.each_with_index do |number, index|
    indexes[number] = index unless indexes.key?(number)
  end
  pair = nil
  pair_index = nil
  numbers.each_with_index do |current_number, current_index|
    compliment = target_sum - current_number
    next unless indexes[compliment]
    current_pair = nil
    highest_index = nil
    if current_index < indexes[compliment]
      highest_index = indexes[compliment]
      current_pair = [current_number, compliment]
    elsif current_index > indexes[compliment]
      highest_index = current_index
      current_pair = [compliment, current_number]
    else
      next
    end
    if !pair_index || highest_index < pair_index
      pair = current_pair
      pair_index = highest_index
    end
  end
  pair
end

# codewars solutions
def sum_pairs(numbers, target_sum)
  seen = {}
  numbers.each do |number|
    return [target_sum - number, number] if seen[number]
    seen[number] = true
  end
  nil
end

require 'set'
def sum_pairs(numbers, target_sum)
  seen = Set.new
  numbers.each do |number|
    return [target_sum - number, number] if seen.member?(target_sum - number)
    seen.add(number)
  end
  nil
end

=begin
The first index doesn't matter, we're trying to find the lowest second index
So we just have to keep track of which numbers we've already seen
And test each number to see if the missing addand has already been seen
To do that you just need a hash to store numbers that have already been seen
  Check hash for the number that completes the current number
    If it's there then return the previous number and current number
    Otherwise add the current number to the hash
Otherwise return nil
=end

def sum_pairs(numbers, target_sum)
  seen = {}
  numbers.each do |current_number|
    compliment = target_sum - current_number
    return [compliment, current_number] if seen[compliment]
    seen[current_number] = true
  end
  nil
end

#                          target_sum
l1= [1, 4, 8, 7, 3, 15]   # 8
l2= [1, -2, 3, 0, -6, 1]  # -6
l3= [20, -13, 40]         # -7
l5= [10, 5, 2, 3, 7, 5]   # 10
l6= [4, -2, 3, 3, 4]      # 8
l7= [0, 2, 0]             # 0
l8= [5, 9, 13, -3]        # 10

p sum_pairs(l1, 8) == [1, 7]
p sum_pairs(l2, -6) == [0, -6]
p sum_pairs(l3, -7) == nil
p sum_pairs(l5, 10) == [3, 7]
p sum_pairs(l6, 8) == [4, 4]
p sum_pairs(l7, 0) == [0, 0]
p sum_pairs(l8, 10) == [13, -3]

# 22:00