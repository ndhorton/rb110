# Selection with looping

# alphabet = 'abcdefghijklmnopqrstuvwxyz'
# selected_chars = ''

# counter = 0
# loop do
#   current_char = alphabet[counter]

#   if current_char == 'g'
#     selected_chars << current_char # appends current_char into the selected_chars array
#   end

#   counter += 1
#   break if counter == alphabet.size
# end

# selected_chars

# Transformation with looping

# fruits = ['apple', 'banana', 'pear']
# transformed_elements = []
# counter = 0

# loop do
#   current_element = fruits[counter]

#   transformed_elements << (current_element + 's') # appends transformed element into transformed_elements array
  
#   counter += 1
#   break if counter == fruits.size
# end

# transformed_elements

# Extracting to Methods

# def select_vowels(str)
#   selected_chars = ''
#   counter = 0

#   loop do
#     current_char = str[counter]

#     if 'aeiouAEIOU'.include?(current_char)
#       selected_chars << current_char
#     end

#     counter += 1
#     break if counter == str.size
#   end

#   selected_chars
# end

# p select_vowels('hello')

# def select_fruit(produce)
#   produce_keys = produce.keys
#   fruits = {}
#   counter = 0

#   loop do
#     break if counter >= produce_keys.size

#     current_key = produce_keys[counter]
#     current_value = produce[current_key]
#     if produce[current_key] == 'Fruit'
#       fruits[current_key] = current_value
#     end
#     counter += 1
#   end

#   fruits
# end

# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# def double_numbers(numbers)
#   doubled_numbers = []
#   counter = 0

#   loop do
#     break if counter == numbers.size

#     current_number = numbers[counter]
#     doubled_numbers << current_number * 2

#     counter += 1
#   end
  
#   doubled_numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]

# def double_numbers!(numbers)
#   counter = 0

#   loop do
#     break if counter >= numbers.size

#     numbers[counter] *= 2
    
#     counter += 1
#   end

#   numbers
# end

# numbers = [3, 9, 27, 81, 243]
# p numbers
# p numbers.object_id
# double_numbers!(numbers)
# p numbers
# p numbers.object_id

# def double_odd_numbers(numbers)
#   doubled_numbers = []
#   counter = 0

#   loop do
#     break if counter == numbers.size
#     current_number = numbers[counter]
#     current_number *= 2 if current_number.odd?
#     doubled_numbers << current_number

#     counter += 1
#   end

#   doubled_numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_odd_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]

# # not mutated
# p my_numbers                      # => [1, 4, 3, 7, 2, 6]

# def double_odd_indexed_numbers(numbers)
#   result = []

#   counter = 0
#   loop do
#     break if counter >= numbers.size
#     current_number = numbers[counter]
#     current_number *= 2 if counter.odd?
#     result << current_number
#     counter += 1
#   end

#   result
# end

# p double_odd_indexed_numbers([1, 2, 3, 4, 5, 6])

# def general_select(produce_list, selection_criteria)
#   produce_keys = produce_list.keys
#   counter = 0
#   selected_produce = {}

#   loop do
#     break if counter >= produce_keys.size
    
#     current_key = produce_keys[counter]
#     current_value = produce_list[current_key]
    
#     if current_value == selection_criteria
#       selected_produce[current_key] = current_value
#     end
    
#     counter += 1
#   end

#   selected_produce
# end

# def selector(array)
#   selected_elements = []
#   counter = 0
#   loop do
#     break if counter >= array.size
    
#     current_element = array[counter]

#     if yield(current_element)
#       selected_elements << current_element
#     end

#     counter += 1
#   end
#   selected_elements
# end

# def mapper(array)
#   transformed_array = []
#   counter = 0
#   loop do
#     break if counter >= array.size

#     transformed_array << yield(array[counter])

#     counter += 1
#   end
#   transformed_array
# end

# p (mapper([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]) do |element|
#   element * element
# end)

# p (selector([1, 2, 3, 4, 5]) do |element|
#   element > 2
# end)

# def multiply(numbers, criteria)
#   transformed_numbers = []
#   counter = 0
#   loop do
#     break if counter >= numbers.size
#     current_number = numbers[counter]
#     current_number *= criteria
#     transformed_numbers << current_number
#     counter += 1
#   end
#   transformed_numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p multiply(my_numbers, 3)

# def select_letter(sentence, character)
#   selected_chars = ''
#   counter = 0

#   loop do
#     break if counter >= sentence.size
#     current_char = sentence[counter]

#     if current_char == character
#       selected_chars << current_char
#     end

#     counter += 1
#   end
  
#   selected_chars
# end

# question = 'How many times does a particular character appear in this sentence?'

# p select_letter(question, 'a').size
# p select_letter(question, 't').size
# p select_letter(question, 'z').size

# alphabet = 'abcdefghijklmnopqrstuvwxyz'

# for char in alphabet.chars do
#   puts char
# end
