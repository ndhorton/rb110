## Hash ##

`Hash[]`, 

`Hash#fetch` - Unlike `Hash#[]`, which returns `nil` if the key argument is not found in the calling hash, `fetch` called without a block or an additional argument will throw a `KeyError` exception. `fetch` can accept an additional argument, which will be returned as a signal value if the key argument is not found instead of raising an exception. If only a key argument is passed and a block is passed, the key argument will be passed to the block if the key is not found.

`Hash#key`

`Hash[]=` and further syntactic sugar `+=`, `-=`, `*=`, `/=`, `%=`

```ruby
hash = { a: 1, b: 2, c: 3 }

hash[:b] += 5
p hash
```

On line 1, local variable `hash` is initialized to the hash `{ a: 1, b: 2, c: 3 }`. 

Next, on line 3, the value associated with key `:b` is updated using `+=` syntactic sugar to add `5` to the existing integer value and update the key to associate to this new integer value.

```ruby
structure = { data: [{a: 1, b: 2}, {c: 3, d: 4, e: 5}] }

structure[:data][0][:b] += 5
```

On line 1, local variable `structure` is initialized to the hash `{ data: [{a: 1, b: 2}, {c: 3, d: 4, e: 5}] }`.

On line 3, the `Hash#[]` element reference method is called with `:data` passed as argument. This returns the value-object associated with the key `:data`, the array `[{a: 1, b: 2}, {c: 3, d: 4, e: 5}]`. Chained on this return value is a call to `Array#[]` with `0` passed as argument, returning the element at index `0`, the hash `{a: 1, b: 2}`. Chained on this is a call to `Hash#[]=` with `:b` passed as the key argument. `+=` syntactic sugar is used to update the integer associated with key `:b`, adding `5` to the existing integer value and associating the key `:b` to this new integer value.

```ruby
structure = { data: [{a: 1, b: 2}, {c: 3, d: 4, e: 5}] }

structure[:data][0][:b] %= 2
```

Chained on this return value is a call to `Hash#[]=` with `:b` passed as the key argument. `%=` syntactic sugar is used to update the value associated with `:b`, calling the modulo operator method on the currently associated value with `2` passed as argument and then associating `:b` to the return value of the modulo operation, `0`.



`Hash#keys`, `Hash#values`

`Hash#each`, `Hash#each_key`, `Hash#each_value`

`Enumerable#map`

`Hash#select`, `Hash#select!`

`Hash#empty?`, `Hash#include?` / `Hash#key?`, `Hash#value?`

`Hash#any?`, `Enumerable#all?`

## Array ##

`Array#[]` / `Array#slice`, 

`Array#fetch` - called with only an index argument and no block, `fetch` will raise an `IndexError` if the index is not found to be within the bounds of the array. If a second positional argument is given, the object passed as second argument will be returned if the index is not within bounds. If an index argument and a block are given, then an out-of-bounds index argument is passed to the block.

`Array#first`, `Array#last`

`Array#slice!`, `Array#pop`, `Array#shift`

`Array#[]=` and further syntactic sugar `+=`, `-=`, `*=`, `/=`, `%=`, `Array#push`, `Array#unshift`

`Array#reverse`, `Array#reverse!`, `Array#join`

`Array#each`, `Array#each_with_index`, `Enumerable#each_with_object`

`Array#map`, `Array#map!`

`Array#select`, `Array#select!`

`Enumerable#partition` - returns a new array object containing two sub-arrays, the first of which contains only those elements from the caller whose block returned a truthy value, the second of which contains those elements whose block returned `false` or `nil`.

`Array#include?`

`Array#all?`, `Array#any?`

`Array#sort`, `Array#sort!`

## String ##

`String#[]`, `String#slice` `String#slice!`, `String#reverse`, `String#reverse!`, `String#downcase`, `String#downcase!`, `String#upcase`, `String#upcase!`, 

`String#strip`, `String#strip!`, removes leading or trailing whitespace, destructively with a `!`, returning new stripped string in the non-destructive form.

`String#concat` - mutating form of string concatenation, destructively appends one or more string arguments to the caller. Arguments are appended in the order they are given.

`String#size`, `String#count`

`String#include?`

`String#split`, `String#chars`

`String#freeze` - the `freeze` method will change the state of the caller so that the caller becomes frozen, which means it can no longer be mutated; calling a mutating method on a frozen object will raise a `FrozenError`.

`String#replace`

`String#replace` - `replace` is a mutating method that replaces the value of the caller with the value of the object passed as argument, while the `object_id` of the caller remains the same. If the object passed as argument has a value that cannot replace the value of the caller, e.g. a String caller and an Integer argument, then a `TypeError` will be raised.

`String#freeze` - The `freeze` method causes the caller to take on a frozen state. This means that the calling object can no longer be mutated. Immutable objects are considered always-frozen since they cannot be mutated. `freeze` only freezes the object on which it is called, not the elements within a collection.

## Integer ##

`Integer#times`

## Other Stuff ##

Iteration, keywords 

`break` - the `break` keyword breaks out of the current block or loop. `break` can accept an argument that forms the return value of the overall expression. Used in the block given to a method invocation, `break` breaks out of the entire method invocation with block expression, not merely the current block iteration.

`next` - the `next` keyword skips to the next iteration. `next` can accept an argument that will be used as the return value of the current block iteration 

Selection, Transformation

**Nested Data Structures, Nested Iteration**

A nested data structure is a collection that contains other collections. An outermost collection may contain collections, which may contain collections, and so on.

If we need to iterate over all the innermost elements in a nested data structure, it becomes necessary to nest iterator methods with blocks, taking care to match the layers of nested iteration to the layers of nesting in the data structure.



**Shallow Copy and Deep Copy**

The methods `dup` and `clone` both return a shallow copy of a collection object. This means that the returned collection will be a new object of the caller's class, but the elements of the new collection will be the same objects referenced by the calling collection. The elements are shared between the original collection object and the new copy. A deep copy would mean that, in addition to making a copy of the collection object, all elements in the original collection would be copied, forming new objects in the new collection; there is no equivalently-simple method for making a deep copy of a collection in Ruby.

The principal difference between `dup` and `clone` is that `clone` preserves the frozen state of a frozen object while `dup` does not.

**Method Chaining** - In Ruby, since every method returns a value, another method call can be chained on the return value of a previously called method. Another method can be chained on that return value, and so on. For example,

```ruby
str = "so much depends upon"

str2 = str.split.reverse.join(' ')
puts str2 # upon depends much so
```

Method chaining is particularly useful in referencing, updating or inserting nested elements in a nested data structure:

```ruby
structure = [[{a: 1}, {b: 2}], [{c: 3, d: 4}]]

letter = structure[0][1].key(2)
p letter # :b
```

