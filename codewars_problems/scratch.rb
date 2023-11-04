# require 'test/unit'
#
# class FibonacciTests < Test::Unit::TestCase
#   def test_fibonacci
#     assert(fibonacci(3) == 2, "Test first non-base case Fibonacci number")
#     assert_equal(fibonacci(3), 2, "Test first non-base case Fibonacci number")
#     assert(fibonacci(30) == 832040, "Test higher input")
#   end
# end
#
# class PoemTests < Test::Unit::TestCase
#   def test_poem_class_hangs_on_to_data
#     the_text = <<-_HEREDOC_
#     April is the cruellest month, breeding
#     Lilacs out of the dead ground, mixing
#     Memory and desire, stirring
#     Dull roots with Spring rain.
#     _HEREDOC_
#     waste_land = Poem.new(
#       "Eliot, Thomas Stearn",
#       "The Waste Land",
#       1922,
#       the_text
#     )
#
#     assert(waste_land.title == 'The Waste Land', "test Poem class retains title")
#     assert(waste_land.author == "Eliot, Thomas Stearn", 'test Poem class retains author')
#     assert(waste_land.date == 1922, "test Poem class retains date")
#     assert(waste_land.text == the_text, "test Poem class retains text of poem")
#   end
# end
#
# class Poem
#   attr_reader :author
#   attr_reader :title
#   attr_reader :date
#   attr_reader :text
#   def initialize(author, title, date, text)
#     @author = author
#     @title = title
#     @date = date
#     @text = text
#   end
# end
#
# def fibonacci(n)
#   return 1 if n < 3
#   fibonacci(n - 1) + fibonacci(n - 2)
# end

# def pair_sum(numbers, target_sum)
#   seen = {}
#   numbers.each do |current_number|
#     compliment = target_sum - current_number
#     return [compliment, current_number] if seen[compliment]
#     seen[current_number] = true
#   end
#   nil
# end

# def closest_pair(numbers)
#   indexes = Hash.new(0)
#   numbers.each_with_index { |number, index| indexes[number] = index }
#
#   numbers = numbers.sort
#
#   closest = [numbers[0], numbers[1]]
#   smallest_difference = (numbers[0] - numbers[1]).abs
#   (2...numbers.size).each do |index|
#     current_difference = (numbers[index - 1] - numbers[index]).abs
#     if current_difference < smallest_difference
#       smallest_difference = current_difference
#       closest = [numbers[index - 1], numbers[index]]
#     end
#   end
#
#   if indexes[closest.first] > indexes[closest.last]
#     closest.reverse
#   else
#     closest
#   end
# end
#
# p closest_pair([106, 92, 3, 99, 33, 77, 44, 22, 2])

#
# def length_of_longest_substring(s)
#   longest_length = 0
#   buffer = ''
#   s.each_char do |char|
#     p buffer
#     unless buffer.include?(char)
#       buffer << char
#       next
#     end
#     if buffer.size > longest_length
#       longest_length = buffer.size
#     end
#     buffer = char
#   end
#   if buffer.size > longest_length
#     longest_length = buffer.size
#   end
#   longest_length
# end
#
# p length_of_longest_substring("dvdf")

=begin

1234
number of digits = floor(log_10(1234)) + 1

Iterate 4 times


=end

# get digits in right order
# def digits(number)
#   return [0] if number.zero?
#   number = number.abs

#   digit_count = Math.log10(number).floor + 1
#   divisor = 10 ** (digit_count - 1)
#   result = []
#   digit_count.times do
#     digit = number / divisor
#     number %= divisor
#     divisor /= 10
#     result << digit
#   end

#   result
# end

# def digits_with_reverse(number)
#   return [0] if number.zero?
#   number = number.abs

#   result = []
#   while number > 0
#     digit = number % 10
#     number /= 10
#     result << digit
#   end

#   result.reverse
# end

# t = Time.now
# p digits(0) == [0]
# p digits(-23) == [2, 3]
# p digits(1234) == [1, 2, 3, 4]
# p digits(98765432198723746253749) == 98765432198723746253749.to_s.chars.map(&:to_i)
# p digits(2983742736545291028374629348362634927364103784) == 2983742736545291028374629348362634927364103784.to_s.chars.map(&:to_i)
# p digits(1) == [1]
# puts "#digits: #{"%.10f" % (Time.now - t)}"

# t = Time.now
# p digits_with_reverse(0) == [0]
# p digits_with_reverse(-23) == [2, 3]
# p digits_with_reverse(1234) == [1, 2, 3, 4]
# p digits_with_reverse(98765432198723746253749) == 98765432198723746253749.to_s.chars.map(&:to_i)
# p digits_with_reverse(2983742736545291028374629348362634927364103784) == 2983742736545291028374629348362634927364103784.to_s.chars.map(&:to_i)
# p digits_with_reverse(1) == [1]
# puts "#digits_with_reverse: #{Time.now - t}"

ROWS = [
  %w( q w e r t y u i o p).sort.join.freeze,
  %w( a s d f g h j k l).sort.join.freeze,
  %w( z x c v b n m).sort.join.freeze
].freeze

def find_words(words)
  result = []
  words.each do |word|
    sorted_word = word.downcase.chars.uniq.sort.join
    if ROWS.any? { |row| /#{sorted_word}/ }
      result << word
    end
  end
  result
end
