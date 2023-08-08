# Lesson 2 #

## Sorting ##

### 1 ###

```ruby
[2, 5, 3, 4, 1].sort
```

On line 1, the `Array#sort` method is invoked on array literal `[2, 5, 3, 4, 1]`.

The `sort` method called without a block returns a new array containing the elements from the caller sorted in ascending order. `sort` achieves this by making a series of comparisons between elements calling the `<=>` comparison method appropriate to the class of elements being compared. On this `sort` invocation, `Integer#<=>` is used because `sort` has been called on an array of integers.

The `Integer#<=>` method compares the caller with the object passed as argument. If the caller is lesser than the argument, the return value of `<=>` is `-1`; if the caller and argument are equal, the return value is `0`; if the caller is greater than the argument, the return value is `1`; if the caller and argument are of classes that cannot be compared, the return value is `nil`.`sort` uses the `<=>` method's return value in order to determine the order of placement of elements in the new array it will return. A `nil` return from the `<=>` method causes `sort` to throw an `ArgumentError`. 

This invocation of `sort` therefore returns `[1, 2, 3, 4, 5]`.

This example demonstrates the effect of Ruby's `sort` method called without a block on an array of integer elements.

### 2 ###

```ruby
['c', 'a', 'e', 'b', 'd'].sort
```

On line 1, the `Array#sort` method is called on an array in literal notion `['c', 'a', 'e', 'b', 'd']`.

The `sort` method called without a block returns a new array containing the elements from the caller sorted in ascending order. `sort` achieves this by making a series of comparisons using the `<=>` method appropriate to the class of the elements being compared. This invocation of `sort` exclusively calls the `String#<=>` method since the array contains only strings.

The `String#<=>` method compares strings in a character-wise manner where ASCII table order determines the relative magnitude of a character, with characters later in the table considered greater than those placed earlier. This means that the first character in the strings is compared and if there is a difference then the method will return the result of the comparison; if the characters are the same, then the second character is compared, and so on until a difference is found, or the strings are found to be equal, or the strings are found to be equal up to the length of the shorter string, in which case the shorter string is considered lesser.

If the calling string is found to be lesser than the argument, the return value of `String<=>` is `-1`; if the caller and argument are found to be equal, the return value is `0`; if the caller is found to be greater than the argument, the return value is `1`; if the object passed as argument is not comparable to the caller, the return value is `nil`. `sort` uses the return value from `<=>` to determine the order of elements in the new array `sort` returns. A `nil` return from `<=>` causes `sort` to throw an `ArgumentError`.

This invocation of `sort` will therefore return `['a', 'b', 'c', 'd'. 'e']`.

This example demonstrates the effect of Ruby's `sort` method called without a block on an array of string elements. 

### 3 ###

```ruby
2 <=> 1
1 <=> 2
2 <=> 2
'b' <=> 'a'
'a' <=> 'b'
'b' <=> 'b' 
1 <=> 'a'
```

(1)

On line 1, the `Integer#<=>` method is invoked on integer literal `2` with `1` passed as argument. The `Integer#<=>` comparison method compares the calling integer with the argument to determine the return value: `-1` if the caller is lesser than the argument, `0` if they are equal, and `1` if the caller is greater. If the argument cannot be compared to the caller, the `<=>` method returns `nil`.

On this invocation, the caller `2` is greater than the argument `1`, so the return value will be `1`.

--5:00

(2)

On line 2, the `Integer#<=>` method is called on integer literal `1` with `2` passed as argument. The `<=>` method makes a comparison between the caller and the argument and returns a value that signals the relation between the two operands' values:  `-1` if the caller is considered lesser in value, `0` if they are equal, and `1` if the caller is greater. If the operands cannot be compared, `<=>` returns `nil`.

On this invocation, the caller `1` is lesser in numeric value than the argument `2`, so the return value will be `-1`.

--5:20

(3)

On line 3, the `Integer#<=>` method is called on integer literal `2` with `2` passed as argument. The `Integer#<=>` method makes a comparison between the caller and the argument based on numeric value in order to determine the return value: `-1` if the caller is lesser than the argument, `0` if the caller is equal to the argument, `1` if the caller is greater. If the caller and argument cannot be compared, the `<=>` method returns `nil`.

On this invocation the caller is `2` and the argument is also `2`, so the return value will be `0`.

This example demonstrates how the `Integer#<=>` method determines its return value.

--6:17

(4)

On line 4, the `String#<=>` method is invoked on string literal `'b'` with `'a'` passed as argument.

The `String#<=>` method makes a character-wise comparison between the caller and the argument based on ASCII character table order, with later positions in the table considered greater. 'Character-wise' comparison means that the characters at index `0` of the two strings are compared and if no ASCII-value difference is found between them then the characters at index `1` are compared, and so on until a difference is found. If no difference is found up to the length of the shorter string, then the longer string is considered greater. If no difference is found up to the end of equal-length strings then the strings are considered equal. Once this comparison has been made, `<=>` returns a signal value: `-1` if  the caller is found to be lesser than the argument, `0` if they are found to be equal, `1` if the caller is greater. `<=>` returns `nil` if the caller and argument cannot be compared.

Since the caller `b` is placed later in the ASCII table than the argument `a`, this invocation of `<=>` returns `1`.

This example demonstrates how `String#<=>` determines its return value.

--17:32

(5)

On line 5, the `String#<=>` method is invoked on string literal `'a'` with `'b'` passed as argument.

The `String#<=>` method makes a character-wise comparison based on ASCII character table order, with positions later in the table considered greater. 'Character-wise' comparison means that the characters at index `0` of the two strings are compared and if no difference is found then the characters at index `1` are compared, and so on until a difference is found. If no difference is found up to the length of the shorter string then the longer string is considered greater. If no difference is found in equal-length strings then the strings are considered equal. The `<=>` method uses this comparison to return a signal value: `-1` if the caller is considered lesser than the argument, `0` if they are considered equal, and `1` if the caller is greater. The `<=>` method returns `nil` if the object passed as argument cannot be compared to the caller.

On this invocation, caller `'a'` is placed before the argument `'b'` in the ASCII table so the return value of `<=>` will be `-1`.

--6:37

(6)

On line 6, the `String#<=>` method is invoked on string literal `'b'` with `'a'` passed as argument.

The `String#<=>` method makes a character-wise comparison between the caller and the argument based on ASCII character table order value, with positions later in the table considered greater. 'Character-wise' comparison means that first, the characters at index `0` of the two strings are compared, and then if no difference is found, the characters at index `1` are compared, and so on until a difference is found. If no difference is found up to the length of the shorter string, the longer string is considered greater. If no difference is found in equal-length strings, they are considered equal. The `<=>` method uses this comparison to return a signal value: `-1` if the caller is found to be lesser than the argument, `0` if they are found to be equal, and `1` if the caller is found to be greater. `<=>` returns `nil` if the object passed as argument cannot be compared to the caller.

On this invocation, the caller `'b'` is equal to the argument `'b'` and so `String#<=>` returns `0`.

This example demonstrates how the `String#<=>` method determines its return value.

(7)

On line 7, the `Integer#<=>` method is invoked on integer literal `1` with string literal `'a'` passed as argument.

The `Integer#<=>` method makes a comparison between the numeric value of the caller and the argument and returns a signal value: `-1` if the caller is found to be lesser than the argument, `0` if they are found to be equal, and `1` if the caller is found to be greater. If the object passed as argument cannot be compared to the caller, `<=>` returns `nil`.

Since the argument `'a'` is a String object, the `Integer#<=>` method cannot compare this to the integer caller and so the return value will be `nil`.

This example demonstrates how the `Integer#<=>` method determines its return value.

### 4 ###

```ruby
['a', 1].sort
```

On line 1, the `Array#sort` method is invoked on array literal `['a', 1]` without a block.

When called without a block, the `Array#sort` method returns a new array containing the elements from the caller sorted in ascending order. In order to achieve this, `sort` makes a series of comparisons between elements using the `<=>` method appropriate to the class of the elements.

The `<=>` method uses a comparison between the caller and the argument in order to return a signal value: `-1` if the caller is found to be lesser than the argument, `0` if they are considered equal, and `1` if the caller is found to be greater. If the object passed as argument cannot be compared to the caller, `<=>` will return `nil`.

If any call made by `sort` to `<=>` returns `nil`, then `sort` will throw an `ArgumentError`. Since the two elements in the calling array are a String and an Integer, these cannot be compared by either `Integer#<=>` or `String#<=>`, and whichever `<=>` method is called will return `nil` and then this invocation of `sort` will throw an `ArgumentError`.

This example demonstrates how the `sort` method uses the return value from the `<=>` method for purposes of sorting a collection; specifically it demonstrates what happens if `<=>` returns `nil`.

--7:17

### 5 ###

```ruby
[2, 5, 3, 4, 1].sort do |a, b|
  a <=> b
end
```

On line 1, the `Array#sort` method is invoked on array literal `[2, 5, 3, 4, 1]` with a `do...end` block.

When called with a block, `Array#sort` passes each pair of elements that it needs to compare to the block to be assigned to parameters, in this case `a` and `b`. `sort` then treats the return value from the block as though it were the return value of calling the `<=>` method on `a` with `b` passed as argument, `<=>` being the method that `sort` uses for comparisons if no block is given. If the return value is `-1`, then `sort` considers `a` to be lesser than `b`; if the return value is `0` then `sort` considers the elements equal; if the return value is `1` then `sort` considers `a` greater than `b`. `sort` then uses these comparisons to return a new array containing the elements from the caller ordered from least to greatest according to the values returned by the block.

Within the block, on line 2, `Integer#<=>` is called on the integer currently referenced by `a` with `b` passed as argument. `Integer#<=>` returns `-1` if the caller is lesser in numeric value than the argument, `0` if they are equal, and `1` if the caller is greater than the argument. If the argument cannot be compared to the caller, `<=>` returns `nil`.This is the only expression in the block and so forms its return value.

This invocation of `sort` with a block therefore returns a new array whose elements are in the same order they would be if `sort` had been called without the block: `[1, 2, 3, 4, 5]`

This example demonstrates how sort order is determined when Ruby's `sort` method is called with a block.

### 6 ###

```ruby
[2, 5, 3, 4, 1].sort do |a, b|
  b <=> a
end
```

On line 1, the `Array#sort` method is called on array literal `[2, 5, 3, 4, 1]` with a `do...end` block.

When called with a block, `Array#sort` passes each pair of elements that `sort` needs to compare to the block to be assigned to the parameters `a` and `b`. `sort` uses the return value from the block as though it were the return value of calling the `<=> ` method on `a` with `b` passed as argument. If the block returns `-1` then `a` is considered lesser than `b`; if the block returns `0` then they are considered equal; if the block returns `1` then `a` is considered greater. `sort` uses this series of comparisons in order to return a new array containing the elements from the caller in the order determined by the block return values.

Within the block, the `Integer#<=>` method is called on `b` with `a` passed as argument. The `<=>` method makes a comparison between the caller and the argument in order to return a signal value: `-1` if the caller is considered lesser than the argument, `0` if they are equal, and `1` if the caller is greater. `<=>` returns `nil` if the objects cannot be compared. This is the last evaluated expression in the block and so forms the return value.

When called without a block, the object referenced by `a` would be the caller in a `<=>` method invocation and `b` the argument. Here in the block, `b` is the caller and `a` is the argument, so the return value will be the numeric opposite of what `sort` would normally receive from the `<=>` method for all non-equal elements. This will have the effect of causing `sort` to return an array with the elements from the caller in descending order rather than the default ascending order. 

This invocation of `sort` with a block therefore returns `[5, 4, 3, 2, 1]`.

This example demonstrates a `sort` invocation with block; specifically, it demonstrates how to pass a block to `sort` which will reverse the normal sorting order.

--15:08



### 7 ###

```ruby
[2, 5, 3, 4, 1].sort do |a, b|
  puts "a is #{a} and b is #{b}"
  a <=> b
end
```

On line 1, the `Array#sort` method is called on array literal `[2, 5, 3, 4, 1]` with a `do...end` block.

When called with a block, the `sort` method passes each pair of elements that it needs to compare to the block to be assigned to the parameters, here `a` and `b`. `sort` uses the return value from the block as though it were the return value of calling the `<=>` method on `a` with `b` passed as argument; `-1` signifies `a` is considered lesser than `b`, `0` that they are equal, and `1` that `a` is greater. `sort` will return a new array object containing the elements from the caller in the order determined by the block return values.

Within the block, on line 2, the `puts` method is invoked with a string involving string interpolation passed as argument. This will output the string `"a is #{a} and b is #{b}"` with the integers currently referenced by `a` and `b` interpolated at the specified places in the string, and return `nil` since `puts` always returns `nil`.

On line 3, the `Integer#<=>` method is called on `a` with `b` passed as argument. This is the last evaluated expression in the block and so forms its return value. This means that the block returns will be exactly the same as if `sort` had been called without a block and were making the default calls to `<=>`.

Therefore, this `sort` invocation will return a new array with the elements from the caller in default ascending order: `[1, 2, 3, 4, 5]`.

This example demonstrates how `sort` interacts with a block. It also demonstrates that the block can contain other code so long as its return value is a numeric value that `sort` can use as though it were the return value of the `<=>` method.

--12:02

### 8 ###

```ruby
['arc', 'bat', 'cape', 'ants', 'cap'].sort
```

On line 1, the `Array#sort` method is invoked on array literal `['arc', 'bat', 'cape', 'ants', 'cap']`.

The `sort` called without a block returns a new array containing the elements from the caller in ascending order. In order to achieve this, `sort` makes a series of comparisons between elements using the `<=>` method. Since this invocation of `sort` is called on an array of strings, the `String#<=>` method is used.

The `String#<=>` method makes character-wise comparison between two strings based on ASCII table order: the later the placement in the ASCII table, the greater the value. 'Character-wise' means that the characters at index `0` in the two strings are compared and if no difference is found then the characters at index `1` are compared, and so on until a difference is found. If no difference is found up to the length of the shorter string, the longer string is considered greater. If no difference is found in equal-sized strings, they are considered equal. The `String#<=>` method returns `-1` if the caller is found to be lesser than the argument, `0` if they are equal, and `1` if the caller is greater.

This invocation of `sort` will therefore return a new array with the strings from the calling array sorted in ascending order  based on the return values of the `String#<=>` method: `["ants", "arc", "bat", "cap", "cape"]`.

This example demonstrates how the `sort` method performs sorting on an array of strings.

--9:56

### 9 ###

```ruby
[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort
```

On line 1, `Array#sort` is called on an array of arrays.

When called without a block, `sort` returns a new array containing the elements from the caller in ascending order. In order to achieve this, `sort` makes a series of comparisons between elements using the `<=>` method appropriate to the class of the caller. Since every element in the outer array is also an array, that will be method will be `Array#<=>`.

`Array#<=>` compares Array objects in an element-wise manner. The element at index `0` of the calling array is compared to the element at index `0` of the argument array, and if no difference is found then the elements at index `1` will be compared, and so on until a difference is found. If no difference is found until the end of the shorter array then the longer array is considered greater. If no difference is found in equally-sized arrays, they are found to be equal. These element comparisons are made using the `<=>` method appropriate to the class of the elements being compared. If the `<=>` method call comparing individual elements finds that the elements cannot be compared, it returns `nil`, in which case the `Array#<=>` method also returns `nil` and this causes `sort` to throw an `ArgumentError`. If the object passed as argument to `Array#<=>` is not comparable with an Array, that will also cause the method to return `nil`. Otherwise, the `Array#<=>` method returns `-1` if the calling array is found to be lesser, `0` if the arrays are equal, and `1` if the calling array is greater.

In this example, some of the elements in the sub-arrays are not comparable to the elements at the same index of other sub-arrays; however, in every case, the element-wise comparisons made by the `Array#<=>` method are able to find differences in the elements of these sub-arrays, or decisive differences in the length of the sub-arrays, before reaching the problematic index.

Therefore, this invocation of `sort` will return a new array containing the sub-arrays from the caller in ascending order: `[["a", "car", "d"], ["a", "car", "d", 3], ["a", "cat", "b", "c"], ["b", 2]]`.

This example demonstrates how `sort` determines sort order when called without a block on an array of arrays.

### 10 ###

```ruby
['cot', 'bed', 'mat'].sort_by do |word|
  word[1]
end
```

On line 1, the `Enumerable#sort_by` method is invoked on array literal `['cot', 'bed', 'mat']` with a `do...end` block.

The `sort_by` method returns a new array with the elements from the caller sorted in an order determined by the block return value. `sort_by` passes each element to the block to be assigned to the block parameter `word`.

Within the block, the only expression is an invocation of the `String#[]` method with `1` passed as argument. This returns a new string containing the character at index `1` from the string currently referenced by `word`. Since this is the last evaluated expression in the block it forms the block return value.

Once `sort_by` has a corresponding key for each element, given by the return value from that element's block iteration, it makes a series of comparisons using the `<=>` method. Since this block returns String objects, the `String#<=>` method will be used.

The `String#<=>` method makes a comparison between the calling string and the argument in order to return a signal value: `-1` if the caller is considered lesser, `0` if they are are considered equal, and `1` if the caller is considered greater. If the argument object cannot be compared to the caller, `<=>` returns `nil`, which causes `sort_by` to throw an `ArgumentError`. The `<=>` method compares strings in a character-wise manner based on ASCII character table value. Character-wise comparison means that the characters at index `0` in both strings are compared and if no difference is found, the characters at index `1` are compared, and so on until a difference is found. If no difference is found up to the length of the shorter string, the longer string is considered greater. If no difference is found in equal-sized strings, the strings are considered equal.

Since this block returns a string containing only the string element's second character as each element's sort key, the new array `sort_by` returns will be sorted by comparisons of these characters only, in ascending ASCII table placement order. Therefore, this invocation of `sort_by` returns a new array whose state is `["mat", "bed", "cot"]`.

This example demonstrates how `sort_by` uses the return value of the block as a sort key or criterion to determine sort order in the new sorted array it will return.

### 11 ###

```ruby
people = { Kate: 27, john: 25, Mike:  18 }

people.sort_by do |_, age|
  age
end
```

On line 1, local variable `people` is initialized to the hash `{ Kate: 27, john: 25, Mike:  18 }`. Next, on line 3, the `Enumerable#sort_by` method is invoked on `people`.

The `sort_by` method returns a new array containing the elements from the caller sorted in an order determined by the return value of the block; when called on a hash, the new array returned by `sort_by` will have for its elements nested two-element arrays containing the key and value objects from the hash. The `sort_by` method uses the return value from each element's block iteration as a sort key; the elements from the caller are then sorted by their sort key instead of by the values of the elements themselves.

On this invocation on the `people` hash, `sort_by` passes each key-value to the block to be assigned to the block parameters. The key object is assigned to parameter `_`, which conventionally means that object will not be used in the block. The value object is assigned to `age`. Within the block, on line 4, the only expression is the integer currently referenced by `age`. This is the last evaluated expression in the block and so forms the return value. This block therefore determines that the key-value pairs from the hash should be sorted by their value object.

`sort_by` then makes a series of comparisons between the sort keys using the `<=>` method to determine sort order. The sort keys here are integers so `Integer#<=>` will be used.

The `Integer#<=>` method compares the calling integer to the argument by numeric value in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, and `1` if the caller is greater. If the argument cannot be compared to the caller, `<=>` returns `nil`, which causes `sort_by` to throw an `ArgumentErrror`.

This invocation of `sort_by` therefore returns a new array of nested sub-arrays containing the key-value pairs from the calling hash sorted by the value part in ascending order: `[[:Mike, 18], [:john, 25], [:Kate, 27]]`.

This example demonstrates how `sort_by` uses the return value from the block; specifically, it uses the returned object as a sort key, which it compares to the sort keys of the other elements in order to determine the sort order of the elements in the new array it will return.

14:14

### I would try to come up with some code snippets for the following with and without blocks ###

* min
* max
* minmax
* min_by
* max_by
* minmax_by



## Other Methods that Call the `<=>` Method ##

### 1 ###

```ruby
[4, 3, 5, 2, 1].min
```

On line 1, the `Array#min` method is invoked on array literal `[4, 3, 5, 2, 1]`.

The `min` method called without block or argument will return the element from the calling collection considered to have the minimum value. In order to achieve this, `min` makes a series of calls to the `<=>` comparison method of the objects being compared, in this case `Integer#<=>`.

`Integer#<=>` compares the calling integer to the argument in order to return a signal value: `-1` if the caller is considered lesser than the argument, `0` if they are equal, and `1` if the caller is greater. If the argument cannot be compared to the caller `<=>` returns `nil`; a `nil` return from `<=>` causes `min` to throw an `ArgumentError`.

Therefore this invocation of `min` returns `1`, the lowest value integer in the collection.

This example demonstrates how the `Array#min` method called without block or argument determines which element to return.

--6:23

### 2 ###

```ruby
[4, 3, 5, 2, 1].min(2)
```

On line 1, the `Array#min` method is called on array literal `[4, 3, 5, 2, 1]` with `2` passed as argument.

The `min` method called with an integer argument will return a new array containing the number of elements specified by the argument which are considered to have the lowest values in the collection. In order to achieve this, the `min` method makes a series of comparisons using the `<=>` method of the elements in the collection, in this case the `Integer#<=>` method.

The `Integer#<=>` method compares a calling integer to the argument based on numeric value in order to return a signal value: `-1` if the caller is considered lesser, `0` if they are equal, and `1` if the caller is greater. If the argument cannot be compared, the `<=>` method returns `nil`, which causes `min` to throw an `ArgumentError`.

The `min` method called with an argument uses the series of return values from the `<=>` method in order to determine the order of elements and returns a new array containing the number of elements specified that have the lowest values in the collection. Therefore this `min` invocation with `2` passed as argument will return `[1, 2]`.

This example demonstrates the return value of the `Array#min` method is determined when called with an argument.

--8:17

### 3

```ruby
ruminants = %w(llama Yak sheep Horse cow)

ruminants.min do |a, b|
  a.downcase <=> b.downcase
end
```

On line 1, local variable `ruminants` is initialized to the array of strings `%w(llama Yak sheep Horse cow)`.

Next, on line 3, the `Array#min` method is called on `ruminants` with a `do...end` block.

When called with a block, `min` will pass the elements it needs to compare to the block to be assigned to the block parameters, here `a` and `b`. `min` uses the block return value to determine the order of element values as though it were the return value of the `<=>` method. If the block returns `-1`, the element assigned to `a` is considered lesser; if the return value is `0`, `a` and `b` are considered equal; if the block returns `1`, `a` is considered greater.

Within the block, on line 3, the `String#downcase` method called on `a` which will return a new string with the characters from the caller with all alphabetic characters in lower case. Chained on this return value is a call to the `String#<=>` method, with the return value of calling `downcase` on `b` passed as argument.

The `String#<=>` method compares two strings in a character-wise manner by ASCII table placement order; later placement in the table means a higher value. 'Character-wise' comparison means that the characters at index `0` in the two strings are compared and if no difference is found then the characters at index `1` are compared, and so on until a difference is found. If no difference is found up to the length of the shorter string then the longer string is considered greater. If no difference is found in equal-sized strings, the strings are considered equal. The `<=>` method returns `-1` if the caller is lesser, `0` if they are equal, and `1` if the caller is greater. If the objects cannot be compared, `<=>` returns `nil`, which causes `min` to throw an `ArgumentError`.

This call to `<=>` is the last evaluated expression in the block and so forms the return value. The effect of the two calls to `downcase` before the call to `Array#<=>` has the effect of making this a case-insensitive comparison, needed to find alphabetical rather than ASCII-betical ordering. `min` will return the lowest-valued element according to this criterion, `"cow"`.

This example demonstrates how the return value of `min` is determined when it is called with a block.

--15:10

### 4 ###

```ruby
[4, 3, 5, 2, 1].max
```

On line 1, the `Array#max` method is called on array literal `[4, 3, 5, 2, 1]`. The `max` method called without block or argument returns the greatest-valued element in the collection determined by a series of comparisons with the `<=>` method. Since this is an array of integers, the `Integer#<=>` method is used.

The `Integer#<=>` method compares the calling integer to the argument in order to return a signal value: `-1` if the caller has a lesser numeric value than the argument, `0` if they are equal, and `1`  if the caller is greater. If the the argument is of a class that cannot be compared to the caller, the `<=>` method returns `nil`, which causes the `max` method to throw an `ArgumentError`.

The return values from the `<=>` method are used to determine the order of magnitude of the elements and based on this `max` returns the greatest, here `5`.

This example demonstrates how the return value of `max` is determined when called without a block or an argument.

--5:43

### 5

```ruby
['a', 'f', 'd', 'l', 'z'].max(3)
```

On line 1, the `Array#max` method is invoked on array literal `['a', 'f', 'd', 'l', 'z']` with `3` passed as argument.

The `max` method called with an integer argument returns a new array containing the number of elements from the caller specified by the argument that are considered to have the greatest values. In order to determine the relative values of elements, `max` makes a series of comparisons using the `<=>` method of the class of elements, in this case `String#<=>`.

The `String#<=>` makes comparisons based on ASCII table placement order in a character-wise manner; the later the placement in the ASCII table, the greater in value a character is considered. 'Character-wise' comparison means that the characters at index `0` of the caller and argument strings are compared and if no difference is found then the characters at index `1` are compared, and so on until a difference is found. If no difference is found up to the size of the shorter string, the longer string is considered greater. If no difference is found in equal-sized strings, they are considered equal. The `<=>` method uses the comparison to return a signal value: `-1` if the caller is lesser, `0` if they are equal, `1` if the caller is greater. If the argument object passed cannot be compared to the caller, the `<=>` method returns `nil`, which causes `max` to throw an `ArgumentError`.

After making comparisons to determine the relative values of elements, this invocation of `max` returns the three elements with the greatest ASCII value in descending order of value in a new array: `['z', 'l', 'f']`. 

This example demonstrates how the return value of `Array#max` is determined when called with an integer argument.

--10:00



### 6

```ruby
lizards = ['Iguana', 'basilisk', 'Gecko', 'water dragon']

lizards.max do |a, b|
  a.downcase <=> b.downcase
end
```

On line 1, local variable `lizards` is initialized to the array `['Iguana', 'basilisk', 'Gecko', 'water dragon']`.

Next, on line 3, the `max` method is called on `lizards` with a `do...end` block. The `max` method called with a block and no argument returns the element from the caller determined to have the greatest value. In order to determine which element is greatest, `max` passes each pair of elements it needs to compare to the block to be assigned to the parameters `a` and `b`. The return value from the block is then treated as though it were the return value of calling the `<=>` comparison method on `a` with `b` passed as argument. If the block returns `-1`, this signifies that `a` should be considered lesser than `b`, `0` that the objects are equal, and `1` that `a` is greater.

Within the block, on line 4, the `String#downcase` method is called on `a`; this returns a new string with the characters from the caller with all alphabetic letters in lower case. Chained on this return value, we call the `String#<=>` method with the return value of calling `downcase` on `b` passed as argument.

The `String#<=>` method makes character-wise comparison of the calling string to the argument based on ASCII table placement order; later placement means greater value. 'Character-wise' comparison means that the characters at index `0` of the two strings are compared, and if no difference is found then the characters at index `1` are compared, and so on until a difference is found. If no difference is found up to the length of the shorter string, the longer string is considered greater. If no difference is found in equal-sized strings, they are considered equal. This comparison determines the signal value that `<=>` returns: `-1` if the caller is lesser, `0` if they are equal, and `1` if the caller is greater.

The return value of `String#<=>` is the last evaluated element in the block and so forms the block return value. The effect of the two calls to `downcase` is to make the comparisons case-insensitive. Therefore, this call to `max` returns the element which, after case has been ignored, is determined to have the greatest ASCII value, `"water dragon"`.

This example demonstrates how the return value of the `max` method is determined when called with a block on an array of strings.

13:10



### 7

```ruby
[4, 3, 5, 2, 1].minmax
```

On line 1, the `minmax` method is invoked on array literal `[4, 3, 5, 2, 1]`.

The `Array#minmax` method returns a new array whose first element is the element from the caller considered to have the least value and whose second element is the element from the caller considered to have the greatest value. In order to determine relative values, `minmax` will call the `<=>` method for each pair of elements that it needs to compare. Since this is an array of integers, `Integer#<=>` will be used.

The `Integer#<=>` method compares the calling integer to the object passed as argument by numeric value in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, `1` if the caller is greater. The `<=>` method returns `nil` if the argument object cannot be compared to the caller, in which case `minmax` will throw an `ArgumentError`.

Once the relative values of the calling arrays elements have been thus determined, this invocation of `minmax` returns a new array, `[1, 5]`.

This example demonstrates how the return value of `minmax` is determined when called on an array of  integers with no block.

--5:55

### 8

```ruby
["Fortran", "Lisp", "Algol", "C", "Simula", "Smalltalk"].minmax do |a, b|
    a.size <=> b.size
end
```

On line 1, the `Array#minmax` method is called on array literal `["Fortran", "Lisp", "Algol", "C", "Simula", "Smalltalk"]` with a `do...end` block.

When called with a block, `Array#minmax` returns a new two-element array where the first element is the element from the caller whose value is considered least and the second element is that from the caller whose value is considered greatest. In order to determine this, `minmax` makes a series of comparisons between elements in the caller by passing each pair of elements it that it needs to compare to the block to be assigned to the block parameters `a` and `b`. The return value of the block is then treated as though it were the return value of calling the `<=>` method in `a` with `b` passed as argument. If the block returns `-1` then `a` is considered the lesser; `0` means the objects are considered equal; `1` means that `a` is considered the greater.

Within the block, the `String#size` method is called on the string currently referenced by `a`; this will return the number of characters in the string as an integer. Chained on this return value is a call to `Integer#<=>` with the return value of calling `size` on `b` passed as argument.

The `Integer#<=>` method makes comparison between caller and argument based on numeric value in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, and `1` if the caller is greater. If the argument cannot be compared to the caller, `<=>` returns `nil` and this causes `minmax` to throw an `ArgumentError`.

The return value of `Integer#<=>` is the last evaluated expression in the block and so forms the block return value. This means that the block returns the result of a comparison based on the lengths of the strings in order to determine the minimum- and maximum-valued elements it will return as a new array: `["C", "Smalltalk"]`.

This example demonstrates how the return value is determined when `Array#minmax` is called with a block.

--9:11

### 9

```ruby
languages = {
  smalltalk: 1980,
  algol: 1958,
  simula: 1968,
  fortran: 1957,
  lisp: 1960,
  c: 1972
}

languages.minmax_by { |language, year| year }
```

On line 1, local variable `languages` is initialized to a hash object, `{ smalltalk: 1972,  algol: 1958,  simula: 1968,  fortran: 1957,  lisp: 1960,  c: 1972}`.

Next, on line 10, the `Enumerable#minmax_by` method is invoked on `languages` with a `{...}` block.

`Enumerable#minmax_by` called on a hash returns a new two-element array whose first element is the key-value pair from the caller considered of the least value returned as a nested two-element inner array; the second element in the new array is the key-value pair considered greatest. Called with a block, `minmax_by` determines the relative values of key-value pairs by passing each pair in turn to the block to be assigned to the block parameters `language` and `year`. The return value from the block is used as the criterion by which relative value will be determined.

Within the block, the only expression is the Integer object currently referenced by `year`. Therefore this forms the block return value. `minmax_by` uses these returned values as the basis for its comparisons, which are performed by calling the `<=>` comparison method for each pair of these return values. Since the return values are integers, `Integer#<=>` will be used.

The `Integer#<=>` method makes comparison between the calling integer and the argument based on numeric value in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, and `1` if the caller is greater. If the argument cannot be compared to the caller, `<=>` returns `nil` which causes `minmax_by` to throw an `ArgumentError`.

The two key-value pairs considered least and greatest are thus determined by the value part, and so the new two-element array of arrays returned by `minmax_by` will be `[[:fortran, 1957], [:smalltalk, 1980]]`.

This example demonstrates how the return value is determined for `minmax_by` when called on a hash with a block.

--13:11.

## Nested Data Structures ###

### 1 ###

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2[1].upcase!

p arr2
p arr1
```

On line 1, local variable `arr1` is initialized to array literal `["a", "b", "c"]`.

Next, local variable `arr2` is initialized to the return value of calling the `Object#dup` method on `arr1`, a new Array object that is a shallow copy of the array referenced by `arr1`. A shallow copy means that the `arr2` Array object is a new object but the objects referenced as its elements are the same objects referenced as elements in `arr1`.

On line 3, the destructive `String#upcase!` method is called on the element referenced at index `1` of the `arr2` array. This mutates the String object so that all alphabet characters are now uppercase. Since the object at index `1` of `arr2` is the same string at index `1` of `arr1`, this mutation will be reflected when evaluating either array.

So on line 5, when `arr2` is passed to the `Kernel#p` method call, it will output `["a", "B", "c"]`, and on line 6, when `arr1` is passed to `p`, the output will again be `["a", "B", "c"]`.

This example demonstrates the effect of making a shallow copy of an array containing mutable objects using the `dup` method.



### 2 ###

```ruby
arr1 = ["abc", "def"]
arr2 = arr1.clone
arr2[0].reverse!

arr2
arr1
```

On line 1, local variable `arr1` is initialized to the array `["abc", "def"]`. Next, local variable `arr2` is initialized to the return value of calling `clone` on `arr1`.

The `clone` method called on an array returns a shallow copy of the Array object. A shallow copy means that the Array object will be a new object with its own `object_id` but the elements referenced by the new Array object will currently be the same objects referenced at the same indexes of `arr1`.

On line 3, the destructive `String#reverse!` method is called on the element at index `0` of `arr2`. This will mutate the value of that String object such that its characters are now in reverse order. Since `arr2` was created as only a shallow copy of `arr1`, the object referenced at index `0` is currently the same object referenced at index `0` of `arr1` and so the mutation of the string will be reflected when evaluating either array.

Thus the return value of evaluating `arr2` on line 5 will be `["cba", "def"]` and the return value of evaluating `arr1` on line 6 will also be `["cba", "def"]`.

This example demonstrates the effect of making a shallow copy of an array using the `clone` method.

--8:34

### 3 ###

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

p arr1
p arr2
```

On line 1, local variable `arr1` is initialized to the array `["a", "b", "c"]`. Next, local variable `arr2` is initialized to the return value of calling `dup` on `arr1`.

The `dup` method returns a shallow copy of the calling object. When called on an Array, this means that the Array object returned will be a new object with a new `object_id` but the elements referenced at the indexes of this new array will be the same objects referenced at the same indexes of the caller. Thus currently, though `arr1` and `arr2` reference different arrays, their elements are currently shared between them.

On line 3, the destructive `Array#map!` method is called on `arr2` with a `do...end` block. The `map!` method iterates through the calling collection passing each element in turn to the block to be assigned to the block parameter `char`. `map!` uses the return value of the block for purposes of transformation, mutating the state of the calling array so that, after the method returns, each index is now assigned to the object returned by the block iteration for the element at that index.

Within the block, the non-destructive `String#upcase` method is called on the string currently referenced by `char`; this returns a new String object with the characters from the caller with every alphabetic character in uppercase. This is the last evaluated expression in the block and so forms the block return value that `map!` uses for transformation.

Therefore, after this call to `map!`, the elements in `arr2` are new String objects, no longer shared by `arr1`. So on line 7, when `arr1` is passed to `Kernel#p`, the output will be unchanged by `map!`: `["a", "b", "c"]`, whereas on line 8, when `arr2` is passed to `p`, the output will reflect the `map!` methods mutation of the `arr2` array: `["A", "B", "C"]`.

This example demonstrates the effect of making a shallow copy of an array with Ruby's `dup` method.

--12:14

### 4 ###

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.each do |char|
  char.upcase!
end

p arr1
p arr2
```

On line 1, local variable `arr1` is initialized to array `["a", "b", "c"]`. Next, local variable `arr2` is initialized to the return value of calling `dup` on `arr1`.

The `dup` method returns a shallow copy of the caller. When called on an Array object, this means that it returns a new Array object but the elements referenced at  the indexes of this new array are the same objects referenced by the calling array. So `arr1` and `arr2` reference different arrays but these arrays currently share the same objects as elements.

On line 3, `Array#each` is called on `arr2` with a `do...end` block. `each` performs iteration, passing each element in turn to the block to be assigned to the block parameter `char`, ignoring the return value of the block and returning a reference to the caller.

Within the block, the destructive `String#upcase!` method is called on the string currently referenced by `char`. This mutates the String object so that any lowercase characters are now uppercase. Since each element in `arr2` is also referenced at the same index of `arr1`, these mutations will be reflected when evaluating either array.

So on line 1, when `arr1` is passed to the `Kernel#p` method, the output will be `["A", "B", "C"]`. And on line 8, when `arr2` is passed to the `p` method, the output will also be `["A", "B", "C"]`

This example demonstrates the effect of making a shallow copy of an array with the `dup` method.

--7:55

### 5 ###

```ruby
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.clone
arr2 << "d"
```

On line 1, local variable `arr1` is initialized to the return value of calling `Object#freeze` on the array in literal notation `["a", "b", "c"]`. The `Object#freeze` method can be called on mutable objects in order in order to prevent them being mutated while they remain frozen. When called on an array, the `freeze` method will freeze the Array object itself, but does not freeze the objects referenced as its elements. `freeze` returns a reference to the caller, now frozen, which is assigned to `arr1`.

On line 2, local variable `arr2` is initialized to the return value of calling the `Kernel#clone` method on `arr1`.

The `clone` method returns a shallow copy of the caller. Called on an array it will return a new Array object whose elements are the same objects referenced by the same indexes as the elements from the caller. Unlike the `Object#dup` method, `clone` preserves the frozen state of frozen objects.

This means that `arr2` references a new, frozen array whose elements are shared by `arr1`. Thus when, on line 3, the destructive `Array#<<` method is called on `arr2` with string literal `"d"` passed as argument, the attempt at mutating `arr2` will cause a `FrozenError` to be thrown.

This example demonstrates the interaction of the `freeze` and `clone` methods; specifically it shows that the `clone` method preserves the frozen state of objects when returning a shallow copy of the caller.

### 6 ###

```ruby
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.dup
arr2 << "d"

p arr1
p arr2
```

On line 1, local variable `arr1` is initialized to the return value of calling the `freeze` method on array `["a", "b", "c"]`. The `Object#freeze` method can be called on mutable objects in order to freeze them, which prevents their being mutated while they remain frozen. When called on a collection, the `freeze` method will freeze the collection itself but not the objects referenced as elements in the collection. `freeze` returns a reference to the caller, now frozen.

On line 2, the local variable `arr2` is initialized to the return value of calling `Object#dup` on `arr1`. `dup` returns a shallow copy of the caller. When called on an array, this means that the returned array will be a new object with a new `object_id` but its elements will be the same objects referenced by the same indexes as the caller. Unlike the `Kernel#clone` method, `dup` does not preserve the frozen state of potentially mutable objects.

Therefore, the new array assigned to `arr2` will not be frozen. Thus when, on line 3, the mutating `Array#<<` method is invoked on `arr2` with `"d"` passed as argument, the attempt to destructively append the new string to  `arr2` will be successful.

On line 5, `arr1` is passed as argument to a call to `Kernel#p`, which outputs `["a", "b", "c"]`. However, when `arr2` is passed to `p` on line 6, the output will reflect the mutation: `["a", "b", "c", "d"]`.

This example demonstrates the effect of calling the `dup` method on an array; specifically it demonstrates that `dup` does not preserve the frozen state of the caller when returning a shallow copy.

--15:17

### 7 ###

```ruby
str = "abc".freeze
str << "d"
```

On line 1, local variable `str` is initialized to the return value of calling `Object#freeze` on string `"abc"`. The `freeze` method can be called on a mutable object in order to prevent it being mutated while it remains frozen. Thus when, on line 2, the destructive `String#<<` method is invoked on `str` with string `"d"` passed as argument, this attempt at mutation will cause a `FrozenError` to be thrown.

This example demonstrates the effect of using the `freeze` method to freeze a mutable object.

--3:04

### 12 ###

```ruby
arr = [[1], [2], [3]].freeze
arr[2] << 4
```

On line 1, local variable `arr` is initialized to the return value of calling the `Object#freeze` method on the array of arrays `[[1], [2], [3]]`. The `freeze` method can be called on a mutable object in order to prevent its being mutated while it remains frozen. When called on an array, `freeze` will freeze the Array object on which it is called but not the objects referenced as elements in the array. Therefore, `arr` now references a frozen outer array whose nested array elements are not frozen.

On line 2, element reference method `Array#[]` is called on `arr` with `2` passed as argument. This will return the nested array at index `2` of `arr`. Chained on this return value is a call to the destructive `Array#<<` method with `4` passed as argument. Since the inner arrays in `arr` are not frozen, this attempt to mutate the sub-array at index `2` will be successful and the state of `arr` will now be `[[1], [2], [3, 4]]`.

This example demonstrates the effect of calling `freeze` on an array containing mutable objects; specifically, it shows that the array will be frozen but its elements will not be.

--5:53

### 13 ###

```ruby
arr = ["a", "b", "c"].freeze
arr[2] << "d"
```

On line 1, local variable `arr` is initialized to the return value of calling `Object#freeze` on array `["a", "b", "c"]`. The `freeze` method can be called on a mutable object in  order to prevent its being mutated while it remains frozen. When called on an array, `freeze` will freeze the Array object itself but not the objects referenced as elements in the array.

On line 2, element reference method `Array#[]` is called on `arr` with `2` passed as argument. This returns the string at index `2`. Chained on this return value is call to the destructive `String#<<` method with `"d"` passed as argument. Since the elements of the frozen `arr` array are not themselves frozen, this attempt to destructively append `"d"` to the string at index `2` will be successful. The state of `arr` will reflect this: `["a", "b", "cd"]`.

This example demonstrates the effect of calling `freeze` on a collection object; specifically, it demonstrates that the collection itself will be frozen but not any mutable object referenced as elements in the collection.

--4:46



## Working With Blocks ##

### 1 ###

```ruby
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
```

On line 1, `Array#each` is invoked on an array of arrays with a `do...end` block. The `each` method performs iteration, passing each sub-array element to the block to be assigned to block parameter `arr`. `each` ignores the block return value and returns a reference to the caller.

Within the block, the `Array#first` method is called on `arr`, which returns the first element This return value is then passed to the `Kernel#puts` method which will output the integer to screen and return `nil`, since `puts` always returns `nil`. Since this is the last evaluated expression in the block, it forms the block return value.

This `each` invocation will therefore output to screen

```
1
3
```

and return a reference to the caller.

This example demonstrates an `each` invocation on an array of nested sub-arrays.

--4:24

### 2 ###

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
```

On line 1, the `Array#map` method is called on an array of arrays: `[[1, 2], [3, 4]]` with a `do...end` block. The `map` method iterates through the calling array passing each sub-array element to the block to be assigned to the block parameter `arr`. `map` uses the return value of the block for purposes of transformation, returning a new array whose elements are the objects returned by the block.

Within the block. on line 2, the `Array#first` method is called on the sub-array currently referenced by `arr`. This returns the first element, an integer, which is then passed as argument to the `Kernel#puts` method, which outputs the number to the screen and returns `nil`, since `puts` always returns `nil`. This is the last evaluated expression in the block and so forms the block's return value.

Since every block returns `nil`, the new array that `map` returns will be: `[nil, nil]`. 

This example demonstrates how the `map` method uses the return value from the block; specifically, `map` uses the return value for purposes of transformation.

### 3 ###

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```

On line 1, the `Array#map` method is called on array of arrays: `[[1, 2], [3, 4]]` with a `do...end` block. `map` iterates through the calling collection passing each element in turn to the block to be assigned to block parameter `arr`. `map` uses the return value from the block for purposes of transformation, returning a new array whose elements are the objects returned by the block iterations.

Within the block, on line 2, the `Array#first` method is invoked on the sub-array element from the caller currently referenced by `arr`. This returns the first element, an integer, which is then passed as argument to the `Kernel#puts` method. `puts` outputs the number to the screen and returns `nil` since `puts` always returns `nil`.

Next, on line 3, the `first` method is again called on `arr`, which returns the first element. This is the last evaluated expression in the block and so forms the return value.

`map` uses these return values as the elements in the new array it returns, which consists of the first element of each sub-array from the caller `[1, 3]`.

This example demonstrates how `map` uses the return value from the block to perform transformation.

--7:09

### 4 ###

```ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```

On line 1, local variable `my_arr` is initialized to the return value of an invocation of the `Array#each` method on an array of arrays, with a `do...end` block given. The `each` method performs iteration, passing each sub-array element to the block to be assigned to the block parameter `arr`. `each` ignores the block return value and returns a reference to the caller.

Within the block, on line 2, the `Array#each` method is called on the sub-array from the caller currently referenced by `arr`. Each integer element from the sub-array is passed to the second-level `each` block to be assigned to the block parameter `num`.

Within the inner `each` block, on line 3, an `if` condition checks whether the integer currently referenced by `num` is greater than `5`. If so, line 4 is executed, where `num` is passed as argument to the `Kernel#puts` method. This will output the integer to the screen and return `nil`, since `puts` always returns `nil`. 

These nested calls to `each` will therefore output to screen all the integer elements from the nested sub-arrays whose value is greater than `5`:

```
18
7
12
```

The `my_arr` variable is initialized to the return value of the outer `each` call, which is a reference to the calling array of arrays.

This example demonstrates using nested `each` calls to iterate over the innermost elements in nested arrays.

--7:28



### 5 ###

```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```

On line 1, the `Array#map` method is invoked on an array of arrays `[[1, 2], [3, 4]]`with a `do...end` block. The `map` method iterates through the calling array passing each sub-array element to the block to be assigned to the block parameter `arr`. `map` uses the return value from the block for purposes of transformation, returning a new array whose elements are the objects return by the block on each successive block iteration.

Within the block, on line 2, `map` is called again, this time on the sub-array currently referenced by `arr`. This second-level `map` call iterates through the sub-array passing each integer element in turn to the block to be assigned to block parameter `num`.

Within this second-level block, on line 3, the `Integer#*` method is called on the integer currently referenced by `num` with `2` passed as argument, returning the integer that is double the calling integer. This is the last evaluated expression in the block and so forms the return value.

Therefore, the second-level call to `map` returns a new array whose elements are the integer return values from the second-level block. In turn, this new array forms the return value from the first-level block, which the outer call to `map` uses to form the sub-array elements of the new array it returns: `[[2, 4], [6, 8]]`.

This example demonstrates using nested calls to `map` with nested blocks to perform transformation on the innermost elements of nested arrays.

--8:31

6

```ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
```

On line 1, the `Array#select` method is invoked on the array of hashes `[{ a: 'ant', b: 'elephant' }, { c: 'cat' }]` with a `do...end` block. The `select` method iterates through the calling array passing each hash element to the block to be assigned to the block parameter `hash`. The `select` method considers the truthiness of the return value of the block to perform selection, returning a new array whose elements are only those elements from the caller whose block returned a truthy value.

Within the block, on line 2, the iterative predicate method `Enumerable#all?` is invoked on the hash currently referenced by `hash` with another `do...end` block. The `all?` method iterates through the calling hash passing each key-value pair in turn to the block to be assigned to parameters `key` and `value`. The `all?` considers the truthiness of each block return value and returns Boolean object `true` only if every block returns a truthy value. If a block returns a falsey value,  `all?` immediately returns `false`.

Within the second-level block, the `String#[]` method is called on the string currently referenced by `value` with `0` passed as argument, returning the first character in the string. This is compared for equality to the return value of calling the `Symbol#to_s` method on `key`, returning `true` if they are found to be equal, `false` otherwise. This is the last evaluated expression in the second-level block and so forms the block return value. In turn, return value from the `all?` method forms the return value for the first-level block.

This means that only those hashes will be selected for inclusion in the new array returned by the call to `select` that contain only key-value pairs where the Symbol key object shares a first character with the String value object. Therefore, this call to `select` returns `[{:c => "cat"}]`.

This example demonstrates using nested iterator methods in order to perform selection on a nested data structure.

--16:00

### 7a ###

```ruby
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
arr.sort
```

On line 1 local variable `arr` is initialized to the array of arrays `[['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]`. Next, on line 2, the `Array#sort` method is invoked on `arr`.

The `sort` method returns a new array containing the elements from the caller sorted in ascending order. In order to achieve this, `sort` makes a series of comparisons using the `<=>` method of the elements in the array. In this case, the elements are also arrays so `Array#<=>` will be used.

The `Array#<=>` method performs element-wise comparison of the calling array and an argument. Element-wise comparison means that the first element in each array will be compared, and if no difference is found the second elements are compared, and so on until a difference is found. If no difference is found up to the length of the shorter array, the longer array is considered greater. If no difference is found in equal-sized arrays, they are found to be equal. Comparison between array elements is performed using the `<=>` method of the elements, in this case `String<=>`.

The `String#<=>` method performs character-wise comparison of the calling string to an argument based on the ASCII character table placement of their characters; the later the position in the ASCII table, the greater the value. Character-wise comparison means the characters at index `0` in the strings are compared and if no difference is found the characters at index `1` are compared and so on until a difference if found. If no difference is found up to the length of the shorter string, the longer string is considered greater. If no difference is found in equal-sized strings, they are considered equal.

Once it has made comparison between caller and argument, `<=>` returns a signal value: `-1` if the caller is lesser, `0` if they are equal, `1` if the caller is greater. If the argument cannot be compared to the caller, `<=>` returns `nil`. If `Array#<=>` receives `nil` from the `<=>` method of the elements being compared, `Array#<=>` will also return `nil`. If `sort` receives a `nil` return from `<=>`, `sort` will throw an `ArgumentError`.

Once `sort` has made these comparisons it returns the new, sorted array: `[['1', '8', '11'], ['1', '8', '9'], ['2', '12', '15'], ['2', '6', '13']]`. Since the elements are strings, not integers, the sort order is determined by the ASCII value of each character and so in this situation `'11'` comes before `'6'` because the first character `'1'` comes before `'6'` in the ASCII table.

This example demonstrates how the return value of `Array#sort` is determined when called on a nested array whose inner arrays contain string elements.



### 7b ###

```ruby
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
```

On line 1, we initialize local variable `arr` to the array of arrays `[['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]`.

Next, on line 3, we call the `Enumerable#sort_by` method on `arr` with a `do...end` block. The `sort_by` method method returns a new array containing the elements from the caller sorted in the order determined by the block. `sort_by` passes each sub-array element to the block to be assigned to the block parameter `sub_arr`. The `sort_by` method uses each element's block iteration return value as a sort key, which is used (in place of the associated element) in the comparisons `sort_by` makes in order to return a sorted array of the elements from the caller.

Within the block, on line 4, the `Array#map` method is called on the array element currently referenced by `sub_arr` with a `do...end` block. The `map` method iterates through the string elements in the calling array passing each in turn to the block to be assigned to block parameter `num`. `map` uses the return value from the block in order to perform transformation, returning a new array whose elements are the return values from the block.

Within this second-level block, the `String#to_i` method is called on `num`, returning an Integer representation of the calling string's value. This is the last evaluated method in the inner block and so forms its return value.

Thus, the `map` invocation in the outer block returns a new array object with Integer conversions of the String elements in `sub_arr`. This is the last evaluated expression in the outer block, and so forms its return value. 

Then, the `sort_by` method sorts the sub-arrays in `arr` as though their elements were integers rather than strings. In order to sort these array elements, `sort_by` makes a series of comparisons between the sort keys associated to each element; since these sort keys are also arrays, the `Array#<=>` method is used.

The `Array#<=>` method performs element-wise comparison on a calling array and argument in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, and `-1` if the caller is greater. If the argument cannot be compared to the caller, `<=>` returns `nil`, which would cause `sort_by` to throw an `ArgumentError`. Element-wise comparison means that the elements at index `0` are compared using the elements' `<=>` method, and if no difference is found, the elements at index `1` are compared, and so on until a difference is found. If no difference is found up to the length of the shorter array, the longer array is considered greater. If no difference is found in equal-sized arrays, the arrays are equal.

Since the elements in the sort key arrays are integers, `Integer#<=>` is used for element comparisons. The `Integer#<=>` method makes comparison between the calling integer and the argument in order to return a signal value:   `-1` if the caller is lesser, `0` if they are equal, `1` if the caller is greater. If the argument cannot be compared to the caller, `<=>` returns `nil`, which would mean `Array#<=>` would return `nil`, which would cause `sort_by` to throw an `ArgumentError`.

Once these comparisons have been made, this invocation of `sort_by` therefore returns a new array of the elements from the caller sorted according to the criterion given by the block: `[['1', '8', '9'], ['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15']]`.

This example demonstrates using a nested iterator method with block inside a `sort_by` block in order to specify sort order for a nested data structure.

36:18

### 8 ###

```ruby
[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
```

On line 1, the `Array#map` method is called on array of arrays `[[8, 13, 27], ['apple', 'banana', 'cantaloupe']]` with a `do...end` block. The `map` method iterates through the calling collection passing each sub-array element in turn to the block to be assigned to the block parameter `arr`. `map` uses the return value of the block for purposes of transformation, returning a new array whose elements are the block return values.

Within the block, on line 2. the `Array#select` method is called on the sub-array currently referenced by `arr` with a `do..end` block. The `select` method iterates through the calling array passing each element in turn to the block to be assigned to the block parameter `item`. For the first sub-array, these elements will be integers, for the second, strings. `select` considers the truthiness of the block return value for purposes of selection, returning a new array whose elements are only those elements from the caller whose block returned a truthy value.

Within this second-level block, on line 3, the `if` condition checks whether the return value of converting `item` to a String and back to an Integer using the `to_s` and `String#to_i` methods will be equal to the object currently referenced by `item`. This performs a quick test of whether the object referenced by `item` is an Integer or a String, with the `if` condition  evaluating as true if `item` references an integer. If this is the case, the expression on line 4 is evaluated, which checks whether the integer referenced by `item` is greater than `13`, returning `true` if so, `false` otherwise. This would then be the last evaluated expression in the block and would form the second-level block's return value.

If `item` is a string, the `else` branch will be followed and the expression on line 6 would be evaluated. On line 6, the `String#size` method is called on `item` and then the integer return value is tested by a comparison operator method to determine if it is less than `6`. This would be the last evaluated expression in the block and would form the second-level block's return value.

Therefore, the `select` method invocation returns a new array whose elements are selected from the caller according to the class-specific criteria given in the `if...else` branches: integers greater than `13`, or strings whose size is less than `6`. The new array returned by `select` forms the return value of the first-level `map` block.

`map` will then return a new array whose nested sub-arrays are the result of the selection operation performed by `select`: `[[27], ['apple']] `.

This example demonstrates a selection operation on a nested data structure; specifically it demonstrates an effective way to perform selection on the innermost elements of the array of arrays by nesting a call to `select` with a block inside a `map` method's block.

--28:33

### 9 ###

```ruby
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
```

On line 1, the `Array#map` method is called on the three-level nested data structure `[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]]` with a `do...end` block. The `map` method iterates through the caller passing each first-level sub-array element in turn to the block to be assigned to the block parameter `element1`. `map` uses the return value from the block for purposes of transformation, returning a new array whose elements are the objects returned by the block.

Within the block, on line 2, the `Array#each`method is called on the first-level sub-array currently referenced by `element1` with a `do...end` block. The `each` method performs iteration over a collection, assigning each second-level sub-array element in turn to block parameter `element2`, calling the block once for each element, ignoring the block return value and returning a reference to the caller.

Within the second-level block, on line 3, the `Enumerable#partition` method is called on the second-level sub-array currently referenced by `element2` with a `do...end` block. The `partition` method iterates through the caller passing each element in turn to the block to be assigned to block parameter `element3`. `partition` considers the truthiness of the block return value and returns a new array of arrays, the first sub-array of which containing those elements from the caller whose block returned a truthy value, the second sub-array containing those elements whose block returned a falsey value.

Within the third-level block, on line 4, the `size` method is called on the object currently referenced by `element3`. If `element3` is an integer, `Integer#size` returns an integer which gives the number of bytes used in the machine representation of the calling integer. If `element3` is a string, `String#size` returns an integer giving the number of characters. This integer return value is used in a comparison expression which checks whether the returned integer is greater than `0`, returning `true` if so, `false` otherwise. This is the last evaluated expression in the third-level block and so forms its return value.

Since all calls to size will return a number greater than `0` for this data structures innermost elements, every third-level block returns `true`. This means `partition` will return a new array of arrays, where all elements from the caller are placed in the first sub-array and the second sub-array is empty. The return value of `partition` forms the second-level block's return value; however, `each` ignores the block return value and simply returns a reference to the caller.

The return value from `each` forms the return value of the first level block. However, it is simply a reference to the element passed in to the block. Therefore the new array returned by the `map` method will contain the same elements with the same nested structure.

This example demonstrates an attempt to perform an operation on a three-level nested data structure using three-levels nested iterator methods with blocks; it perhaps illustrates the importance of keeping aware of what how each method uses the block return value and what each method returns. Were the call to `each` replaced with a second call to `map`, a meaningful return value would be returned by the outer call to `map`.

--28:51

### 10 ###

```ruby
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.to_i == el   # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

```

On line 1, the `Array#map` method is called on array of arrays `[[[1, 2], [3, 4]], [5, 6]]` with a `do...end` block. `map` iterates through the calling array passing each sub-array element in turn to the block to be assigned to block parameter `arr`. `map` uses the block return value for purposes of transformation, returning a new array whose elements are the objects returned by the block.

Within the block, on line 2, `map` is called on the sub-array currently referenced by `arr` with a `do...end` block. `map` passes each element to the block to be assigned to parameter `el`. 

Within the second-level block, on line 3, the object currently referenced by `el` is converted to a String and then to an Integer using the `to_s` and `String#to_i` methods. The return value from these chained method calls is compared for equality to the original `el` object. This expression is used as an `if` condition. This is a quick way of testing whether `el` references an integer or not. If the `if` branch is followed, the expression on line 4 is evaluated and returns the result of adding `1` to the integer referenced by `el`. If the `if` branch is followed, this will be the last evaluated expression and forms the second-level block return value.

If the `else` branch is followed, the object referenced by `el` should be an Array and on line 6, the `Array#map` method is called on `el` with a `do...end` block with the block parameter `n`.

Within this third-level block, the only expression adds `1` to the integer referenced by `n`. This is the last evaluated expression and so forms the return value from the third-level block.

This third-level `map` invocation therefore returns a new array whose elements are the integers `1` higher than the elements in the caller. When the `else` branch was followed, this is the last evaluated expression in the second-level block and so forms the return value.

So, for first-level sub-arrays with nested sub-arrays as elements, the second-level `map` call returns a new array of arrays, whose integer elements have been incremented, and for first-level sub-arrays with integers as elements, second-level `map` returns a new array of incremented integers. Either way, this return value also forms the return value of the first-level `map` block.

Therefore the first call to map will return a new array whose elements are new arrays containing either incremented integers or new second-level sub-arrays containing incremented integers: `[[[2, 3], [4, 5]], [6, 7]].

This example demonstrates using a mixture of nested calls to `map` with a block and conditional logic control flow in order to transform the innermost elements in an unevenly nested data structure.

20:47



### 11: Mutating Collections While Iterating ###

```ruby
# The method remove_evens! should delete all even numbers from the array passed in as the argument.

def remove_evens!(arr)
  arr.each do |num|
    if num % 2 == 0
      arr.delete(num)
    end
  end
  arr
end

p remove_evens!([1,1,2,3,4,6,8,9])
# expected return value [1, 1, 3, 9]
# actual return value [1, 1, 3, 6, 9]
```

On line 12, the first line after the method definition, the `remove_evens!` method is called with array in literal notation `[1,1,2,3,4,6,8,9]` passed as argument.

The `remove_evens!` method is defined with the `def` keyword over lines 3-10 with one parameter `arr`, which is assigned to the array passed as argument. Within the body of the definition, on line 4, the `Array#each` method is called on `arr` with a `do...end` block. `each` performs iteration over a collection, passing each element in turn to the block and executing it once for each element. `each` ignores the block return value and simply returns a reference to the caller.

Within the block, on line 5, an `if` condition checks if the return value of calling `Integer#%` on `num` with `2` passed as argument is equal to `0`. This check determines if the integer referenced by `num` is even. If so, line 6 is executed, with calls the destructive `Array#delete` method on `arr` with `num` passed as argument. This method mutates the array referenced by `arr` to destructively remove all elements whose value is equal to `num` and then returns the last deleted element. There are no more expressions to be evaluated in the block, so the return value of the block will be either `nil` if the `if` condition evaluates to `false` or the last-deleted element if the `if` condition evaluated to `true`.

The problem with the action of the block is that it mutates the array that `each` is iterating over. Since `each` is incrementing an index counter internally to iterate through the collection and on each iteration checking that index against a dynamically-updated array size as a break condition, this means that destructively removing elements from arbitrary indexes of the array will almost certainly cause some elements from the caller to miss out on their block iteration.

After the first two iterations past elements that are not even numbers, on the iteration whose index into the array is `2`, the integer element `2` is deleted wherever it appears in the array. This changes the array and the reference of its indexes from

```ruby
[ 1, 1, 2, 3, 4, 6, 8, 9 ] # array elements
  0  1  2  3  4  5  6  7   # array indexes
```

to

```ruby
[ 1, 1, 3, 4, 6, 8, 9 ]
  0  1  2  3  4  5  6
```

Thus, on the next iteration, whose index into the array is `3`, the element selected by this index is integer `4`, which means that element `3` has been missed out altogether. This is perhaps not too big an issue in this specific case, since `3` is not an even number and so would not have been selected for deletion, but it demonstrates the problem with this approach.

Since `4` is the element now selected and `4` is even, after the call to `delete` the array's state is now

```ruby
[ 1, 1, 3, 6, 8, 9 ]
  0  1  2  3  4  5
```

So on the next iteration, the index into the array is now `4`, which misses out element `6`, which should have been deleted since it is even. Instead, integer element `8` is selected and deleted from the array.

```ruby
[ 1, 1, 3, 6, 9 ]
  0  1  2  3  4
```

Since the `each` index into the array is now `5` and the shrunken array now has  a final index of `4`, `each` will stop indexing, leaving `6` in the array when it should have been deleted.

After `each` returns a reference to the caller, now mutated, the `arr` array is restated redundantly on line 9, which forms the implicit return value of `remove_evens!`.

So when this invocation of `remove_evens!` returns and its return value is passed to the `Kernel#puts` the output to the screen will be `[1, 1, 3, 6, 9]`.

This example demonstrates why mutating the collection that an iterator method is iterating over from within the given block is almost certainly not going to produce the result that is intended.

--35:44



### 12: Shallow copy ###

```ruby
def remove_evens!(arr)
  cloned_arr = arr.dup
  cloned_arr.each do |num|
    if num % 2 == 0
      arr.delete(num)
    end
  end
  arr
end

p remove_evens!([1,1,2,3,4,6,8,9])
```

On line 11, the first line after the method definition, the `remove_evens!` method is called with an array literal passed as argument; the return value from this method is then passed as argument to `Kernel#p`.

The definition of method `remove_evens!` begins with the `def` keyword, extending over lines 1-9, and its one parameter, `arr`, is assigned on this invocation to the array passed as argument: `[1,1,2,3,4,6,8,9]`.

Within the body of the definition, on line 2, local variable `cloned_array` is initialized to the return value of calling `Object#dup` on `arr`. This will return a shallow copy of the array, meaning that the Array object returned by `dup` is a new object with its own `object_id`, but the elements of the new array are the same objects that are elements in the caller.

On line 3, the `Array#each` method is called on `cloned_arr` with a `do...end` block. The `each` method performs iteration over a collection, passing each element in turn to the block to be assigned to `num` and executing the block once for each element. `each` ignores the return value of the block and simply returns a reference to the caller.

Within the block, on line `4`, an `if` condition checks if `num` references an even integer by calling `Integer#%` on `num` with `2` passed as argument and checking if the return value is equal to `0`. If `num` is even, this expression evaluates to `true` and line `5` is executed. Otherwise, the `if` control expression returns `nil`, since there are no alternative branches, and since this is the last evaluated expression in the block, the block also returns `nil`.

On line 5, the `Array#delete` method is called on `arr` with `num` passed as argument. The `delete` method mutates the calling array to destructively remove all elements that are equal to the argument detructively`num`; `delete` returns the last deleted element. If the `if` branch is followed, this is the last evaluated value and so forms the block return value.

Therefore, after `each` has finished iterating over `cloned_arr`, all even numbers will be removed from the original `arr` array. The use of a cloned array object to iterate over means that elements can be removed or added to the original array without causing problems for the `each` method's correct working.

On line 8, `arr` is expressed as the implicit return value of the method. So on line 11, when this invocation's return value is passed to `p`, the output will be `[1, 1, 3, 9]`.

This example demonstrates using `dup` to make a shallow copy of a collection in order to safely iterate over a duplicate Array object in order to destructively remove elements from the original without the iteration problems caused by mutating a collection while iterating over it.

--18:12



## Practice Problems: Sorting, Nested Collections and Working With Blocks ###

### 1 ###

```ruby
arr = ['10', '11', '9', '7', '8']

arr.sort do |a,b|
  b.to_i <=> a.to_i
end
```

On line 1, local variable `arr` is initialized to an array of strings representing numbers, `['10', '11', '9', '7', '8']`.

Next, on line 3, the `Array#sort` method is called on `arr` with a `do...end` block.

The `sort` method called with a block returns a new array with the elements from the caller sorted in an order determined by the block. In order to establish value relations between elements and thus determine sort order, `sort` passes each pair of elements that it needs to compare to the block to be assigned to the block parameters `a` and `b`. 

Called without a block, `sort` would make comparison between elements using the `<=>` method appropriate to the elements and then return a new array sorted in ascending order from least to greatest. Called with a block, `sort` treats the return value of the block *as though it were* the return value of simply invoking the `<=>` method on the element assigned to the first block parameter with the second element passed as argument; it then arranges the elements in the new array in what *would be* ascending order *if* the return value were the simple call to `<=>` instead of the return value from the block.

In this case, without a block, `sort` would call `String#<=>` for the pairs of string elements, which makes comparison between the calling string and argument string in a character-wise manner based on the ASCII character table value. Instead, it passes them to the block to be assigned to `a` and `b`.

Within the block, on line 4, the `String#to_i` method is called on the string currently referenced by the second parameter, `b`; this converts this String representation of a number to an Integer representation of that number. Thus the method call chained on this Integer return value is to `Integer#<=>`. The object passed as argument is the return value of calling `to_i` on the first parameter, `a`. The derivation of the caller from the second parameter and the argument from the first parameter will effectively reverse the sort order to descending order.

The `Integer#<=>` method makes comparison between the caller and the argument by numeric value in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, and `1` if the caller is greater. If the argument cannot be compared to the caller, `<=>` returns `nil`, which causes `sort` to throw an `ArgumentError`. The return value from `Integer#<=>` is the last evaluated expression in the block and so forms the return value.

Therefore, this invocation of `sort` returns a new array containing the string elements from the caller, sorted by the numeric value of the integers the strings represent, rather than by ASCII value, in descending order from greatest to least: `["11", "10", "9", "8", "7"]`.

This example demonstrates calling `sort` with a block in order to return a new array with the elements from the caller sorted by a user-defined criterion and in a user-defined sort order.

### 5 ###

```ruby
[2, 5, 3, 4, 1].sort do |a, b|
  a <=> b
end
```



On line 1, the `Array#sort` method is called on array `[2, 5, 3, 4, 1]` with a `do...end` block. When called with a block, the `sort` method returns a new array containing the elements from the caller sorted in an order determined by the block.

Called without a block, `sort` would make a series of comparisons between pairs of elements using the `<=>` method and return a new array sorted in ascending order from least to greatest. Called with a block, `sort` instead passes each pair of elements to be assigned to the block parameters `a` and `b` and then treats the return value as though it were the return value of calling the `<=>` method on the first parameter with the second parameter passed as argument; `sort` then orders the elements in the new array as though it were arranging them in ascending order.

Within the block, on line 2, the `Integer#<=>` method is called on the first parameter `a` with the second parameter `b` passed as argument. The `Integer#<=>` method makes comparison based on numeric value between the calling integer and the argument in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, and `-1` if the caller is greater. If the argument cannot be compared to the caller, `<=>` returns `nil`, which causes `sort` to throw an `ArgumentError`. This is the last evaluated expression in the block and so forms its return value.

Therefore this `sort` invocation with block returns a new array with the elements from the caller sorted in the same order that they would be without a block: `[1, 2, 3, 4, 5]`.

This example demonstrates how the `sort` method, when called with a block, interacts with the return value of the block.

-11:25



### 2 ###

```ruby
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by do |book|
  book[:published]
end
```



### 3a ###

```ruby
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr1[2][1][3]
```



### 3b ###

```ruby
arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr2[1][:third][0]
```



### 3c ###

```ruby
arr3 = [['abc'], ['def'], {third: ['ghi']}]


arr3[2][:third][0][0] 
```



### 3d ###

```ruby
hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh1['b'][1]
```



### 3e ###

```ruby
hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}


hsh2[:third].key(0) 
```



### 4a ###

```ruby
arr1 = [1, [2, 3], 4]

arr1[1][1] = 4
```



### 4b ###

```ruby
arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

arr2[2] = 4
```



### 4c ###

```ruby
hsh1 = {first: [1, 2, [3]]}

hsh1[:first][2][0] = 4
```



### 4d ###

```ruby
hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

hsh2[['a']][:a][2] = 4
```



### 5 ###

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

p total_male_age
```



### 6 ###

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_pair do |name, details|
  puts "#{name} is a #{details['age']}-year-old #{details['gender']}"
end
```



### 7 ###

Given this code, what would be the final values of `a` and `b`?

```ruby
a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a
```



### 8 ###

```ruby
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = 'aeiou'

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end
```



### 9 ###

```ruby
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |sub_arr|
  sub_arr.sort do |a, b|
    b <=> a
  end
end
```



### 10 ###

```ruby
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_hash = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end

p new_hash
```



### 11a ###

```ruby
arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

new_arr = arr.map do |element|
  element.select do |num|
    num % 3 == 0
  end
end

p new_arr
```



### 11b ###

```ruby
arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

new_arr = arr.map do |element|
  element.reject do |num|
    num % 3 != 0
  end
end

p new_arr
```





### 12 ###

```ruby
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hsh = {}
arr.each do |item|
  hsh[item[0]] = item[1]
end

p hsh
```





### 13 ###

```ruby
arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

new_arr = arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end

p new_arr
```





### 14 ###

```ruby
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

new_hsh = hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end

p new_hsh
```



### 15 ###

```ruby
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

new_arr = arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end

p new_arr
```



### 16 ###

```ruby
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

new_uuid = generate_UUID
```



