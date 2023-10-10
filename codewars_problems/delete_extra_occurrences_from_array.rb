# "Delete occurrences of an element if it occurs more than n times" - codewars kata

# I think one thing to learn from this kata is that
# a multiple-deletion operation on an array is really a selection operation
# i.e a filter (#filter is an alias for #select)
# 'a filtering algorithm filters *in*, i haven't found one that
# filters out' - ApDS=P

=begin
Given an array, order, and an integer, max_e
Set occurrences := empty hash
Set result := empty array
Iterate through each number in order
  If number is a key in occurrences
    occurences[number] = occurences[number] + 1
  else
    occurences[number] = 1
  If occurences[number] > max_e
    Next iteration
  Push number to result
Return result
=end


# def delete_nth(order, max_e)
#   result = []
#   order.each do |number|
#     result << number unless result.count(number) >= max_e
#   end
#   result
# end

# def delete_nth(order, max_e)
#   order.each_with_object([]) do |number, result|
#     result << number unless result.count(number) >= max_e
#   end
# end

# def delete_nth(order,max_e)
#   result = []
#   occurrences = {}
#   order.each do |number|
#     if occurrences.key?(number)
#       occurrences[number] += 1
#     else
#       occurrences[number] = 1
#     end
#     next if occurrences[number] > max_e
#     result << number
#   end
#   result
# end

def delete_nth(order, max_e)
  occurrences = Hash.new(0)
  order.reject { |number| (occurrences[number] += 1) > max_e }
end