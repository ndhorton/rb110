# Array Methods
# =============
=begin

Iteration
=========

each - The non-destructive `Array#each` method iterates through the elements in the calling collection
passing each element in turn to the block to be assigned to the block parameter. The
return value from the block is ignored. After the final block iteration, `each` returns
a reference to the calling collection. If called without a block, `each` returns an Enumerator
object.

=end

animals = %w( tapir agouti capybara sloth armadillo )

animals.each { |animal| puts animal }

numbers = [1, 2, 3, 4, 5]
total = 0
numbers.each do |number|
  total += number
end
puts total

=begin

(Enumerable#)each_with_index - The non-destructive `Enumerable#each_with_index` method iterates through the elements in the
calling collection passing each element in turn to be assigned to the first block parameter;
the second block parameter is assigned to the element's integer index, starting from 0. When called
without a block, the method returns an Enumerator object.

=end

animals = %w( tapir agouti capybara sloth armadillo )

animals.each_with_index do |animal, index|
  puts "#{index + 1}. #{animal.capitalize}"
end

numbers = [1, 2, 3, 4, 5, 6]

odd_indexed_elements = []
numbers.each_with_index do |number, index|
  odd_indexed_elements << number if index.odd?
end

p odd_indexed_elements

=begin

(Enumerable#)each_with_object - The `Enumerable#each_with_object` method takes one argument
and a block. The method iterates through the calling collection passing each element, along with
the object passed as argument, to the block to be assigned to block parameters. The return value
of the block is ignored. When iteration has finished, `each_with_object` returns the object
passed as argument. The `each_with_object` method does not mutate the caller, though often
the object passed as argument will be mutated by operations in the block.

=end

animals = %w( tapir agouti capybara sloth armadillo )

character_counts = animals.each_with_object({}) do |animal, hash|
  hash[animal] = animal.length
end

p character_counts

=begin

map - The non-destructive `Array#map` method iterates through the calling collection passing each
element in turn to be assigned to the block parameter. The method uses the block return
value for purposes of transformation, returning a new array object whose elements are
the objects returned by each element's block iteration.

map! - The destructive `map!` method works similarly to `map` but mutates the calling array rather than
returning a new array object. The method uses the block return value for purposes of transformation,
replacing each element in the calling collection with the object returned by the block for that
element's block iteration.

=end

animals = %w( tapir koala manitee bear sloth gorilla )

formatted_animals = animals.map { |animal| animal.capitalize }

p formatted_animals
p animals

animals.map! { |animal| animal.upcase }
p animals

=begin

select - The non-destructive `Array#select` method iterates through the calling collection passing
each element in turn to be assigned to the block parameter. The method uses the truthiness
of the block return value for purposes of selection, returning a new array object whose
elements are the elements from the calling collection whose block returned a truthy value.

select! - The `Array#select!` method workds similarly to `select` except that `select!`
mutates the calling collection rather than returning a new array. The method uses the truthiness
of the block return value for purposes of selection, destructively removing those elements from the calling
collection whose block did not return a truthy value.

=end

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

odd_numbers = numbers.select { |number| number.odd? }

p numbers
p odd_numbers

numbers.select! { |number| number.even? }

p numbers

=begin

(Enumerable#)partition - The non-destructive `Enumerable#partition` method iterates through the calling
collection passing each element in turn to be assigned to the block parameter. The method
uses the truthiness of the block return value in order to return a new array containing two subarrays,
the first of which contains those elements from the caller whose block iteration returned a truthy value,
and the second of which contains those elements whose block iteration did not return a truthy value.

=end

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
odd_numbers, even_numbers = numbers.partition do |number|
  number.odd?
end

puts "odd: #{odd_numbers}"
puts "even: #{even_numbers}"


=begin

first - non-destructively returns the first element in the calling collection. When
given the integer argument n, returns the first n elements in a new array object

=end

animals = %w(cat sloth tapir giraffe)

p animals.first # => "cat"
p animals.first(3) # => ["cat", "sloth", "tapir"]

=begin

last - non-destructively returns the last element in the calling collection. When
given the integer argument n, returns the last n elements in a new array object.

=end

p animals.last # => "giraffe"
p animals.last(3) # => ["sloth", "tapir", "giraffe"]

=begin

fetch - non-destructively returns the element from the calling collection referenced
by the integer argument; if there is no such index, `fetch` will raise an IndexError.
(This is unlike the `Array#[]` element reference method, which silently returns `nil` if the
index passed as argument is out-of-bounds). If a second argument is passed, this object
will be returned if the index is out-of-bounds. If a block is given, in the event of
an index being out-of-bounds the index argument is passed to the block and the method
returns the return value of the block.

=end

animals = %w(giraffe tapir gibbon mantis)

p animals.fetch(39, 'default') # => "default"
p animals.fetch(39) { |index| index * 10 } # => 390
# animals.fetch(39) # => Raises an IndexError

=begin

slice - also `Array#[]`.
  - with one integer argument, non-destructively returns the element at the
  index given by the integer argument. `slice` returns `nil` if the index
  is out-of-bounds

  - with two integer arguments, `start` and `length`, returns a new array of `length` elements
  starting with the element at index `start`. returns `nil` if `start` is out of bounds 
  EXCEPT AND THIS IS REALLY WEIRD when the `start` index is out-of-bounds by only `1` element, i.e.,
  when `start` == array.size, AND `length` >= 0, in which case `slice` returns an empty array. If
  the `length` is larger than the count of remaining elements in the array, the excess value is simply ignored.

  - with a range, returns the elements indicated by the range. Again, if the start of the range is
  out-of-bounds only by `1` element (== array.size), `slice` returns an empty array instead of `nil`.
  If the range extends past the valid range of elements, the excess is simply ignored.

slice! - destructively removes AND returns as a new array the slice of elements from the array. This
         mutates the caller AND returns a new array containing the destructively removed elements
=end

animals = %w(ferret weasel chipmunk stoat)

p animals.slice(2)

p animals.slice(1, 2)

p animals.slice(1..2)

p animals.slice(1...3)

p animals[2]

p animals[1, 2]

p animals[1..2]

p animals.slice(4)

p animals.slice(4, 1)

p animals.slice(4..4) # 4 == animals.size, returns empty array

p animals.slice(5..5) # returns nil

sliced_arr = animals.slice!(0..1)
p sliced_arr
p animals

=begin

pop - destructively removes and returns trailing elements. When no argument is given,
      destructively removes and returns last element. When an integer argument `n` given,
      destructively removes and returns in a new array the last `n` elements.
      If the array is empty, returns `nil`. If the argument `1` is given, the last element
      will be returned in a new array; if no argument given, the last element will be returned as-is.
      When the integer argument exceeds the number of elements in the array, the excess is simply ignored.

push - destructively appends argument objects to the back of the calling array. Returns reference to self.

shift - destructively removes and returns leading elements. When no argument is given,
        destructively removes and returns first element. When an integer argument `n` given,
        destructively removes and returns in a new array the first `n` elements.
        If the array is empty, returns `nil`. If the argument `1` is given, returns first element
        in a new array; when no argument given, returns first element as-is. When the integer argument
        exceeds the number of elements in the array, the excess is simply ignored.

unshift - destructively prepends argument objects to the front of the calling array. Returns a reference
          to self
=end

array = ['h', 'l', 'l', 'o', 'e']
array2 = []
array2.push(array.pop)
array2.unshift(array.shift)
p array2
array.unshift(array2[0], array2[1])
p array

=begin

include? - returns `true` if, for the given argument `object`, there is an `element` in the
          caller such that `object == element`; false otherwise

=end

animals = %w(bear eagle mule tapir)

if animals.include?('tapir')
  puts "Found him"
else
  puts "Nowhere to be seen"
end

=begin

all? - when called with a block, `Array#all?` iterates through the calling collection passing each element
      in turn to the block. `all?` returns `true` if every block iteration returns a truthy value.
      `all?` returns `false` as soon as any block iteration returns a falsey value. This can cause
      short-circuiting behaviour.
  - with only an `object` argument given, returns `true` if for every `element` in the collection,
    `element == object`, returns `false` otherwise.
  - if no argument given, returns `true` if all objects in the collection evaluate as true
    in a boolean context, `false` otherwise. If the collection is empty, returns `true`

any? - when called with a block, `Array#any?` iterates through the calling collection passing each element
      in turn to the block. `any?` returns `true` as soon as any block iteration returns a truthy value. This
      can cause short circuiting behaviour.
      - when called with an argument `object`, returns `true` if there is any `element` in the collection
      such that `element == object`, returns `false` otherwise.
      - when called without a block or argument, returns `true` if the collection contains any object
      that evaluates as true in a boolean context, `false` otherwise.
=end

numbers = [1, 2, 3, 4, 5]

numbers.all? do |number|
  puts number    # will only print `1` and `2` before the falsey block return stops iteration
  number.odd?
end

numbers.any? do |number|
  puts number
  number.even?  # will only print `1` and `2` before the truthy block return stops iteration
end

=begin

reverse - non-destructively returns a new array with the elements of self in reverse order

reverse! - destructively reverses the order of elements in the calling array.

sort - non-destructive. with no block, `Array#sort` returns a new array with the elements from the caller
    sorted according to comparison of elements with the appropriate `<=>` method.
    - called with a block, `sort` will iterate through the calling collection passing pairs of
    elements to the block. For each pair of elements `a` and `b` compared by the block, the block should
    return an integer that is negative if element `b` is to follow element `a` in order,
    `0` if elements `a` and `b` are equivalent, positive if element `a` is to follow element `b` in order.
    `sort` uses these return values in order to return a new array of the elements from the caller
    sorted according to the criteria specified by the block. `sort` uses the sign of the integer
    return value of the block. `sort` will throw an error if the block returns an object that
    is not an Integer and cannot be coerced to an integer type.

sort! - destructively orders the elements of the calling collection in the same fashion as `sort`

=end

numbers = [39, 21, 6, 30, 62, 4]

p numbers.sort
p (numbers.sort { |a, b| b <=> a })

=begin

join - returns the new string formed by joining the array elements after conversion to string
       representations. For each `element`,
       - uses `element.to_s` if `element` is not an array
       - uses recursive `element.join(seperator)` if element is a `kind_of?(Array)`
       If no argument is given, joins using the output field separator, `$,`
       With a string argument, joins using that separator.
       Joins recursively for nested arrays
=end

arr = %w(hello there)
p arr.join #=> "hellothere"
p arr.join(' ') #=> "hello there"