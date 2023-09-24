# Write Number in Expanded Form

=begin
Notes:

1) convert number to a string
split string into array of single-digit character strings
Iterate for -(size of array) up to -1 inclusive, negative_index
  Transform string in array at negative_index so that
    string is converted to integer
    multiply integer by (10^(-negative_index - 1))

Problem:
input: an integer, number
output: a string giving number in expanded form (place value addition)


rules:
  All numbers will be whole numbers greater than 0

Examples and test cases:

    digit: 7  0  3  0  4
    index: 0  1  2  3  4
neg_index: -5 -4 -3 -2 -1

4 * (10 ** (-neg_index - 1))


Data structures:

Algorithm:
Given an integer, number
Set digits := convert number to string and split into an array of single character strings
Iterate for -(size of digits) up to -1 inclusive, negative_index
  Tranform string in digits at negative_index so that
    string is converted to an integer
    integer is multiplied by (10^(-negative_index - 1))
Remove any zeroes from resulting array
Set result := join integers in digits into a string around " + "
Return result
=end

def expanded_form(number)
  digits = number.to_s.chars
  place_values = []
  (-digits.size).upto(-1) do |negative_index|
    value = digits[negative_index].to_i * (10 ** (-negative_index - 1))
    place_values << value
  end
  place_values.reject! { |value| value.zero? }
  place_values.join(" + ")
end

p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'

# 18:33
# did not consider that it would be necessary to remove zeroes from consideration
# in the place_values array before string join
# I should have worked through the long example to the end and considered the
# intermediate forms of data
