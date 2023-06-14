# Practice Problems: Additional Practice

# 1.Turn array into hash where names are keys and values are the position in the array
# Does 'position' in this context mean index? Assume yes.

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# flintstones_hash = {}
# flintstones.each_with_index do |name, index|
#   flintstones_hash[name] = index
# end

# index = 0
# loop do
#   break if index >= flintstones.size
#   flintstones_hash[flintstones[index]] = index
#   index += 1
# end

# p flintstones_hash

# 2. add hash values (ages)

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# age_total = ages.values.sum

# age_total = 0
# ages.each_value { |age| age_total += age }

# age_total = ages.values.reduce(:+)

# puts age_total

# 3. Remove people with age 100 or greater from the `ages` hash
# Assume destructive

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# ages.select! { |name, age| age < 100 } returns `nil` if no changes are made
# ages.keep_if { |_, age| age < 100 } # returns the original collection even if no changes are made

# p ages

# 4.

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# p ages.values.min                  # min age
# p (ages.min_by { |_, age| age})    # min pair

# 5.

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Given an array of strings, flintstones
# Set index := 0
# Iterate for index from 0 through flintstones.size - 1
#   if flintstones[i][0..1] == "Be"
#     return index

# p (flintstones.index { |string| string.start_with?('Be') })

# 6. Mutate array so that every name is truncated to the first 3 chars

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# flintstones.map! { |name| name[0..2] }

# p flintstones

# 6. Create a hash that expresses the frequency with which each letter occurs in this string

# Given a string, statement
# Set tally := empty hash
# Set unique_chars := convert statement to char array and remove duplicate characters
# Iterate over each char in unique_chars
#   tally[char] = count(statement, char)
# Return tally

# statement = "The Flintstones Rock"

# tally = {}
# statement.chars.uniq.each { |char| tally[char] = statement.count(char) }
# p tally

# LS solution

# result = {}
# letters = ('A'..'Z').to_a + ('a'..'z').to_a

# letters.each do |letter|
#   letter_frequency = statement.count(letter)
#   result[letter] = letter_frequency if letter_frequency > 0
# end

# p result

# 8. This code will output
1 # and then remove `1`
3 # and then remove `2`
# and returns [3, 4]

# The next code will output
1 # and then removes `4`
2 # and then removes `3`
# and returns [1, 2]

# 9. Titleize

# Given a string, string
# Set words := split string into an array of words
# Iterate through each word in words
#   Destructively capitalize word
# Join words around spaces and return the resulting string

# def titleize!(string)
#   string.replace(string.split.map(&:capitalize).join(' '))
# end

# def titleize(string)
#   string.split.map(&:capitalize).join(' ')
# end

# words = "the flintstones rock"
# p titleize(words)
# p words

# 10. 
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  case details["age"]
  when (..17)
    details["age_group"] = "kid"
  when (18..64)
    details["age_group"] = "adult"
  when (65..)
    details["age_group"] = "senior"
  end
end

p munsters
