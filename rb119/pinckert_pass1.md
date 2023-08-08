33

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
array = [1, 2, 3, 4, 5]

array.select do |num|
   puts num if num.odd?
end
```



This example demonstrates how the `select` method uses the truthiness of the block return value for purposes of selection; specifically, it will select for inclusion in the new collection the method returns only those elements whose block returns a truthy value.

On line 1, local variable `array` is initialized to the array `[1, 2, 3, 4, 5]`.

Next, the `Array#select` method is invoked on `array` with a `do...end` block. The `select` method will iterate through the calling array passing each element in turn to be assigned to the block parameter `num`. The `select` method  considers the truthiness of the return value of each element's block iteration for purposes of selection. Those elements whose block iteration returns a truthy value will be added to the new array object returned by `select`.

Within the body of the block, an `if` modifier controls whether the `Kernel#puts` method is invoked with `num` passed as argument. The condition for the `if` statement is the return value of calling `Integer#odd?` on the integer currently referenced by `num`. If the integer is odd, the condition evaluates as true and the `puts` call will execute.

This is the only line of code in the block, and so forms its return value. If the `if` condition evaluates as true, `puts` will return `nil`, since `puts` always returns `nil`; if the condition evaluates as false, then there is no further expression to evaluate and so the block will return `nil` in that case too.

Since `nil` is the only object other than `false` that Ruby does not consider truthy, this means that every block iteration returns a falsey value and so none of the elements from the caller will be selected for inclusion in the new array that `select` returns. So on this call, `select` will return an empty array.

09:57 - still not sure about concepts here. Should I be identifying the concept as simply, how the `select` method uses the block return, or `truthiness in Ruby`?

 34

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.select { |n| n.odd? }
```

On line 1, local variable `arr` is initialized to an array of integers. Next, the `Array#select` method is invoked on `arr` with a `{...}` block.

The `select` method iterates through the calling array passing each element in turn to be assigned to the block parameter `n`. The `select` method considers the truthiness of the return value of the block for purposes of iteration. Only those elements from the caller whose block iteration returns a truthy value will be selected for inclusion in the new array object that `select` will return. Elements whose block iteration returns a falsey value will not be included.

Within the block, the only expression is an invocation of `Integer#odd?` on the integer currently referenced by `n`. `odd?` will return `true` if the integer is odd, `false` otherwise. Since this is the last evaluated expression in the block, the return value of `odd?` will also be the block return value.

Therefore, the `select` method will select for inclusion in the new array that it will return only the odd integers from the calling array.

This example demonstrates how the `select` method uses the return value of its block for purposes of selection; specifically, that it evaluates the truthiness of the object returned by the block.

35

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n| 
  n + 1
end
p new_array
```

On line 1, local variable `arr` is initialized to an array of integers. On line 3, local variable `new_array` is initialized to the return value of an invocation of `Array#select` on the `arr` array with a `do...end` block.

The `select` method iterates through the calling array passing each element in turn to be assigned to the block parameter `n`. `select` considers the truthiness of the return value of the block for purposes of selection. Those elements from the caller whose block iteration returns a truthy value will be selected for inclusion in the new array that `select` will return; those elements whose block iteration returns a falsey value will not be.

Within the block, the only expression is `n + 1`. This returns the integer `1` higher than the integer currently referenced by `n`. Since this is the last evaluated expression in the block, this will form the return value of the block. Since every Integer object in Ruby is considered truthy (like every object except `false` and `nil`), every block iteration here will return a truthy value. Therefore, the new array object returned by `select` to which `new_array` is initialized will contain every element from the calling array. When `new_array` is passed to the `p` method, the method will output `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]` and return a reference to the argument, as `p` always does.

This example demonstrates how `select` uses the truthiness of the block return value to determine which elements are selected for inclusion in the new array object it will return.

-- 8:31

36

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n| 
  n + 1
  puts n
end
p new_array
```



On line 1, local variable `arr` is initialized to an array of integers, `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

Next, local variable `new_array` is initialized to the return value of an invocation of `Array#select` with a block on the `arr` array. The `select` method iterates through `arr` passing each element in turn to be assigned to the block parameter `n`. The `select` method considers the truthiness of the block return value to determine which elements are to be included in the new array object that it will return. If an element's block iteration returns a truthy value, then the element will be selected; elements whose blocks return falsey values will not.

Within the block definition, the first expression is simply `n + 1`. This call to the `Integer#+` method returns the integer `1` higher than the caller. Nothing is done with the return value, however.

Next, on line, 5, the `puts` method is invoked with `n` passed as argument; this will output `n` to the terminal and return `nil`, since `puts` always returns `nil`. Since this is the last evaluated expression in the block, it also forms the return value.

Since in Ruby, `nil` is the only object other than `false` that is not considered truthy, this means that every block iteration returns a falsey value and no elements from the caller will be selected for inclusion in the array `select` returns to be assigned to `new_array`.

So when, on line 7, `new_array` is passed to the `p` method,  it will output `[]`, signifying an empty array.

This example demonstrates how `select` uses the truthiness of the block return value in order to determine selection.

-- 7:29

37

```ruby
words = %w(jump trip laugh run talk)

new_array = words.map do |word|
  word.start_with?("t")
end

p new_array
```

On line 1, local variable `words` is initialized to an array of strings `["jump", "trip", "laugh", "run", "talk"]`. Next, local variable `new_array` is initialized and assigned the return value of calling `Array#map` with a block on the `words` array.

`map` iterates through the calling array passing each element in turn to the block to be assigned to the block parameter `word`; `map` uses the return value of each block for purposes of transformation, ultimately returning a new array whose elements are the objects returned by each block iteration, one for each element in the caller.

Within the block, the only expression is an invocation of `String#start_with?` on the string currently referenced by `word`, with the string literal `"t"` passed as argument. This call will return `true` if the string starts with lowercase `t`, `false` otherwise. Since this is  the last evaluated expression in the block it also forms the return value of the block.

Since elements at indexes 1 and 4 start with a `t` and the other string elements do not, this `map` invocation will return a new array `[false, true, false, false, true]` to be assigned to variable `new_array`. Consequently, when `new_array` is passed to the `p` method, that is what is output to the terminal. `p` returns a reference to the argument, as `p` always does.

This example demonstrates how `map` makes use of the return value of its block for purposes of transformation.

-- 8:10

### 38 ###

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.each { |n| puts n }
```

On line 1, local variable `arr` is initialized to an array of integers `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

Next, the `each` method is invoked on `arr` with a block. The `each` method iterates through the calling array passing each element in turn to be assigned to block parameter `n`. `each` will execute the block for each element and ignore the block's return value before returning a reference to the calling collection, `arr`.

Within the block, the only expression is a `Kernel#puts` invocation with `n` passed as argument. This will output the integer currently referenced by `n` to terminal and return `nil`, since `puts` always returns `nil`. Given that this is the last evaluated expression in the block, this will also form the block return, but `each` ignores this.

Therefore this code will output to screen

```
1
2
3
4
5
6
7
8
9
10
```

before returning a reference to the array referenced by `arr`.

This example demonstrates how the `each` method is used for purposes of iteration, executing the given block once for each element, ignoring the return values from the block and returning a reference to the caller.

--5:34

### 39 ###

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

incremented = arr.map do |n| 
            n + 1
            end
p incremented
```

On line 1, local variable `arr` is initialized to an array of integers `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. 

Next, local variable `incremented` is initialized and assigned the return value of calling `map` with a block on the array referenced by `arr`. The `Array#map` method iterates through the calling array passing each element in turn to the block to be assigned to block parameter `n`. `map` uses the return value of the block for purposes of transformation, ultimately returning a new array object whose elements are the objects returned by the block for each of the caller's elements' block iterations.

Within the block definition, on line 4, the `Integer+` method is invoked on the integer currently referenced by `n` with `1` passed as argument. This will return the integer `1` higher than the caller. Since this is the last evaluated expression in the block, this will also form the block return value.

This `map` invocation will therefore return a new array whose elements are the integers `1` higher than each integer element in the caller at the corresponding position: `[2, 3, 4, 5, 6, 7, 8, 9 , 10, 11]`. This new array is then assigned to the variable `incremented`.

So when, on line 6, `incremented` is passed as argument to the `p` method, `p` will output to screen `[2, 3, 4, 5, 6, 7, 8, 9 , 10, 11]` and return a reference to the argument, as `p` always does.

This example demonstrates how the `map` method uses the return value of the block for purposes of transformation, returning a new array equal in size to the caller whose elements are the objects returned by the block for each of the caller's elements' block iterations.

--7:41

### 40 ###

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n| 
  n > 1
end
p new_array
```

 On line 1, local variable `arr` is initialized to an array of integers. Next, local variable `new_array` is initialized to the return value of calling `Array#map` on `arr`.

The `map` method iterates through the calling array passing each element in turn to be assigned to the block parameter `n`. `map` uses the return value of each element's block iteration for purposes of transformation, ultimately returning a new array object whose elements are the objects returned by each block iteration.

Within the body of the block, the only expression is `n > 1`.  The `Integer#>` method will return `true` if the integer currently referenced by `n` is greater than `1`, `false` otherwise. This is the last evaluated expression and so also forms the block's return value.

The new array object returned by this invocation of `map` and assigned to `new_array` on line 3 will therefore consist of Boolean objects `true` and `false`. So when `new_array` is passed to the `Kernel#p` method on line 6, the method will output `[false, true, true, true, true, true, true, true, true, true]` and return a reference to the caller, as `p` always does.

This example demonstrates how the `map` method uses the return values of its block to perform transformation; specifically, it demonstrates that `map` does not consider the truthiness of the object returned but simply adds the object itself to the new array that it returns.

--6:56



### 41 ###

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n| 
  n > 1
  puts n
end
p new_array
```

On line 1, local variable `arr` is initialized to the array of integers `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

Next, local variable `new_array` is initialized to the return value of an invocation of `Array#map` on `arr` with a block. The `map` method iterates through the calling array passing each element in turn to the block to be assigned to block parameter `n`. `map` uses the return value of the block for purposes of transformation, ultimately returning a new Array object whose elements are the objects returned by the block iterations, one for each element in the calling array.

Within the block, on line 4, the first expression `n > 1` returns Boolean object `true` or `false` depending on whether the integer currently referenced by `n` is greater than `1`. However, this return value is not used. On the next line, the `puts` method is invoked with `n` passed as argument. This will output to screen the integer currently referenced by `n` and return `nil` as `puts` always does. This is the last expression evaluated within the block, and so forms the block return value.

Since every block returns `nil`, the new Array object returned by this `map` invocation will be `[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]`.

This example demonstrates how Ruby's `map` method uses the return value of the given block; specifically, it demonstrates that `map` has no interest in the truthiness or falsiness of the return value but simply adds the object returned to the new array that the `map` method ultimately returns.

--12:47

### 42 ###

```ruby
a = "hello"

[1, 2, 3].map { |num| a }
```

On line 1, local variable `a` is initialized to the string literal `"hello"`.

Next, `Array#map` is invoked on array literal `[1, 2, 3]` with a block. The `map` method iterates through the calling collection passing each element in turn to the block to be assigned to the block parameter `num`. `map` will return a new Array object whose elements are the objects returned by each block iteration, one for each element in the calling array.

Within the block, the only expression is `a`. Since this is the last evaluated expression in the block, it forms the block return value. This invocation of `map` will therefore return a new array object `["hello", "hello", "hello"]`.

This example demonstrates how Ruby's `map` method uses the block return value for transformation; specifically, each of the calling collection's elements is passed to the block in turn and the object returned by each block iteration is placed in the new array object that `map` returns. 

--3:52

### 43 ###

```ruby
[1, 2, 3].each do |num|
  puts num
end
```

On line 1, the `Array#each` method is invoked with a block on array literal `[1, 2, 3]`. The `each` method performs iteration, passing each element from the calling collection to the block in turn to be assigned to the block parameter `num`. `each` ignores the block return value and ultimately returns a reference to the calling collection.

Within the block, on line 2, the `puts` method is called with the integer currently referenced by `num` passed as argument. This will output a string representation of the integer to screen and return `nil`, as `puts` always does. This is the last evaluated expression in the block and so forms the block return value, but `each` ignores this.

Finally, `each` returns a reference to the `[1, 2, 3]` array object on which it was called. 

This example demonstrates how the `each` method is used to perform iteration over a collection of elements.

--4:51



### 44 ###

```ruby
[1, 2, 3].any? do |num|
  num > 2
end
```

On line 1, the `Array#any?` method is invoked on array literal `[1, 2, 3]` with a `do...end` block. The `any?` method iterates through the calling collection passing each element in turn to the block to be assigned to block parameter `num`. The `any?` method returns Boolean object `true` as soon as any block iteration returns a truthy value, otherwise it will return `false` once it has finished iterating over the collection.

Within the block, the only expression is `num > 2`. The `Integer#>` comparison operator method will return `true` if the integer currently referenced by `num ` is greater than `2`, `false` otherwise. This is the last expression evaluated in the block and so forms the return value.

The first two block iterations will return `false`, since `1` and `2` are not greater than `2`. The third iteration will return `true` since `3` is greater than `2`, and so this `any?` invocation will then return `true`.

This example demonstrates how the predicate method `any?` method uses the block return value; specifically, it considers the truthiness or falsiness of each block return in order to ultimately decide whether to return `true` or `false`.

--7:24

### 45

**Current time:** 5:35

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end
```

On line 1, the `Hash#any?` method is invoked on the hash literal `{ a: "ant", b: "bear", c: "cat" }` with a `do...end` block. The `any?` method iterates through the calling collection passing each key-value pair in turn to the block, the key object  to be assigned to the `key` block parameter and the value object to the `value` parameter. The `any?` method returns `true` as soon as any element's block iteration returns a truthy value.

Within the block, the only expression is `value.size > 4`. This calls the `size` method on the string currently referenced by `value`, which returns an integer representing the number of characters in the string; the `Integer#>` method is then chained on this return value and compares to check whether it is greater than `4`, returning `true` if so, `false` otherwise. This is the last evaluated expression in the block and so forms the block return value.

This `any?` invocation will therefore return `false`, since none of the strings in the value part of the hash have a `size` greater than `4`.

This example demonstrates how the predicate method `any?` considers the truthiness of the block return value in order to return a Boolean object, `true` or `false`, depending on whether any element's block iteration returns a truthy value.

--7:11

### 46

**Current time:** 3:48

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
[1, 2, 3].all? do |num|
  num > 2
end
```

On line 1, the `Array#all?` method is invoked on array literal `[1, 2, 3]` with a `do...end` block. The `all?` method iterates through the calling collection passing each element in turn to the block to be assigned to block parameter `num`. The `all?` method returns `true` if every block returns a truthy value, or `false` as soon as any element's block iteration returns a falsey value.

Within the block, the only expression is the comparison `num > 2`.  The `Integer#>` method checks whether the integer currently referenced by `num` is greater than `2`, returning `true` if so, `false ` otherwise. This is the last expression evaluated in the block and so forms the block return value.

This `all?` invocation therefore returns `false` after the first iteration, since `1` is not greater than `2` and it is not necessary to check the rest of the elements by passing them to the block for iteration.

This example demonstrates how Ruby's `all?` method uses the return value of the block; specifically, it considers the truthiness of the block return value.

--5:27

### 47

**Current time:** 6:22

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end
```

On line 1, the `Enumerable#all?` method is invoked on hash literal `{ a: "ant", b: "bear", c: "cat" }` with a `do...end` block. The `all?` method iterates through the calling collection passing each key-value pair to the block to be assigned to the block parameters, `key` and `value` respectively. `all?` will return `true` if every block iteration returns a truthy value, or `all?` will return `false` as soon as a block returns a falsey value.

Within the block, the only expression is `value.length >= 3`. Here, the `String#length` method is called on the string currently referenced by `value`, which returns the number of characters in the string as an integer. This returned integer object then has a call to `Integer>=` chained on it with `3` passed as argument; this comparison method returns `true` if the integer is greater than or equal to `3`, `false` otherwise. This is the last expression evaluated in the block and so forms the blocks return value.

This `all?` invocation therefore returns `true`, since all of the strings in the value part of the hash have a length of 3 characters or more.

This example demonstrates how the `all?` method uses the block return value; specifically, the `all?` method considers the truthiness of the object returned by the block.

--6:06



### 48

**Current time:** 5:46

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end
```

On line 1, the `Array#each_with_index` method is invoked on array literal `[1, 2, 3]` with a `do...end` block. The `each_with_index` method iterates through the calling collection passing each element and the integer index of that element to the block to be assigned to the block parameters `num` and `index` respectively. The `each_with_index` method ignores the return value of the block and returns a reference to the calling collection.

Within the block, a string literal with string interpolation `"The index of #{num} is #{index}."` is passed to an invocation of the `puts` method. This will output to screen the string -- with the objects currently referenced by `num` and `index` interpolated into the specified locations -- and return `nil`, since `puts` always returns `nil`. This is the last evaluated expression in the block and so forms the block return value, but `each_with_index` ignores this.

This `each_with_index` invocation therefore outputs to screen:

```
The index of 1 is 0.
The index of 2 is 1.
The index of 3 is 2.
```

The method then returns a reference to the object instantiated in literal notation on which it was called.

This example demonstrates how the `each_with_index` method is used for iteration over a collection of elements with the integer index of each element available within the block in a block parameter.

--6:18

### 49

**Current time:** 11:23

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end
```

On line 1, the `Enumerable#each_with_object` method is invoked on hash literal `{ a: "ant", b: "bear", c: "cat" }` with an empty array object passed as argument and a `do..end` block. The `each_with_object` method iterates through each key-value pair in the calling collection passing them as a two-element array to the block to be assigned to block parameter `pair`. On each iteration, the given object argument to the method, here an initially empty array, is passed to the block to be assigned to the block parameter `array`. This object, including any mutations performed on it by the block iterations, forms the return value of `each_with_object`.

Within the block, the `Array#last` method is called on the key-value pair array currently referenced by `pair`. This returns the last element, the value part of the key-value pair. This is then destructively appended to the `array` object by the `Array#<<` method. This is the last evaluated expression in the block and so forms the block return value, but `each_with_object` ignores this.

This `each_with_object` invocation therefore appends every value string in the calling hash to the initially-empty array passed as argument before returning this array populated by elements after all block iterations are complete.

This example demonstrates how Ruby's `each_with_object` can be used to iteratively construct a new collection object.

--8:39

### 50

**Current time:** 8:37

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
```

On line 1, the `Enumerable#each_with_object` method is invoked on hash literal `{ a: "ant", b: "bear", c: "cat" }` with an empty Hash object passed as argument and a `do...end` block. The `each_with_object` method iterates through the calling collection passing each key-value pair in turn to the block to be assigned to block to be assigned to the block parameters `key` and `value` respectively. The key-value pair is passed as two-element array which is then split using `(key, value)` multiple assignment syntax to assign each element to a separate parameter. Along with each key-value pair, the Hash object given as argument to `each_with_object` is passed into the block on each iteration to be assigned to block parameter `hash`. After all block iterations have finished, `each_with_object` will return the object passed as argument, here the initially-empty Hash object referenced as `hash` in the block.

Within the block definition, hash element assignment is used to assign the `value` part of the key-value pair as a new key in `hash` which is associated with the key part `key` as the value part in the `hash` hash. This will iteratively build a new hash where each key from the caller is a value in the new hash, and vice versa. This element assignment is the last evaluated expression in the block and so forms the block return value, but `each_with_object` ignores this.

This `each_with_object` therefore returns the Hash object passed as argument which is now populated with key-value pairs: { "ant" => :a, "bear" => :b, "cat" => :c}.

This example demonstrates how `each_with_object` can be used to iteratively build and return a new Hash object based on the elements of the calling collection.

--9:39

### 51

**Current time:** 8:00?

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
odd, even = [1, 2, 3].partition do |num|
  num.odd?
end

p odd 
p even
```

On line 1, multiple assignment is used to initialize local variables `odd` and `even` to the return value of calling `Enumerable#partition` on array literal `[1, 2, 3]` with a `do...end` block. The `partition` method iterates through the calling collection passing each element in turn to the block to be assigned to the block parameter `num`. The `partition` method considers the truthiness of the block return value in order to return an array with two nested subarrays, the first of which contains those elements from the calling array whose block returned a truthy value, while the second contains those elements from the caller whose block returned a falsey value. The multiple assignment syntactic sugar will assign one subarray to `odd`, the other to `even`.

Within the block, on line 2, the `Integer#odd?` method is called on the Integer currently referenced by `num`. This method returns `true` if the integer is odd, `false` otherwise. This is the last evaluated expression in the block and so forms the return value.

This invocation of `partition` therefore returns an array of two nested subarrays, the first of which holds the odd integers from the caller whose block returned a truthy value `[1, 3]`; this subarray is assigned to `odd`. The second subarray of even numbers whose block iterations returned a falsey value is assigned to the `even` variable: `[2]`.

Thus when `odd` is passed to the `Kernel#p` method on line 5, the method will output `[1, 3]` and return a reference to the argument. When on the last line, `even` is passed to `p`, it will output `[2]`, and return a reference to the argument.

This example demonstrates how the `partition` method uses the return value of the block; specifically, it considers the truthiness of the block return value in order to divide elements in the caller into two separate sub-arrays in the new array object the method returns.

--10:37



## Truthiness

 

### 53

**Current time:** 4:00

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end
```

On line 1, local variable `a` is initialized to the string `"Hello"`.

An `if...else` statement extends over lines 3-7. The conditional expression for the `if` branch is simply `a`. If the object referenced by `a` evaluates as true in a Boolean context, this branch is followed and the `puts` invocation on line 4 is executed, with string literal `"Hello is truthy"`  passed as argument. If the object referenced by `a` evaluates as false, the `else` branch is followed and the string `"Hello is falsey"` is passed to a `puts` invocation on line 6.

Since Ruby considers every object other than `false` and `nil` to be truthy and `a` references a String object, `a` evaluates as true in a Boolean context and the code on line 4 is executed. This call to `puts` outputs `Hello is truthy` to the screen and returns `nil`, since `puts` always returns `nil`.

This example demonstrates Ruby's rules on truthiness.

--6:27

### 54

**Current time:** 5:11

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def test
  puts "written assessment"
end

var = test

if var
  puts "written assessment"
else
  puts "interview"
end
```

On line 5, the first line of code that is not a method definition, local variable `var` is initialized to the return value of calling the `test` method. The `test` method is defined on lines 1-3. The only line of code in the method body is the `puts` invocation on line 2, with string literal `"written assessment"` passed as argument. This will output this string to the screen, and return `nil`. Since this is the last evaluated expression in the method definition, this forms the method's return value. Thus, on line 5, `var` is initialized to `nil`.

Next, on line 7, an `if` statement begins. The `if` condition is simply the variable `var`. If the object referenced by this variable evaluates as true in a Boolean context, the `if` branch is followed and the code on line 8 will be executed. Otherwise, the `else` branch is followed. Since `var` references `nil`, and Ruby considers `nil` to be the only object that evaluates as false in a Boolean context other than the object `false`, the `else` branch is followed and the `puts` invocation on line 10 is executed. This outputs the string argument `"interview"` to screen, and returns `nil`, since `puts` always returns `nil`.

This example demonstrates Ruby's rules on truthiness. Specifically, it demonstrates that Ruby considers all objects to be truthy except for `false` and `nil`.

--7:18

