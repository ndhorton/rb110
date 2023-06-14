# 1
# arr = ['10', '11', '9', '7', '8']

# p arr.sort { |a, b| b.to_i <=> a.to_i }

# 2
# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]

# p books.sort { |a, b| a[:published].to_i <=> b[:published].to_i }

# # LS solution
# # In this case, since the strings are all 4 chars in length, it is actually
# # unnecessary to call `to_i` on them
# p books.sort_by { |hsh| hsh[:published] }

# 3
# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

# p arr1[2][1][3]

# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

# p arr2[1][:third][0]

# arr3 = [['abc'], ['def'], {third: ['ghi']}]

# p arr3[2][:third][0][0]

# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

# p hsh1['b'][1]

# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

# p hsh2[:third].key(0)

# 4

# arr1 = [1, [2, 3], 4]

# p arr1[1][1] = 4

# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

# p arr2[2] = 4

# hsh1 = {first: [1, 2, [3]]}

# p hsh1[:first][2][0] = 4

# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

# p hsh2[['a']][:a][2] = 4

# 5.

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# male_age_total = munsters.values.reduce(0) do |acc, details|
#   (details["gender"] == "male" ? acc + details["age"] : acc )
# end

# p male_age_total

# # LS solution

# total_male_age = 0
# munsters.each_value do |details|
#   total_male_age += details["age"] if details["gender"] == "male"
# end
# p total_male_age

# 6.
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# munsters.each do |name, details|
#   puts "#{name} is a #{details["age"]}-year-old #{details["gender"]}."
# end

# 7.

# a == 2, b == [3, 8]

# 8.

# VOWELS = 'aeiouAEIOU'

# hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# hsh.each_value do |words|
#   words.each do |word|
#     word.each_char { |char| puts char if VOWELS.include?(char) }
#   end
# end

# 9.
# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# p (arr.map do |subarray|
#   subarray.sort { |a, b| b <=> a}
# end) 

# 10.
# array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# p (array.map do |hash|
#   hash.map { |key, value| [key, value + 1] }.to_h
# end)

# # LS solutions

# p(array.map do |hsh|
#   incremented_hash = {}
#   hsh.each do |key, value|
#     incremented_hash[key] = value + 1
#   end
#   incremented_hash
# end)

# p(array.each_with_object([]) do |hsh, arr|
#   incremented_hash = {}
#   hsh.each do |key, value|
#     incremented_hash[key] = value + 1
#   end
#   arr << incremented_hash
# end)

# 11.
# arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

# p (arr.map do |sub_arr|
#   sub_arr.select { |element| element % 3 == 0 }
# end)

# 12.
# arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# # expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# p (arr.each_with_object({}) do |sub_arr, hsh|
#   hsh[sub_arr.first] = sub_arr.last
# end)

# # 13.
# arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

# p (arr.sort_by do |sub_arr|
#   sub_arr.select { |number| number.odd? }
# end)

# 14.
# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }
# p (hsh.map do |_, details|
#   if details[:type] == 'fruit'
#     details[:colors].map(&:capitalize)
#   elsif details[:type] == 'vegetable'
#     details[:size].upcase
#   end
# end)

# 15.
# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# p (arr.select do |hsh|
#   hsh.values.all? do |sub_arr|
#     sub_arr.all? do |integer|
#       integer.even?
#     end
#   end
# end)

# 16.
HEX_CHARS = [*('0'..'9')] + [*('a'..'f')]
UUID_STRUCTURE = [8, 4, 4, 4, 12]

def hex_string(n)
  string = ''
  n.times { |_| string << HEX_CHARS.sample }
  string
end

def generate_uuid
  uuid_strings = UUID_STRUCTURE.each_with_object([]) do |length, arr|
    arr << hex_string(length)
  end
  uuid_strings.join('-')
end

# LS solution

def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end

p generate_UUID
p generate_uuid
