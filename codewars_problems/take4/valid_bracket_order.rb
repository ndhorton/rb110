# Leetcode problem 20. Valid Parentheses

=begin

( [ ( ) ] )
) closer, is the stack '(' ? yes, pop the stack
] closer, ist the stack '[' ? yes, pop the stack
) closer, is the stack '('
)'
stack
( popped
[ popped
(

Create a constant CLOSE_TO_OPEN = {
  ')' => '(',
  ']' => '[',
  '}' => '{'
}

Create constant OPENERS = ['(', '['. '{']

Given a string, string
Set stack := empty array
Iterate through each char in string
  If char is in OPENERS
    Push char to stack
  Else if (char is in CLOSERS && ) stack[-1] == CLOSE_TO_OPEN[char]
    Pop stack
  Else (if char is in CLOSERS)
    return false
If stack is empty
  Return true
Else
  Return false
=end

CLOSE_TO_OPEN = {
  ')' => '(',
  ']' => '[',
  '}' => '{'
}.freeze

OPENERS = {
  '(' => true,
  '[' => true,
  '{' => true
}.freeze

CLOSERS = {
  ')' => true,
  ']' => true,
  '}' => true
}.freeze

# is_valid(s) on Leetcode
def valid?(string)
  stack = []
  string.each_char do |char|
    if OPENERS[char]
      stack << char
    elsif CLOSERS[char] && stack[-1] == CLOSE_TO_OPEN[char]
      stack.pop
    elsif CLOSERS[char]
      return false
    end
  end
  stack.empty?
end

p valid?('[(hello, and) good {evening}]') == true
p valid?('{[([])]}') == true
p valid?('[]{}()') == true
p valid?('([)]') == false
p valid?('[') == false
p valid?('}') == false
p valid?('') == true
p valid?('April is the cruellest month') == true
p valid?('(Whan) that {April} [(with)] his showres [({([soote])})]') == true
