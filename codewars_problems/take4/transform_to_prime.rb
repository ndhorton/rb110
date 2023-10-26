# Transform to Prime

=begin
Given a List [] of n integers , find minimum number to be inserted in a list, so that sum of all elements of list should equal the closest prime number .
Notes

    List size is at least 2 .

    List's numbers will only positives (n > 0) .

    Repetition of numbers in the list could occur .

    The newer list's sum should equal the closest prime number .

Input >> Output Examples

1- minimumNumber ({3,1,2}) ==> return (1)

Explanation:

    Since , the sum of the list's elements equal to (6) , the minimum number to be inserted to transform the sum to prime number is (1) , which will make the sum of the List equal the closest prime number (7) .

2-  minimumNumber ({2,12,8,4,6}) ==> return (5)

Explanation:

    Since , the sum of the list's elements equal to (32) , the minimum number to be inserted to transform the sum to prime number is (5) , which will make the sum of the List equal the closest prime number (37) .

3- minimumNumber ({50,39,49,6,17,28}) ==> return (2)

Explanation:

    Since , the sum of the list's elements equal to (189) , the minimum number to be inserted to transform the sum to prime number is (2) , which will make the sum of the List equal the closest prime number (191
=end

=begin

Notes:

approach:
helper method to check if a number is prime

number
counter = 2
Iterate while counter * counter <= number
  If number % counter == 0
    Return false
Return true 

sum the array elements
result = 0
Iterate while (sum + result) is not prime
  Increment result
Return result

Problem:
input: an array
output: an integer

Write a method that takes an array and returns the number, 0 or greater, that
needs to be added to the array so that the sum of its elements is equal to the
closest prime number >= original sum of the elements

rules:
  array size >= 2
  array only contains positive integers
  assume number to be inserted is non-negative? yes
  so therefore the prime >= the sum is the target

Examples:

DS:

Algorithm:

subprocess prime?
Given an integer, number
Set counter := 2
Iterate while (counter * counter) <= number
  If number % counter == 0
    Return false
  Increment counter
Return true

Given an array, numbers
Set sum := sum integers in numbers
Set result := 0
Iterate while !prime?(sum + result)
  Increment result
Return result
=end

def prime?(number)
  counter = 2
  while (counter * counter) <= number
    if number % counter == 0
      return false
    end
    counter += 1
  end
  true
end

def minimum_number(numbers)
  sum = numbers.reduce(:+)
  result = 0
  until prime?(sum + result)
    result += 1
  end
  result
end
    
p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2

# 19:47