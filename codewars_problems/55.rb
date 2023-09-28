# Grouping and Counting

=begin
Notes:

Problem:
input: an array or nil
output: a hash, or nil

  Write a method that takes an array and returns
    either
      nil if the input is nil instead of an array or is an empty array
    or
      a hash containing each unique value from array as key and the
      count of occurrences of that value in array as value

rules:
  not allowed to use Array#count or Array#length
  empty or nil input should return nil

Examples and test cases:

Data structures:

Algorithm:
Given an argument, array
If array is nil or array is empty
  Return nil
Set result := empty hash
Set unique_values := an array of only the unique values from array
Iterate through each value in unique_values
  Set count := 0
  Iterate through each element in array
    If element == value
      count = count + 1
  Create key value in result associated to count
Return result
=end

def group_and_count(array)
  return nil if array.nil? || array.empty?

  result = {}
  array.uniq.each do |value|
    count = 0
    array.each { |element| count += 1 if element == value }
    result[value] = count
  end
  result
end

# backwards-formed expansion of second solution
def group_and_count(array)
  return nil if array.nil? || array.empty?

  result = {}
  array.each do |value|
    if result.key?(value)
      result[value] += 1
    else
      result[value] = 1
    end
  end
  result
end

# second solution
def group_and_count(array)
  return nil if array.nil? || array.empty?

  array.each_with_object(Hash.new(0)) do |value, result|
    result[value] += 1
  end
end

p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}
p group_and_count([]) == nil
p group_and_count(nil) == nil
p group_and_count([1, 7, 5, -1]) == {1=>1, 7=>1, 5=>1, -1=>1}

# 12:27

# 14:59 - second solution
