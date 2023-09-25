# Sherlock On Pockets

=begin
Notes:

Problem:
input: hash, pockets, array, allowed
output: a new array containing selected keys from pockets, or nil

  Write a method that takes a hash argument, pockets and an array argument, allowed
  and returns any person keys from pockets where the associated array value contains
  elements not included in allowed array; the person keys should be returned in a new
  array

rules:
  allowed argument could be empty array but I don't think nil
  pockets argument could have nil as a value part (or an empty array)
  pockets argument could be nil?
  if there are no suspects return nil
  if pockets is nil, or empty hash, return nil
  you also have to check whether each key in pockets is nil before proceeding

Examples and test cases:
 
allowed: 1 2
bob only has 1, not a suspect
tom has 5, which is not included in allowed -> tom is suspect
jane has 7, "" "" -> suspect
[:tom, :jane]

Data structures:

Algorithm:
Given a hash, pockets, and an array, allowed
If pockets is falsey, or pockets is empty
  Return nil
Set suspects := empty array
Iterate through each person key in pockets
  if pockets[person] is not truthy OR pockets[person] is empty
    next iteration
  iterate through each iterm in pockets[person]
    if item is not included in allowed
      Append person to suspects
      break from inner iteration
If suspects is empty
  Return nil
Else
  Return suspects
=end

def find_suspects(pockets, allowed)
  return nil if !pockets || pockets.empty?
  suspects = []
  pockets.keys.each do |person|
    next if !pockets[person] || pockets[person].empty?
    pockets[person].each do |item|
      unless allowed.include?(item)
        suspects << person
        break
      end
    end
  end
  suspects.empty? ? nil : suspects
end


pockets = {
  bob: [1],
  tom: [2, 5],
  jane: [7]
}

p find_suspects(pockets, [1, 2]) == [:tom, :jane]
p find_suspects(pockets, [1, 7, 5, 2]) == nil
p find_suspects(pockets, []) == [:bob, :tom, :jane]
p find_suspects(pockets, [7]) == [:bob, :tom]

# 25:10 - slightly over time solely because description was incomprehesibly written,
# wouldn't advise working through this again, not worth it
