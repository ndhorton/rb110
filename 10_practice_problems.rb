# Practice Problems: Methods and More Methods

# 1. `Array#select` will iterate through the calling collection passing each element in turn to the block.
# `select` uses the return value of the block for purposes of selection, returning a new array
# containing those elements from the caller whose block iterations returned a truthy value. 
# The last evaluated expression in this `select` invocation's block is a String object, which
# evaluates as true in a boolean context. Therefore, this `select` invocation will return
# a new array whose elements are all the elements from the calling array.

# 2. `count` when invoked with a block considers the truthiness of the block return value.
# This information can be found in the Ruby documentation. This code returns `2` since two
# elements cause `str.length < 4` to return Boolean object `true`.

# 3. This `reject` invocation returns a new array containing all elements from the calling
# array. This is because `reject` performs selection by considering the truthiness of the
# block return value and selecting only those elements whose block return value is falsey
# for inclusion in the new array that it will return. Since the block here has as its only
# expression an invocation of `puts`, and `puts` always returns `nil`, which evaluates
# as false in a Boolean context, every block returns a falsey value and therefore all will
# be selected for inclusion in the new array.

# 4. This `each_with_object` invocation will return the hash object
{ "a" => "ant", "b" => "bear", "c" => "cat" }
# because this method returns the object passed as argument (here an empty hash); "this
# object becomes available within the block for mutation."
# The block adds a key-value pair to this hash object on each iteration such that
# the key is the first character of the string object passed to the block and the value
# is the entire string object.

# 5. Calling `shift` on a hash object destructively removes and returns as a new two-element array object
# the first key-value pair that was inserted in the hash. If the hash is empty, the default value
# will be returned. This information can be found in the docs. Since Ruby 1.9, hash order
# of insertion has been retained.

# 6. This statement returns `11` because `pop` destructively removes and returns
# the last element from the calling array `caterpillar` and the `size` method which
# is chained on the return value will return the integer representation of the number
# of characters in the string.

# 7. The block return value is the return value of `odd?` called on the element currently
# referenced by `num`. The return value of the block is determined by the last evaluated
# expression in the block definition.
# Since `any?` returns Boolean object `true` if any block iteration returns a truthy value,
# and the first element will cause `odd?` and then the block to return `true`, this invocation
# of `any?` will return `true`.
# The `puts` invocation on line 2 will output to screen a string representation of the element
# currently referenced by the block parameter `num` on each iteration...

# correction: however, since `any?` returns after the first block iteration here, only the first
# element's `puts` invocation will actually execute. So this code only outputs `1` to screen.

# 8. The non-destructive `take` method returns a new array containing as many leading
# elements from the calling array as is specified by the integer argument. This information
# can be found in the Ruby documentation.

# 9. This invocation of `Enumerable#map` returns a new array object `[nil, "bear"]`.
# The `map` method iterates through the calling hash passing each key object to the
# block to be assigned to the block parameter `key` and each value object to be assigned to `value`.
# The return value of each element's block iteration is used for purposes of transformation;
# `map` returns a new array object whose elements are the return values for each block iteration
# for each key-value pair in the calling hash. The `if` statement in the block checks if
# the integer return value of calling `size` on the object currently referenced by `value`
# is greater than `3`; if so, the statement returns `value` and since this is the last
# evaluated expression in the block, this will form the block return. However, since there
# is no `else` branch and no other code in the block, for any element, like the first here, where
# this condition is not met, the if statement and therefore the block will return `nil`.

# "When none of the conditions in an `if` statement evaluates as true, the `if` statement itself
# returns `nil`"

# 10. This `Array#map` invocation returns a new array object `[1, nil, nil]`.
# `Array#map` iterates through the calling array passing each element in turn to the block
# to be assigned to block parameter `num`. The return value of each block iteration is then
# used for purposes of transformation. `map` returns a new array object whose elements
# are the objects returned by the block for each element's block iteration.
# The block definition consists of an `if...else` statement which checks if the
# integer currently referenced by `num` is greater than `1`. If so, `num` is passed as argument
# to the `puts` method, which always returns `nil`. Thus for elements greater than `1`, this block
# returns `nil`, as there is no code after the `if` statement.
# If the element is not greater than `1`, the `else` branch expresses `num`, which forms the block
# return value for elements less than or equal to `1`.
# Therefore, the first element `1` will be returned by its block iteration and added to the new array
# while the block iterations for the rest of the elements which are greater than `1` will return `nil`.