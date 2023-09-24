# Persistent Bugger

=begin
Notes:

Let persist_count = 0
Iterate while 

Problem:
input: a positive integer
output: count of the number of times to reach a single digit through multiplication
  of the individual digits

  Write a method that takes a positive integer and returns the multiplicative
  persistence

rules:
  does 'positive parameter' mean positive integer? YES
  will the digits of the input number include zero? NO though in such a case
    the persistence would be 1 since 0 is a single digit so it doesn't matter

Examples and test cases:

39
1)  3 * 9 == 27
2)  2 * 7 == 14
3)  1 * 4 == 4
result == 3

999
9 * 9 * 9 == 729
7 * 2 * 9 == 126
1 * 2 * 6 == 12
1 * 2 == 2
result == 4

4
result == 0 this one is perhaps tricky

25
1) 2 * 5 == 10
2) 1 * 0 == 0


Data structures:
You need to get the digits each iteration
You also need to count the number of digits in the result
The second is a fairly simple log function
To get the digits for multiplication it doesn't matter the order
because of commutative property so digits method can be used

Algorithm:

suprocess digits( number )
Given a positive integer, number
If number == 0
  Return an array containing 0
Set digit_count := floor(log_10(number)) + 1
Set result := empty array
Iterate digit_count times
  value = number % 10
  number = number / 10
  Prepend value to result
Return result


suprocess digits( number )
Given a positive integer, number
If number == 0
  Return an array containing 0
Set digit_count := floor(log_10(number)) + 1
Set result := empty array
Iterate from (digit_count - 1) down to 0 inclusive, exponent
  digit = number / (10^exponent) % 10
  push digit to result
Return result


subprocess persistence( number )
Given a positive integer, number
Set persistence_count := 0
Set individual_digits := split number into individual digits
Iterate while size of individual_digits > 1
  Set new_number := 1
  Iterate through each digit in individual_digits
    new_number = new_number * digit
  individual_digits = split new_number into individual digits
  persistence_count = persistence_count + 1
Return persistence_count
=end

def digits(number)
  if number.zero?
    return [0]
  elsif number < 0
    return nil
  end

  digit_count = Math.log10(number).floor + 1
  result = []
  digit_count.times do
    digit = number % 10
    number /= 10
    result.prepend(digit)
  end
  result
end

def digits(number)
  if number.zero?
    return [0]
  elsif number < 0
    return nil
  end

  digit_count = Math.log10(number).floor + 1
  result = []
  (digit_count - 1).downto(0) do |exponent|
    digit = number / (10 ** exponent) % 10
    result << digit
  end

  result
end

def persistence(number)
  persistence_count = 0
  individual_digits = digits(number)
  while individual_digits.size > 1
    new_number = 1
    individual_digits.each { |digit| new_number *= digit }
    individual_digits = digits(new_number)
    persistence_count += 1
  end
  persistence_count
end

p persistence(39) == 3
p persistence(4) == 0
p persistence(25) == 2
p persistence(999) == 4

# 18:44
