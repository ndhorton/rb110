# Hash Methods

# all?, any?

# (each, each_pair), each_key, each_value

# empty?
# include?, key?, value?

# key

# keys, values
# map

# select, select!

# all?
# ----
# Enumerable#all? - when called on a hash, the `all?` method
# seems to need to be called with a block. (Although it can
# technically be called on a hash without a block, the utility 
# of doing so is a great deal more limited than when called on
# an array.

# Called with a block on a hash, `all?` passes each key object and 
# value object to the block to be assigned to block parameters.
# The `all?` method will return `true` if the block never returns
# `false` or `nil`. The `all?` method will instead return `false`
# if -- and as soon as -- any of the block iterations return `false`
# or `nil`.

# NB: for ARRAYS, the `all?` method can be called with no arguments
# and no block and will return `true` if all elements are truthy
# or `false` if any element is not truthy. For arrays, `all?` 
# can also be called with a pattern argument, in which case,
# each element will be compared with the pattern using the
# appropriate `===` method for that pattern object.

# For HASHES, this is not the case. `all?` without an argument or block
# will always return `true` regardless of the contents of the hash.
# The reason for this seems to be that calling `all?` with no argument
# or block will call the method with an implicit block:
# `{ |object| object }`. When it is called on a hash, there are two
# arguments passed to the explicit or implicit block, a key and a value.
# Since the implicit block contains only one parameter, presumably the
# key object and value object are wrapped in an array object that
# is then assigned to the parameter variable. Since an array is truthy,
# the block will always return `true`, regardless of the truthiness of
# its elements.

# For the same reason, the pattern argument passed to the `all?` method
# when called on a hash will be compared using `===` to a two element
# array consisting of the key object at index `0` and the value object
# at index `1`. In practice, it is difficult to see the utility of this.

animals = {
  salamander: "reptile",
  iguana: "reptile",
  bear: "mammal",
  lion: "mammal",
  parakeet: "bird"
}

p animals.all? { |animal, classification| classification.size > 3 } # true
p animals.all? { |animal, classification| animal.is_a?(Symbol) }    # true

# `puts` in the block demonstrates 'short circuit'-like behaviour
p (animals.all? do |animal, classification|                         # false
  puts classification
  classification.start_with?('r')
end)

# any?
# ----

# Hash#any? - called with no argument and no block, `any?` returns `false` if
#             the calling hash is empty, `true` otherwise

p animals.any? # true
p({}.any?)     # false

#           - called with a two-element array passed as argument and no block,
#             `any?` returns `true` if there is a key-value pair in the hash
#             such that the key == the first element of the argument array
#             and the value == the second element of the argument array
#             Presumably the syntax must be thus because of a similar implicit block
#             (when called without explicit block) to the `Enumerable#all?` method

p animals.any?([:lion, "mammal"])   # true
p animals.any?([:beetle, "insect"]) # false

#           - called with a block, the `any?` method iterates through each key-value
#             pair, passing the key and value objects to the block to be assigned to
#             parameters. `any?` returns `true` as soon as any block returns a truthy value,
#             false otherwise

p animals.any? { |animal, classification| classification.start_with?('m') }  # true
p animals.any? { |animal, classification| classification.start_with?('i') }  # false

# demonstrates short circuit-like behaviour
p (animals.any? do |animal, classification|
  puts "#{animal}: #{classification}"
  animal == :bear
end)

# each (aliased as each_pair)
# ----

# Hash#each - for each key-value pair in turn, `each` passes the key and value objects
#             to the block to be assigned to parameters and executes the block;
#             the block return value is ignored; `each` returns the calling hash

animals.each { |animal, classification| puts animal }

# each_pair (alias for each)
# ---------
# Hash#each_pair - alias for `Hash#each`

animals.each_pair { |animal, classification| puts animal }

# each_key
# --------

# Hash#each_key - for each key-value pair in turn, `each_key` passes the key object to the block
#                 to be assigned to a parameter and executes the block;
#                 block returns are ignored; method returns the calling hash

animals.each_key { |animal| puts animal }

# each_value
# ----------
# Hash#each_value - for each key-value pair in turn, `each_value` passes the value object to the
#                   block to be assigned to a parameter and calls the block;
#                   block returns are ignored; the method returns the calling hash

animals.each_value { |classification| puts classification }

# include? (aliased as key?, member?, has_key? - of these, prefer key?, include? or member?)
# --------
# Hash#include? - returns `true` if the given key argument is a key in the calling hash,
#                 false otherwise
#                 Unlike `Enumerable#include?` the hash version does not test equality using `==`

p animals.include?(:iguana) # true
p animals.include?(:cat)    # false

# key? (alias for include?)
# ----

# Hash#key - preferred alias for Hash#include?

# value? (prefer value? to alias has_value?)
# ------

# Hash#value - returns `true` if the given object is equal to the value part of
#              any key-value pair in the hash

p animals.value?('reptile')   # true
p animals.value?('marsupial') # false

# key
# ---

# Hash#key - returns the key of an occurrence of a value equal to the object passed
#            as argument; returns `nil` if no such value found

p animals.key('mammal') # probably :bear, since first key for this value in insertion order
                        # but not clear if that ordering is guarenteed even post-1.9

p animals.key('insect') # nil

# keys
# ----
# Hash#keys - returns a new array populated by all the keys from the calling hash
p animals.keys

# values
# ------
# Hash#values - returns a new array populated by all the values from the calling hash
p animals.values

# map
# ---

# Enumerable#map - iterates through the calling hash passing each key-value pair to the
#                  block; you can assign the key and value objects to separate block parameters
#                  but if combining with e.g. `#with_index` then it is necessary to use
#                  parentheses to split the 2-element array containing the key and value
#                  e.g `|(key, value), index|`. If no other block paramter is needed,
#                  then `|key, value|` will work fine.
#                  `map` uses the block return value for purposes of transformation,
#                  returning a new array object whose elements are the objects returned
#                  by each key-value pair's block iteration.
# NB: It is important to remember that `map` returns an array rather than a hash, even
# when called on a hash. For instance, destructive `map!` cannot be called on a hash;
# in order to mutate an Array in place, one must actually be operating on an Array object
# to begin with.

p animals.map { |animal, classification| animal.to_s.capitalize }

# select (aliased as filter)
# ------
# Hash#select - `select` iterates through the calling hash passing each key-value pair
#               to the block to be assigned to parameters; `select` considers the truthiness
#               of each block return value for purposes of selection; `select` returns
#               a new Hash object populated with the key-value pairs from the caller
#               whose block iterations returned truthy values

p animals.select { |animal, classification| classification != "reptile" }

# select! (aliased as `filter!`)
# ------
# Hash#select! - the destructive `select!` method iterates through the calling hash
#                passing each key-value pair in turn to the block to be assigned
#                to parameters; `select!` considers the truthiness of the return value
#                of each block for purposes of selection; `select!` mutates the calling
#                hash so that only those key-value pairs whose block iteration returned
#                a truthy value remain; `select!` returns a reference to the calling hash,
#                or `nil` if no changes were made (i.e. every block returned a truthy value)

# NB: `Hash#keep_if` is similar to `select!` but not quite an alias in that
#      `keep_if` always returns a reference to the calling hash even if no changes were made 
#      to the calling hash (whereas `select!` returns `nil` in that eventuality)

animals.select! { |animal, classification| classification == "mammal" }
puts animals
