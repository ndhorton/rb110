# Lesson 2 #

## Sorting ##

### 1 ###

```ruby
[2, 5, 3, 4, 1].sort
```

On line 1, the `Array#sort` method is called on array literal `[2, 5, 3, 4, 1]`. 

When called without a block, `sort` returns a new array object containing the elements from the caller sorted in ascending value. In order to achieve this, `sort` makes a series of comparisons between pairs of elements using the `<=>` method of the elements being compared. Here the elements are integers so the `Integer#<=>` method is used.

The `Integer#<=>` method makes a comparison based on numeric value between the calling integer and the argument in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, `1` if the caller is greater. If the object passed as argument cannot be compared to the caller, `<=>` returns `nil`. If `sort` receives a `nil` return from `<=>`, this causes `sort` to throw an `ArgumentError`.

Therefore, this invocation of `sort` returns a new array with the elements of the caller sorted in ascending order: `[1, 2, 3, 4, 5]`

This example demonstrates the use of the `Array#sort` method.

3:42

### 2 ###

```ruby
['c', 'a', 'e', 'b', 'd'].sort
```

On line 1, the `Array#sort` method is invoked on the array of strings given in literal notation: `['c', 'a', 'e', 'b', 'd']`.

When called without a block, `sort` returns a new array object containing the elements from the caller sorted in ascending order. In order to achieve this, `sort` makes a series of comparisons between pairs of elements using the `<=>` method of the elements being compared. Since the elements are strings, the `String#<=>` method is used.

The `String#<=>` method makes character-wise comparison between two strings based on ASCII character table order: the later the placement in the ASCII table, the greater the value. Character-wise comparison means that the characters at index `0` in the two strings are compared and if no difference is found then the characters at index `1` are compared and so on until a difference is found. If no difference is found up to the length of the shorter string, the longer string is considered greater. If no difference is found in equal-sized strings, they are considered equal. The `String#<=>` method makes this comparison between caller and argument in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, and `1` if the caller is greater. If the argument cannot be compared to the caller, the `<=>` method returns `nil`. If `sort` receives a `nil` return value from `<=>`, this causes `sort` to throw an `ArgumentError`.

Therefore, this `sort` invocation returns a new array containing the string elements from the caller in ascending ASCII table order: `["a", "b", "c", "d", "e"]`.

This example demonstrates how Ruby's `sort` method returns a sorted array.

--3:20

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



### 4 ###

```ruby
['a', 1].sort
```

On line 1, the `Array#sort`method is invoked on array literal `['a', 1]`.

When called without a block, `sort` returns a new array object containing the elements from the caller sorted in ascending order. In order to achieve this, `sort` makes a series of comparisons between pairs of elements using the `<=>` method of the elements being compared.

However, in this instance, since `sort` would here need to compare two incomparable classes of object, the `<=>` method of whichever object is the caller in the comparison will return `nil`, causing the `sort` method to throw an `ArgumentError`.

This example demonstrates the limits of Ruby's `sort` method; specifically, it demonstrates that if `sort` has to compare two elements using the `<=>` method of classes that cannot be compared, then an exception will be thrown.

--3:28



### 5 ###

```ruby
[2, 5, 3, 4, 1].sort do |a, b|
  a <=> b
end
```

On line 1, the `Array#sort` method is invoked on array literal `[2, 5, 3, 4, 1]` with a `do...end` block.

When called with a block, `sort` passes each pair of elements that need to be compared to the block to be assigned to the block parameters `a` and `b`.

`sort` uses the return value from the block as though it were the return value of calling the `<=>` method on the object assigned to the first parameter `a` with the object assigned to the second parameter `b` passed as argument. If the block returns `-1`, the object passed to the first block parameter is considered lesser; if the block returns `0`, they are considered equal; if the block returns `1`, the object passed to the first block parameter is considered greater. The `sort` method then returns a new array object with the elements from the caller sorted in what would be ascending order if the return values from the block were the return values from simple calls to `<=>`.

Within the block, on line 2, the `Integer#<=>` method is called on `a` with `b` passed as argument. The `Integer#<=>` method makes a comparison based on numeric value between the calling integer and the argument in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, `1` if the caller is greater. If the object passed as argument cannot be compared to the caller, `<=>` returns `nil`. If `sort` receives a `nil` return from `<=>`, this causes `sort` to throw an `ArgumentError`, but since all elements in the array are integers this should not happen.

The call to `<=>` is the last evaluated expression in the `sort` block and so forms the return value. Since this block is equivalent to the comparison criterion `sort` uses when called without a block, the return value from this `sort` invocation is a new array with the elements from the caller sorted in ascending order:

```ruby
[1, 2, 3, 4, 5]
```

This example demonstrates how Ruby's `sort` method interacts with a block.

--4:58



### 6 ###

```ruby
[2, 5, 3, 4, 1].sort do |a, b|
  b <=> a
end
```

On line 1, `Array#sort` is invoked on array literal `[2, 5, 3, 4, 1]` with a `do...end` block.

When called with a block, `sort` passes each pair of elements that need to be compared to the block to be assigned to the block parameters `a` and `b`.  `sort` uses the return value from the block as though it were the return value of calling the `<=>` method on the object assigned to the first parameter  `a` with the object assigned to the second parameter `b` passed as argument. If the block returns `-1`, the object passed to the first parameter is considered lesser; if the block returns `0`, they are considered equal; if the block returns `1`, the object passed to the first parameter is considered greater. The `sort` method then returns a new array object with the elements from the caller sorted in what would be ascending order if the return values from the block were the return values from simple calls to `<=>`. 

Within the block, the `Integer#<=>` method is invoked on `b`, the second parameter, with `a`, the first parameter, passed as argument. The `Integer#<=>` method makes a comparison based on numeric value between the calling integer and the argument in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, `1` if the caller is greater. If the object passed as argument cannot be compared to the caller, `<=>` returns `nil`. If `sort` receives a `nil` return from `<=>`, this causes `sort` to throw an `ArgumentError`.  This is the last evaluated expression in the block and so forms the return value.

Since the second parameter `b` is the caller here and the first parameter `a` is the argument, a return value from comparison made with `<=>`, if there is a difference in value between the integers, will be the reverse of what the `sort` method would normally receive if there were no block. Therefore this `sort` invocation returns a new array with the elements sorted in descending order rather than the ascending order that would be the case were `sort` called without a block: `[5, 4, 3, 2, 1]`.

This example demonstrates how Ruby's `sort` method interacts with a given block.

--7:25

### 7 ###

```ruby
[2, 5, 3, 4, 1].sort do |a, b|
  puts "a is #{a} and b is #{b}"
  a <=> b
end
```

On line 1, the `Array#sort` method is called on the array of integers given in literal notation `[2, 5, 3, 4, 1]` with a `do...end` block.

When called with a block, `sort` passes each pair of elements that need to be compared to the block to be assigned to the block parameters `a` and `b`. `sort` uses the return value from the block as though it were the return value of calling the `<=>` method on the object assigned to the first parameter `a` with the object assigned to the second parameter `b` passed as argument. If the block returns `-1`, the object passed to the first block parameter is considered lesser; if the block returns `0`, they are considered equal; if the block returns `1`, the object passed to the first block parameter is considered greater. The `sort` method then returns a new array object with the elements from the caller sorted in what would be ascending order if the return values from the block were the return values from simple calls to `<=>`.

Within the block, on line 2, a string involving string interpolation is passed to the `Kernel#puts` method with string representations of the objects currently referenced by `a` and `b` interpolated into the string. This message is output to the screen, and `puts` returns `nil` since `puts` always returns `nil`. However, this return value is ignored.

Next, the `Integer#<=>` method is called on `a` with `b` passed as argument. The `Integer#<=>` method makes a comparison based on numeric value between the calling integer and the argument in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, `1` if the caller is greater. If the object passed as argument cannot be compared to the caller, `<=>` returns `nil`. If `sort` receives a `nil` return from `<=>`, this causes `sort` to throw an `ArgumentError`.

This expression is the last evaluated expression in the block and so forms the block return value. Therefore, since the return value of the block is the same as `sort` would receive from `<=>` if `sort` had been called without a block, `sort` will return a new array containing the elements from the caller sorted in ascending order: `[1, 2, 3, 4, 5]`.

This example demonstrates how Ruby's `sort` method interacts with a block.

--6:34

### 8 ###

```ruby
['arc', 'bat', 'cape', 'ants', 'cap'].sort
```

On line 1, the `Array#sort` method is invoked on array of strings `['arc', 'bat', 'cape', 'ants', 'cap']`.

When called without a block, sort returns a new array object containing the elements from the caller sorted in ascending order. In order to achieve this, sort makes a series of comparisons between pairs of elements using the <=> method of the elements being compared. Since the elements are strings, the `String#<=>` method will be used.

The `String#<=>` method makes character-wise comparison between two strings based on ASCII character table order: the later the placement in the ASCII table, the greater the value. Character-wise comparison means that the characters at index `0` in the two strings are compared and if no difference is found then the characters at index `1` are compared and so on until a difference is found. If no difference is found up to the length of the shorter string, the longer string is considered greater. If no difference is found in equal-sized strings, they are considered equal. The `String#<=>` method makes this comparison between caller and argument in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, and `1` if the caller is greater. If the argument cannot be compared to the caller, the `<=>` method returns `nil`. If `sort` receives a `nil` return value from `<=>`, this causes `sort` to throw an `ArgumentError`.

Therefore, this sort invocation returns a new array object containing the elements from the caller sorted according to character-wise ASCII values in ascending order: `["ants", "arc", "bat", "cap", "cape"]`

This example demonstrates how Ruby's `sort` method behaves when called on an array of strings.

--6:26

### 9 ###

```ruby
[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort
```

On line 1, the `Array#sort` method is called on the array of arrays `[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']]`.

When called without a block, `sort` returns a new array object containing the elements from the caller sorted in ascending order. In order to achieve this, `sort` makes a series of comparisons between pairs of elements using the `<=>` method of the elements being compared. Here, the elements are arrays, so the `Array#<=>` method will be used.

`Array#<=>` compares Array objects in an element-wise manner. The elements at index `0` of the two arrays are compared and if no difference is found then the elements at index `0` are compared and so on until a difference is found. If no difference is found up to the end of the shorter array then the longer array is considered greater. If no difference is found in equally-sized arrays, they are considered equal. `Array#<=>` makes this comparison between caller and argument in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, `1` if the caller is greater. If the argument object cannot be compared to the calling array, `Array#<=>` returns `nil`. These element comparisons are made using the `<=>` method proper to the elements being compared. If the `<=>` method call comparing individual elements finds that the elements cannot be compared, it returns `nil`, in which case the `Array#<=>` method also returns `nil`. A `nil` return from the `<=>` method causes `sort` to throw an `ArgumentError`.

Here, the arrays all have differences in value before the element-wise comparison would reach incomparable elements (i.e. the Integer objects which cannot be compared to the String objects). Therefore, all comparisons will be made using the `String<=>` method.

The `String#<=>` method makes character-wise comparison between two strings based on ASCII character table order: the later the placement in the ASCII table, the greater the value. Character-wise comparison means that the characters at index `0` in the two strings are compared and if no difference is found then the characters at index `1` are compared and so on until a difference is found. If no difference is found up to the length of the shorter string, the longer string is considered greater. If no difference is found in equal-sized strings, they are considered equal. The `String#<=>` method makes this comparison between caller and argument in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, and `1` if the caller is greater. If the argument cannot be compared to the caller, the `<=>` method returns `nil`. If `sort` receives a `nil` return value from `<=>`, this causes `sort` to throw an `ArgumentError`.

Therefore, this `sort` invocation returns a new array containing the array elements from the caller sorted in ascending order: `[['a', 'car', 'd'], ['a', 'car', 'd', 3], ['a', 'cat', 'b', 'c'],  ['b', 2]]`.

This example demonstrates how Ruby's `sort` method performs sorting when called on an array of arrays.

--6:18

### 10 ###

```ruby
['cot', 'bed', 'mat'].sort_by do |word|
  word[1]
end
```

On line 1, the `Enumerable#sort_by` method is invoked on array `['cot', 'bed', 'mat']` with a `do...end` block.

The `sort_by` method returns a new array whose elements are the elements from the calling collection sorted according to the criterion given in the block. In order to do this, `sort_by` passes each element in turn to the block to be assigned to the block parameter `word`. `sort_by` then uses the return value of each element's block iteration as a sort key that is used in place of the  associated element in the series of comparisons `sort_by` makes to determine the relative valuation of elements. These comparisons are made with the `<=>` method of the sort key objects returned by the block. `sort_by` then returns a new array containing the elements from the caller sorted in ascending order of the value of the sort-key object associated to each element during the sorting process.

Within the block, the `Array#[]` element reference method is called on the string element currently referenced by `word` with `1` passed as argument, returning a new string containing the character from the caller at index `1`. This is the last evaluated expression in the block and so forms the return value of the block.

Therefore, the elements in this array will be sorted according to the ASCII table value of each string's second character only. Order is determined by the `String#<=>` method.

The `String#<=>` method makes character-wise comparison between two strings based on ASCII character table order: the later the placement in the ASCII table, the greater the value. Character-wise comparison means that the characters at index `0` in the two strings are compared and if no difference is found then the characters at index `1` are compared and so on until a difference is found. If no difference is found up to the length of the shorter string, the longer string is considered greater. If no difference is found in equal-sized strings, they are considered equal. The `String#<=>` method makes this comparison between caller and argument in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, and `1` if the caller is greater. If the argument cannot be compared to the caller, the `<=>` method returns `nil`.

Therefore, this `sort_by` invocation will return a new array containing the elements from the caller sorted according to the sort-keys returned by the block: `["mat", "bed", "cot"]`.

This example demonstrates how Ruby's `sort_by` method interacts with a block.

--9:13

### 11 ###

```ruby
people = { Kate: 27, john: 25, Mike:  18 }

people.sort_by do |_, age|
  age
end
```

On line 1, local variable `people` is initialized to the hash `{ Kate: 27, john: 25, Mike:  18 }`.

Next, on line 3, the `Enumerable#sort_by` method is invoked on `people` with a `do...end` block.

The `sort_by` method returns a new array whose elements are the elements from the calling collection sorted according to the criterion given in the block. In order to do this, `sort_by` passes each key and value pair in turn to the block to be assigned to the block parameters `_` and `age` respectively. The parameter name `_` conventionally indicates that this parameter will not be used in the block.

`sort_by` then uses the return value of each element's block iteration as a sort key that is used in place of the associated element in the series of comparisons `sort_by` makes to determine the relative valuation of elements. These comparisons are made with the `<=>` method of the sort key objects returned by the block. `sort_by` then returns a new array containing the elements from the caller sorted in ascending order of the value of the sort-key object associated to each element during the sorting process. In the case of a hash, the key-value pairs will be two-element sub-array elements in the new array, with the key at the first index, the value at the second index.

Within the block, on line 4, the expression `age` is the only evaluated expression in the block and so forms the return value.

Therefore, the key-value pairs in the caller will be sorted according to the numeric value of the value-part, using the `Integer#<=>` method. The `Integer#<=>` method makes a comparison based on numeric value between the calling integer and the argument in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, `1` if the caller is greater. If the object passed as argument cannot be compared to the caller, `<=>` returns `nil`.

So this `sort_by` invocation will return a new array of arrays containing the key-value pairs sorted according to the value of the sort-keys returned by the block: `[[:Mike, 18], [:john, 25], [:Kate, 27]]`.

This example demonstrates how Ruby's `sort_by` method interacts with a block.

--7:48

## 

## Nested Data Structures ###

### 1 ###

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2[1].upcase!

p arr2
p arr1
```

On line 1, local variable `arr` is initialized to the array of strings `["a", "b", "c"]`

Next, on line 2, local variable `arr` is initialized to the return value of invoking the `dup` method on `arr1`. The `dup` method returns a shallow copy of the calling object. Here, a new array object is returned whose elements are the same objects that are elements in the caller. The string objects at each index of `arr1` and `arr2` are the same objects with the same `object_id`.

So when, on line 3, the string element at index `1` of `arr2` has the mutating method `String#upcase!` called on it, the mutation will be reflected when evaluating `arr1`.

Thus, the call to `Kernel#p` on line 5 with `arr2` passed as argument and the call to `p` on line 6 with `arr1` passed as argument will both output `["a", "B", "c"]`; even though the array objects referenced by these two variables are distinct objects, their elements currently are shared between them.

This example demonstrates the effects of making a shallow copy of a collection using Ruby's `dup` method. Whereas a deep copy would mean making a copy of a collection and making copies of its elements, the `dup` method only returns a shallow copy of a collection object, meaning it only copies the object `dup` is called on and not any objects referenced as elements in a collection object.

--8:07

### 2 ###

```ruby
arr1 = ["abc", "def"]
arr2 = arr1.clone
arr2[0].reverse!

arr2
arr1
```



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



### 5 ###

```ruby
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.clone
arr2 << "d"
```

On line 1, local variable `arr1` is initialized to the return value of calling `Object#freeze` on the Array object given in literal notation `["a", "b", "c"]`, which will be the same object in a frozen state. When an object is frozen, it can no longer be mutated by any of its methods and if this is attempted a `FrozenError` will be thrown. The frozen state is mainly significant in relation to mutable objects since immutable objects cannot be mutated anyway. / Only mutable objects can be meaningfully frozen with the `freeze` method since immutable objects cannot be mutated in the first place and are considered always frozen.

On line 2, local variable `arr2` is initialized to the return value of calling `Kernel#clone` on `arr1`. The `clone` method returns a shallow copy of an object with its frozen attribute preserved (unlike `Object#dup`).

Therefore, when the mutating `Array#<<` method is called on `arr2` on line 3, a `FrozenError` will be thrown.

This example demonstrates Ruby's `freeze` and `clone` methods as they relate to the frozen attribute of Ruby objects.

5:45

### 6 ###

```ruby
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.dup
arr2 << "d"

p arr1
p arr2
```



### 7 ###

```ruby
str = "abc".freeze
str << "d"
```



### 12 ###

```ruby
arr = [[1], [2], [3]].freeze
arr[2] << 4
```



### 13 ###

```ruby
arr = ["a", "b", "c"].freeze
arr[2] << "d"
```





## Working With Blocks ##

### 1 ###

```ruby
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
```



### 2 ###

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
```



### 3 ###

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```



### 4 ###

```ruby
[[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```

On line 1, the `Array#each` method is called on array of arrays `[[18, 7], [3, 12]]` with a `do...end` block. The `each` method performs iteration, passing each array element in turn to the block parameter `arr` and executing the block once for each element.

Within the block, on line 2, the  `each` method is called on the array currently referenced by `arr` with a `do...end` block. Each integer element in turn is passed to the second-level block parameter `num`.

Within this second-level block, on line 3, an `if` condition checks whether the integer currently referenced by `num` is greater than `5`. If so, line 4 is executed. On line 4, `num` is passed to the `Kernel#puts` method, which outputs a string representation of the integer to the screen.

Therefore these nested `each` calls with nested blocks output to screen:

```
18
7
12
```

This example demonstrates using nested iterator methods with blocks to iterate over the innermost elements in a nested data structure, with each level of iterator corresponding to each level of the nested data structure.

--5:36

### 5 ###

```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```

On line 1, the `Array#map` method is invoked on array literal `[[1, 2], [3, 4]]` with a `do...end` block. The `map` method iterates through the calling collection passing each nested array element in turn to the block to be assigned to the block parameter `arr`. `map` uses the return value from the block for purposes of transformation, returning a new array whose elements are the objects returned by the block iterations.

Within the block, on line 2, the `map` method is called again on the inner array currently referenced by `arr` with a `do...end` block with the parameter `num`.

Within this inner `map` block, on line 3, the `Integer#*` method is called on the integer currently referenced by `num` with `2` passed as argument. The return value will be the result of multiplying `num` by `2`, and since this is the last evaluated expression in the inner block it will form the block return value to the inner `map` call.

Therefore the inner call to `map` returns a new array whose elements are the integers double the integers from the caller. This new array forms the return value from the outer `map` block.

Therefore the outer `map` call returns a new array whose new nested array elements contain the doubled integers returned by the inner `map` block: `[[2, 4], [6, 8]]`.

This example demonstrates using nested iterators with blocks to perform transformation on the innermost elements of a nested data structure.

--7:20

6

```ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
```

On line 1, we call `Array#select` on an array in literal notation `[{ a: 'ant', b: 'elephant' }, { c: 'cat' }]` with a `do...end` block. `select` iterates through the calling collection passing each hash element to the block to be assigned to the block parameter `hash`. `select` considers the truthiness of the block return value returning a new array containing only those elements from the caller whose block returned a truthy value.

Within the block, the `Enumerable#all?` method is called on `hash` with a `do...end` block. `all?` called with a block iterates through the caller passing each key-value pair to the block to be assigned to parameters `key` and `value` respectively. `all?` considers the truthiness of the block return value, returning boolean `true` if all blocks return a truthy value. If any block returns a falsey value, `all?` immediately returns `false` without further iteration.

Within the inner, `all?` block, on line 3, the `String#[]` method is called on `value` with `0` passed as argument returning a new string whose only character is the character in the caller at index `0`. This is compared for equality with the return value of calling `Symbol#to_s` on `key`, which will be a String representation of the caller. If they are equal, the `==` method returns `true`, `false` otherwise. This is the last evalutated expression in the inner `all?` block and so forms the block return value.

Therefore, this `all?` invocation returns `true` if all symbol keys in the hash currently referenced by `hash` contain a single character which is equal to the first character of the value string. The `all?` invocation is the last expression in the outer `select` block and forms the return value of the outer block.

Therefore this `select` method returns a new array with only those hashes that meet the above criterion: `[{:c=>"cat"}]`

This example demonstrates using nested iterators with blocks to perform selection on a nested data structure.

--8:49

### 7a ###

```ruby
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
arr.sort
```



### 7b ###

```ruby
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
```

On line 1, local variable `arr` is initialized to the array of arrays `[['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]`.

Next, on line 3, the `Enumerable#sort_by` method is invoked on `arr` with a `do...end` block.

The `sort_by` method returns a new array whose elements are the elements from the calling collection sorted according to the criterion given in the block. In order to do this, `sort_by` passes each array element in turn to the block to be assigned to the block parameter `sub_arr`. `sort_by` then uses the return value of each element's block iteration as a sort key that is used in place of the associated element in the series of comparisons `sort_by` makes to determine the relative valuation of elements. These comparisons are made with the <=> method of the sort-key objects returned by the block.

Within the block, on line 4, the `Array#map` method is invoked on `sub_arr` with a `do...end` block. The `map` method iterates through the caller passing each string element in turn to the block to be assigned to block parameter `num`. `map` uses the return value of the block for purposes of transformation, returning a new array whose elements are the elements returned by the block.

Within this inner, `map` block, on line 5, the `String#to_i` method is called on `num`. This returns an Integer version of the string representation of a number. This is the last evaluated expression in the block and so forms the return value of the `map` block.

Therefore this `map` invocation returns a new array with Integer versions of the number strings from the caller. This forms the return value of the outer, `sort_by` block.

Therefore, this `sort_by` invocation returns a new array with the sub-arrays from the caller sorted as though they contained Integer objects rather than String representations of those integers.

This example demonstrates using nested iterators to sort a nested data structure.

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
```





## Practice Problems: Sorting, Nested Collections and Working With Blocks ###

### 1 ###

```ruby
arr = ['10', '11', '9', '7', '8']

arr.sort do |a,b|
  b.to_i <=> a.to_i
end
```

On line 1, local variable `arr` is initialized to the array of string representations of numbers `['10', '11', '9', '7', '8']`.

Next, on line 3, the `Array#sort` method is invoked on `arr` with a `do...end` block. When called with a block, `sort` passes each pair of elements that need to be compared to the block to be assigned to the block parameters `a` and `b`.

`sort` uses the return value from the block as though it were the return value of calling the `<=>` method on the object assigned to the first parameter `a` with the object assigned to the second parameter `b` passed as argument. If the block returns `-1`, the object passed to the first block parameter is considered lesser; if the block returns `0`, they are considered equal; if the block returns `1`, the object passed to the first block parameter is considered greater. The `sort` method then returns a new array object with the elements from the caller sorted in what would be ascending order if the return values from the block were the return values from simple calls to `<=>`.

Within the block, the `String#to_i` method is called on the string currently referenced by `b`, returning an Integer conversion of the String representation of a number. The `Integer#<=>` method is chained on this return value, with an Integer conversion of `a` passed as argument.

The `Integer#<=>` method makes a comparison based on numeric value between the calling integer and the argument in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, `1` if the caller is greater. If the object passed as argument cannot be compared to the caller, `<=>` returns `nil`. If `sort` receives a `nil` return from `<=>`, this causes `sort` to throw an `ArgumentError`.

This is the last evaluated expression in the block and so forms the return value. The effect of this is that `sort` receives a return value from the block for Integer, numerical comparison rather than character-wise, ASCII value-based String comparison, and it receives a comparison where the expected caller and the expected argument have been reversed, reversing the signs of the return values where elements differ in value. Therefore, this `sort` invocation will return a new array containing the String elements from the caller sorted according to the numerical values of the string representations in descending order: `["11", "10", "9", "8", "8"]`

This example demonstrates how Ruby's `sort` method interacts with a block.

--11:00

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

On line 1, local variable `arr` is initialized to the array of arrays `[[2], [3, 5, 7, 12], [9], [11, 13, 15]]`.

On line 3, local variable `new_arr` is initialized to the return value of calling `Array#map` on `arr` with a `do...end` block. The `map` method iterates through the caller passing each sub-array element to the block to be assigned to block parameter `element`. `map` uses the return value of the block to perform transformation, returning a new array whose elements are the objects returned by the block iterations.

Within the `map` block, on line 4, the `Array#select `method is called on the sub-array currently referenced by `element` with a `do...end` block. The `select` method iterates through the caller passing each integer element in turn to the block to be assigned to block parameter `num`. `select` considers only the truthiness of the block return value to perform selection, returning a new array object whose elements are only those elements from the caller whose block returned a truthy value.

Within the `select` block, the expression `num % 3 == 0` acts as a divisibility test; if the integer currently referenced by `num` is divisible by `3` with no remainder, the modulo operator will return `0` and the equality operator will return boolean `true`; otherwise, the equality operator method returns `false`. This is the last evaluated expression in the block and so forms the `select` block return value.

This `select` call therefore returns a new array object with only those integer elements from the caller that are cleanly divisible by `3`. This is the last evaluated expression in the `map` block and so forms the return value.

The `map` invocation therefore returns a new array with new subarrays containing only the integer elements from the `arr` sub-arrays that are divisible by `3`.

This example demonstrates using nested iterators with blocks to perform selection on the innermost elements of a nested data structure.

--8:43

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

On line 1, local variable `arr` is initialized to the array of arrays ` [[2], [3, 5, 7, 12], [9], [11, 13, 15]]`.

Next, on line 3, local variable `new_arr` is initialized to the return value of calling `Array#map` on `arr` with a `do...end` block. `map` iterates through the caller passing each sub-array element in turn to the block to be assigned to the block parameter `element`. `map` uses the return value from the block for purposes of transformation, returning a new array whose elements are the objects returned by the block iterations.

Within the `map` block, on line 4, the `Array#reject` method is called on the array `element` with a `do...end` block. `reject` iterates through the caller passing each element in turn to the block to be assigned to the block parameter `num`. `reject` considers the truthiness of the block return value for purposes of selection, returning a new array containing only those elements whose block returned a falsey value.

Within the `reject` block, on line 5, the expression `num % 3 != 0` functions as a reverse divisibility test to match the reversed selection logic of the `reject` method. If the integer currently referenced by `num` is cleanly divided by `3` without remainder then the `!=` operator method will return `false`, `true` if there is a remainder from the modulo operation. This is the last evaluated expression in the block and so forms the return value.

This invocation of `reject` therefore returns a new array whose elements are only those integer elements from the caller  that are cleanly divisible by `3`. This then forms the block return value for the outer, `map` block.

This `map` invocation therefore returns a new array of new sub-arrays containing only numbers that are divisible by `3`: `[[], [3, 12], [9], [15]]`.

This example demonstrates using nested iterators with blocks to perform selection on the innermost elements of a nested data structure.

--12;12



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

On line 1, local variable `arr` is initialized to the array of arrays `[[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]`. Next, on line 3, local variable `new_arr` is initialized to the return value of calling `Enumerable#sort_by` on `arr` with a `do...end` block.

The `sort_by` method returns a new array whose elements are the elements from the calling collection sorted according to the criterion given in the block. In order to do this, `sort_by` passes each element in turn to the block to be assigned to the block parameter `sub_arr`.

`sort_by` then uses the return value of each element's block iteration as a sort key that is used in place of the associated element in the series of comparisons `sort_by` makes to determine the relative valuation of elements. These comparisons are made with the `<=>` method of the sort key objects returned by the block. `sort_by` then returns a new array containing the elements from the caller sorted in ascending order of the value of the sort-key object associated to each element during the sorting process.

Within the `sort_by` block, on line 4, the `Array#select` method is called on `sub-arr` with a `do...end` block. `select` iterates through the caller passing each element in turn to the block to be assigned to block parameter `num`. `select` considers the truthiness of the block return value, returning a new array whose elements are only those elements from the caller whose block returned a truthy value.

Within the `select` block, on line 5, the `Integer#odd?` predicate method is called on the integer currently referenced by `num`, returning `true` if the integer is odd, `false` otherwise. This is the last evaluated expression in the `select` block and so forms the block return value. This call to `select` thus returns a new array containing only the odd integers from the caller.

Therefore, the `select` invocation returns a new array object for each `sub_arr` in `arr`, which then forms the sort-key for the sub-array element in `arr` when `sort_by` performs sorting.

This `sort_by` invocation therefore returns a new array whose elements are the sub-arrays from the caller sorted as though they contained only their odd integer elements.

So when `new_arr` is passed to `Kernel#p` on line 9, the output will be `[[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]`

--9:30

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



