# Multiples of 3 or 5

=begin
Notes:

Problem:
input: an integer n
output: an integer

  Write a method that takes an integer n, and returns the sum
  of all multiples of 3 or 5 (only counting multiples of 3 and 5 once)

rules:
  if a number is a multiple of both 3 and 5, only count it once
  if n is a multiple, do not count it, only numbers BELOW

Examples and test cases:

20

3 5 6 9 10 12 15 18
8
14
23
33
45
60
78

20
sum3 = (20 - 1) / 3  [integer division]

Data structures:

Algorithm:
Given an integer, n
Set sum := 0
Iterate from 3 upto n exclusive, current_number
  if current_number % 3 == 0 || current_number % 5 == 0
    sum = sum + current_number
Return sum
=end

def solution(n)
  (3...n).reduce(0) do |sum, current_number|
    if current_number % 3 == 0 || current_number % 5 == 0
      sum + current_number
    else
      sum
    end
  end
end

# interesting series-based codewars solution - ArtiomGiza
def solution(number)
  sum_x(3, number) + sum_x(5, number) - sum_x(15, number)
end

# sums all the multiples of x less than number
def sum_x(x, number)
  n = (number - 1) / x  # subtracting 1 from number because < not <=
                        # gives you the number of multiples
  x * n * (n + 1) / 2
end

p solution(10) == 23
p solution(20) == 78
p solution(200) == 9168

# 7:46
