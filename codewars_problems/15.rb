# Take a Ten Minute Walk

=begin
Notes:

Intially
x = 0
y = 0

'n' -> y++
's' -> y--
'e' -> x++
'w' -> x--

Problem:
input:
output:

  Write a method that takes an array of one-letter strings and
  returns true if it describes a series of 10 steps that returns
  you to home.

rules:
  input array will not be empty
  there must be ten elements in the input array
  the number of 'n' must equal the number of 's'
  the number of 'e' must equal the number of 'w'

Examples and test cases:

Data structures:

Algorithm:
Given an array, steps
Return the boolean result of
  size of steps == 10 AND
  occurences of 'n' in steps must equal occurences of 's' AND
  occurences of 'e' in steps must equal occurences of 'w'
=end

def is_valid_walk(steps)
  steps.size == 10 &&
    steps.count('n') == steps.count('s') &&
    steps.count('e') == steps.count('w')
end

def is_valid_walk(steps)
  x = 0
  y = 0
  steps.each do |step|
    if    step == 'n' then y += 1
    elsif step == 's' then y -= 1
    elsif step == 'e' then x += 1
    elsif step == 'w' then x -= 1
    end
  end
  x.zero? && y.zero? && steps.size == 10
end

p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false

# 9:21
