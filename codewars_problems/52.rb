# Bouncing Balls

=begin
Notes:

2 * number of bounces + 1 = number of times the ball is glimpsed

Problem:
input: 3 floats, h (initial height), bounce, window
output: either a positive integer result, or -1 if arguments invalid

  Write a method that calculates how many times a ball will appear
  outside a window below where the ball was dropped from, given the
  height of the window it was dropped from, the fixed rate of decay
  of the ball's bounce height, and the height of the window from
  which it is observed.

rules:
  h (initial height) must be greater than 0
  bounce must be greater than 0 and less than 1
  window must be less than h
    otherwise return -1
  the ball can only be seen if the height of the rebounding ball is greater than the window height

Examples and test cases:

Data structures:

Algorithm:
Given 3 floats, height, bounce, window_height
If height <= 0 || height <= window_height ||
   bounce <= 0 || bounce >= 1
  return -1
Set glimpses := 1
Set valid_bounces = 0
Iterate
  height = height * bounce  
  break from iteration unless height > window_height
  valid_bounces = valid_bounces + 1
glimpses = glimpses + valid_bounces * 2
Return glimpses
=end

def bouncingBall(height, bounce, window_height)
  if height <= 0 || height <= window_height ||
     bounce <= 0 || bounce >= 1
    return -1
  end

  glimpses = 1
  valid_bounces = 0
  loop do
    height *= bounce
    break unless height > window_height
    valid_bounces += 1
  end

  glimpses += valid_bounces * 2
  glimpses
end

# first solution on codewars
def bouncingBall(h, bounce, window)
  if bounce < 0 || bounce >= 1 || h <= window
    -1
  else
    bouncingBall(h * bounce, bounce, window) + 2
  end
end

p bouncingBall(3, 0.66, 1.5) == 3
p bouncingBall(30, 0.66, 1.5) == 15
p bouncingBall(30, 0.75, 1.5) == 21
p bouncingBall(30, 0.4, 10) == 3
p bouncingBall(40, 1, 10) == -1
p bouncingBall(-5, 0.66, 1.5) == -1
p bouncingBall(1, 0.66, 0.66) == 1
p bouncingBall(1, 0.66, 1) == -1

# 30:10
