=begin
questions I forgot to ask:
  - should non-alphabetic letters be included in deciding if a substring is a palindrome?

questions:
  - what does it mean to "consider palindrome words case sensitive?"
Answered by test case, but you could seek clarification
  - Will inputs always be strings?
  - do only strings of at least 2 characters count as palindromes?


input: a string
output: an array of all substrings of the input string that are palindromes
rules:
Explicit requirements
  - the palindromic substrings are case sensitive ('abbA' not a palindrome)
Implicit requirements
  - if there are no palindromes, return an empty array
  - the return value must be an array
  - an empty string returns an empty array

subroutine leading_substrings(string)
  Set substrings := empty vector
  Set end_index := 0
  Iterate while end_index < string.size()
    Set current_substring := string.slice(0..end_index)
    substrings.push_back(current_substring)
    end_index++
  Return substrings

subroutine substrings(string)
  Set substrings := empty vector
  Set end_index := string.size() - 1
  Set start_index := 0
  Iterate while start_index < string.size()
    substrings.concat(leading_substrings(string.slice(start_index..end_index)))
    start_index++
  Return substrings

subroutine palindrome?(string)
  string.reverse() == string

subroutine palindromic_substrings(string)
  Set all_substrings := substrings(string)
  Set palindromes := empty vector
  Iterate over each substring in all_substrings
    If substring.size() > 1 AND palindrome?(substring)
      palindromes.push_back(substring)
  Return palindromes

=end

# def palindrome?(string)
#   string.size > 1 && string.reverse == string
# end

# def leading_substrings(string)
#   substrings = []
#   (0...string.size).each do |last_index|
#     current_substring = string[0..last_index]
#     substrings.push(current_substring)
#   end
#   substrings
# end

# def substrings(string)
#   substrings = []
#   last_index = string.size - 1
#   (0..last_index).each do |start_index|
#     current_group = leading_substrings(string[start_index..last_index])
#     substrings.concat(current_group)
#   end
#   substrings
# end

# def palindromic_substrings(string)
#   palindromes = []
#   all_substrings = substrings(string)
#   all_substrings.each do |substring|
#     if substring.size > 2 && palindrome?(substring)
#       palindromes.push(substring)
#     end
#   end
#   palindromes
# end

# working from LS pseudocode solution

def substrings(string)
  result = []
  starting_index = 0

  loop do
    break unless starting_index <= string.length - 2 # `break unless` would be
                                                     # a break condition expressed as
    num_chars = 2                                    # a `while`; `break if` flips the logic
                                                     # so you'd need `>` instead of `<=`
    loop do
      break unless num_chars <= string.length - starting_index

      substring = string.slice(starting_index, num_chars)
      result << substring
      
      num_chars += 1
    end

    starting_index += 1
  end

  result
end

def palindrome?(string)
  string == string.reverse
end

def palindrome_substrings(string)
  substring_arr = substrings(string)
  substring_arr.select { |substring| palindrome?(substring) }
end

p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") == []
p palindrome_substrings("") == []
