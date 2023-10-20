# Integer Reduction

=begin
In this Kata, you will be given two integers n and k and your task is to remove k-digits from n and return the lowest number possible, without changing the order of the digits in n. Return the result as a string.

Let's take an example of solve(123056,4). We need to remove 4 digits from 123056 and return the lowest possible number. The best digits to remove are (1,2,3,6) so that the remaining digits are '05'. Therefore, solve(123056,4) = '05'.

Note also that the order of the numbers in n does not change: solve(1284569,2) = '12456', because we have removed 8 and 9.

More examples in the test cases.

Good luck!
=end

=begin

Notes:

Problem:
input: two integers
output: a string

Write a method that takes an integer, n, and an integer, k,
and removes k digits from n such that the number formed is the smallest
possible without rearranging the order of digits

rules:
  assume valid inputs

Examples / test cases:

n = 1 2 3 0 5 6
k = 4

4 times

2 3 0 5 6
1 3 0 5 6
1 2 0 5 6 <-
1 2 3 5 6
1 2 3 0 6
1 2 3 0 5

n = 1 2 0 5 6,  k = 3

2 0 5 6
1 0 5 6 <-
1 2 5 6
1 2 0 6
1 2 0 5

n = 1 0 5 6, k = 2

0 5 6 <-
1 5 6
1 0 6
1 0 5

n = 0 5 6, k = 1

5 6
0 6
0 5 <-

n = 0 5, k = 0
return '05'

Data Structures:

Algorithm:
Given an integer, n, and an integer k
Set digit_string := convert n to a string
Iterate while k > 0
  Set numbers := empty array
  Iterate for index from 0 to size of digit_string exclusive
    Set digits := split digit_string into array of chars
    Delete from digits at index
    Join digits to a single string
    Push string to numbers
  digit_string = Find minimum of numbers by integer criterion
  k = k - 1
Return digit_string
=end

def solve(n, k)
  digit_string = n.to_s
  while k > 0
    numbers = []
    (0...digit_string.size).each do |index|
      digits = digit_string.chars
      digits.delete_at(index)
      numbers << digits.join
    end
    digit_string = numbers.min_by(&:to_i)
    k -= 1
  end
  digit_string
end

p solve(123056,1) == '12056'
p solve(123056,2) == '1056'
p solve(123056,3) == '056'
p solve(123056,4) == '05'
p solve(1284569,1) == '124569'
p solve(1284569,2) == '12456'
p solve(1284569,3) == '1245'
p solve(1284569,4) == '124'

# 18:32
