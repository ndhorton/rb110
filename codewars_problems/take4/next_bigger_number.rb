# Next Bigger Number - LS video

=begin

Notes:

one approach:
take the permutations of digit_string-size of digit_string
iterate through them and add any that are bigger to a candidates array
find the min value and return

Problem:
input: an integer
output: an integer

Write a method that takes an integer and returns
either
  the next integer of greater value that can be formed by rearranging the digits of the input
or
  -1 if no such number can be found

rules:
  if no bigger number can be formed with the digits of the input, return -1

Examples / test cases:

2 0 1 7
split into array of digits
current_combinations = []
  0 1 7 2
  1 7 2 0
  7 2 0 1
reverse original
  7 1 0 2
  1 0 2 7
  0 2 7 1
  2 7 1 0

Data Structures:

approach 1 Algorithm:
Given an integer, number
Convert number to a string
Split string into an array of character-strings, digits
Set permutations := get an array containing every permutation of digits
Transform permutations such that every sub-array is joined to a single string
          and converted to an integer
Sort permutations
Set minimum := find the first element greater than number, or nil if no such element exists
If minimum is not nil
  return minimum
Else
  return -1

5 1 3
5
  1 3
5 1
    3
5 3 1

3 1 5 reverse number digits
3
  1 5 is there a number in the remainder of the digits that can make the bizarro number *smaller*
      by swapping it for 3?
yes, 1
1 3 5
reverse again
5 3 1

1 2 3 4 5 6 7 8 9
reverse
9 8 7 6 5 4 3 2 1
9 - is there a number in the remainder to make it smaller?
  yes - 8
9, 8 -> 8, 9
8 9 7 6 5 4 3 2 1 reverse
1 2 3 4 5 6 7 9 8

1 1 1 reverse
1 1 1
1
  1 1 is there a number that can be swapped? NO
return -1

1342 reverse ->

2 4 3 1
2
  4 3 1 is there a number to make smaller? 1
1 4 3 2 set digits = 1 4 3 2 and start again?
1
  4 3 2 is there a number to make smaller? no
1 4
    3 2 is there a number to make smaller? yes 3
1 3 4 2
but when do you stop????

another crude approach:
simply increment number until you get a number that has the same digits
won't really work when there isn't such a number

531
split number into digits

1 3 4 2
1 4 <-> 3 2

1 3 4 2 reverse
2 4 3 1
2
  4 3 1 does swapping 2 and 4 make the number smaller? no
2 4
    3 1 does swapping 4 and 3 make the number smaller? yes
2 3 4 1 reverse
1 4 3 2 but this is not the next biggest number

1 3 4 2 sort
1 2 3 4
1 4 3 2

brute force:
1 3 4 2 reverse sort
4 3 2 1 - this is the largest number with the same digits

1 1 1 - reverse sort 111 is the largest, 0 -> 0 etc

Iterate to the largest number
  for each number greater than input number
    check if number has same digits
    if so, return that number
return -1

subprocess same_digits?
Given an array of character-strings, sorted_original, and an integer, test_case
Set test_digits := convert test_case to a string;
                   split that string into an array of character strings
Sort test_digits
Return boolean result of (test_digits == sorted_original)

subprocess next_bigger_num
Given an integer, number
Set sorted_orginal := convert number to string
                      split string into array of char-strings
                      sort that array
Set limit_case := reverse sorted_original
                  join to a single string
                  convert to an integer
Set result := -1
Iterate for current_number from number+1 upto limit_case inclusive
  if same_digits?(sorted_original, current_number)
    result = current_number
    break from iteration
Return result
=end

def next_bigger_num(number)
  digits = number.to_s.chars
  permutations = digits.permutation(digits.size).map { |sub_array| sub_array.join.to_i }
  permutations.sort!
  minimum = permutations.find { |new_number| new_number > number }
  minimum ? minimum : -1
end


# Actually faster than permutation method
def same_digits?(number, sorted_original)
  number_digits = number.to_s.chars.sort
  number_digits == sorted_original
end

def next_bigger_num(number)
  sorted_original = number.to_s.chars.sort
  limit = sorted_original.reverse.join.to_i
  ((number + 1)..limit).each do |current_number|
    return current_number if same_digits?(current_number, sorted_original)
  end
  -1
end


p next_bigger_num(1342) == 1423
p next_bigger_num(0) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798

# 17:39
