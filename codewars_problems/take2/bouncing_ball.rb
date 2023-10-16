# Bouncing Balls

=begin
A child is playing with a ball on the nth floor of a tall building. The height of this floor, h, is known.
He drops the ball out of the window. The ball bounces (for example), to two-thirds of its height (a bounce of 0.66).
His mother looks out of a window 1.5 meters from the ground.
How many times will the mother see the ball pass in front of her window (including when it's falling and bouncing?
Three conditions must be met for a valid experiment:
Float parameter "h" in meters must be greater than 0
Float parameter "bounce" must be greater than 0 and less than 1
Float parameter "window" must be less than h.
If all three conditions above are fulfilled, return a positive integer, otherwise return -1.
Note:
The ball can only be seen if the height of the rebounding ball is strictly greater than the window parameter
Example:
- h = 3, bounce = 0.66, window = 1.5, result is 3
- h = 3, bounce = 1, window = 1.5, result is -1
(Condition 2) not fulfilled).
=end

=begin

Notes:

Problem:
input: three floats, h, bounce, window
output: a positive integer, or -1 as invalid input signal

Write a method that takes 3 floats, h, bounce, and window
and returns the number of times the ball can be seen from the
window before the height of the bounce is less than or equal to
the height of the window (to be seen, ball must be greater than
the height of the window)

rules:
  h must be > 0 or return -1
  bounce must be > 0 and < 1
  window must be < h
  ball can only be seen if the height of bounce is strictly > window

Examples / test cases:

h = 3, bounce = 0.66, window 1.5
h > window so continue
1 times, the ball drops initially
h * bounce == 1.98, h > window so times + 2 == 3 times
rebound > window so continue
h * bounce == ~1.3, h <= window so return times

Data Structures:

Algorithm:
Given three floats, h, bounce, window
If NOT (h > 0 AND bounce > 0 AND bounce < 1 AND window < h)
  Return -1
glimpses = 1
Iterate
  h = h * bounce
  If h > window
    glimpses = glimpses + 2
  Else
    Break from iteration
Return glimpses
=end

def bouncingBall(h, bounce, window)
  unless h > 0 && bounce > 0 && bounce < 1 && window < h
    return -1
  end

  glimpses = 1
  loop do
    h = h * bounce
    if h > window
      glimpses += 2
    else
      break
    end
  end

  glimpses
end

p bouncingBall(3, 0.66, 1.5) == 3
p bouncingBall(30, 0.66, 1.5) == 15
p bouncingBall(30, 0.75, 1.5) == 21
p bouncingBall(30, 0.4, 10) == 3
p bouncingBall(40, 1, 10) == -1
p bouncingBall(-5, 0.66, 1.5) == -1
p bouncingBall(1, 0.66, 0.66) == 1
p bouncingBall(1, 0.66, 1) == -1

# 17:52
