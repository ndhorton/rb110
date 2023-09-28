# Find the nexus of the codewars universe

=begin
Notes:

Problem:
input:
output:

  Write a method that takes a hash, users, where each key is rank
  and each value is honor. Calculate the difference between rank and honor
  for each user. The user whose difference is smallest should have their
    rank returned. If there are multiple users with the same difference,
    the lowest rank should be returned

rules:

Examples and test cases:

Data structures:


one approach to structuring data for finding 

[[92, 1], [45, 10], [15, 15], [1, 20], [12, 23], [28, 30]]
Then finding the minimum will return the nexus
=> [1, 20]
and you can return the second element
[1, 20][2] -> 20

Algorithm:
Given a hash, users
Set candidates := empty array
Iterate through each rank in users
  Set honor := users[rank]
  Set difference := the absolute value of honor - rank
  Push [difference, rank] to candidates
Find the minimum subarray in candidates
Return second element in the minimum subarray
=end

def nexus(users)
  candidates = users.keys.map do |rank|
    honor = users[rank]
    difference = (honor - rank).abs
    [difference, rank]
  end
  candidates.min[1]
end

# first codewars solution
def nexus(users)
  users.min_by { |rank, honor| [(honor - rank).abs, rank] }[0]
end

p nexus({1 => 3, 3 => 3, 5 => 1}) == 3
p nexus({1 => 10, 2 => 6, 3 => 4, 5 => 1}) == 3
p nexus({1 => 10, 2 => 3, 3 => 4, 5 => 1}) == 2

# 13:39
