# Find the Mine!

=begin
Notes:

Problem:
input: a 2D array, whose inmost elements are integer 0s except for one 1
output: the location [row, column] of the 1 as an array

  Write a method that takes an array of arrays and returns a new
  array containing the [row index, column index] of the location
  of a mine in the input grid

rules:
  there will only be one mine in the array
  will there always be a mine? Yes


Examples and test cases:

0 0 0 0
0 0 0 0
0 0 1 0
0 0 0 0

0 0 0
0 0 0
0 1 0

Data structures:

Algorithm:
Given an array of arrays, field
Iterate through each row in field with index, row_index
  Iterate through each column in row with index, column_index
    If column == 1
      Return an array whose first elment is the row_index
        and whose second is the column_index
=end

def mineLocation(field)
  field.each_with_index do |row, row_index|
    row.each_with_index do |column, column_index|
      return [row_index, column_index] if column == 1
    end
  end
end

# if the array were a flat array representing a 2d array
def mineLocation(field)
  number_of_columns = field.first.size
  field = field.flatten
  location = nil
  field.each_with_index do |square, index|
    location = index if square == 1
  end
  row, column = location.divmod(number_of_columns)
  [row, column]
end

p mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]
p mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
p mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]
p mineLocation([ [1, 0], [0, 0] ]) == [0, 0]
p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]
p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 1, 0, 0] ]) == [3, 1]

# 9:40
