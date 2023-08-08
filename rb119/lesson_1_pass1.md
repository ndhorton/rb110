# Lesson 1 #

## Practice Problems: Methods and More Methods ##

### 1 ###

What is the return value of the `select` method below? Why?

```ruby
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
```

On line 1, the `Array#select` method is invoked on array literal `[1, 2, 3]` with a `do...end` block. The `select` method iterates through the calling collection passing each element in turn to the block to be assigned to block parameter `num`. `select` considers the truthiness of the return value of the block for purposes of selection. If an element's block iteration returns a truthy value, then that element is selected for inclusion in the new array that `select` will return; if the block returns a falsey value, the element is not selected.

Within the block, on line 2, the `Integer#>` method is invoked on the integer currently referenced by `num` with `5` passed as argument. This comparison operator method will return `true` if the integer referenced by `num` is greater than `5`, `false` otherwise. However, nothing is done with this return value.

On line 3, there is simply the string literal `'hi'`. This is the last evaluated expression in the block and so forms its return value.

Since every block returns a String object, and every object in Ruby is considered truthy except for `false` and `nil`, this means every block returns a truthy value and the new array returned by this `select` invocation contains every element from the calling array: `[1, 2, 3]`.

This example demonstrates how Ruby's `select` method uses the return value from the block; specifically it considers the truthiness of the return value for purposes of selection.

--7:01

<details>
    <summary>Answer</summary>
    <code># => [1, 2, 3]</code><br>
    <code>select</code> performs selection based on the truthiness of the block's return value.
    In this case the return value will always be <code>'hi'</code>, which is a "truthy" value. Therefore <code>select</code> will return a new array containing all of the elements in the original array.[1]
</details>



### 2 ###

How does `count` treat the block's return value? How can we find out?

```ruby
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
```

On line 1, the `Array#count1` method is invoked on array literal `['ant', 'bat', 'caterpillar']` with a `do...end` block. The `count` method iterates through the calling collection passing each element in turn to the block to be assigned to block parameter `str`. The `count` method considers the truthiness of the return value of the block; `count` returns an integer representing the number of elements whose block iterations returned a truthy value.

Within the block, on line 2, the return value of calling `String#length` on the string currently referenced by `str` is compared to `4` using the `Integer#<` method. If the return value of `length` is less than 4, the `<` method will return `true`, `false` otherwise. This is the last evaluated expression in the block and so forms the return value.

Therefore, this invocation of `count` will return `2`, since `ant` and `bat` are less than 4 characters in length.

This example demonstrates how Ruby's `count` method, when called with a block, uses the block's return value; specifically, it counts the number of block iterations that return a truthy value.

--7:52

<details><summary>Answer</summary>
    If we don't know how count treats the block's return value, then we should consult the docs for <code>Array#count</code>. Our answer is in the description:<br>
    <center><code>returns the count of elements for which the block returns a truthy value</code></center>Based on this information, we can conclude that count only counts an element if the block's return value evaluates as true. This means that count considers the <i>truthiness</i> of the block's return value.</details>



### 3 ###

What is the return value of `reject` in the following code? Why?

```ruby
[1, 2, 3].reject do |num|
  puts num
end
```

On line 1, the `Array#reject` method is invoked on array literal `[1, 2, 3]` with a `do...end` block. The `reject` method iterates through the calling collection passing each element in turn to the block to be assigned to block parameter `num`. `reject` considers the truthiness of the block return value for purposes of selection; `reject` will return a new array containing only those elements from the caller whose block returned a falsey value -- either `false` or `nil`, since these are the only objects that Ruby does not consider truthy.

Within the block, on line 2, the `Kernel#puts` method is invoked with the integer currently referenced by `num` passed as argument. This will output the number to the terminal and return `nil`, since `puts` always returns `nil`. This is the last evaluated expression in the block and so forms the block return value.

Since every element's block execution will return a falsey value, every element will be selected for inclusion in the new array that this invocation of `reject` returns: `[1, 2, 3]`.

This example demonstrates how Ruby's `reject` method uses the block return value; specifically, it considers the truthiness of the block return value for purposes of selection.

--7:29

<details><summary>Answer</summary>
    <code># => [1, 2, 3]</code><br>
    Since <code>puts</code> always returns <code>nil</code>, you might think that no values would be selected and an empty array would be returned. The important thing to be aware of here is how reject treats the return value of the block. reject returns a new array containing items where the block's return value is "falsy". In other words, if the return value was false or nil the element would be selected.
</details>



### 4 ###

What is the return value of `each_with_object` in the following code? Why

```ruby
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
```

On line 1, the `Enumerable#each_with_object` method is invoked on array literal `['ant', 'bear', 'cat']` with an empty hash object passed as argument in literal notation and a `do...end` block. The `each_with_object` method iterates through the calling array passing each element in turn to the block to be assigned to parameter `value`'; on each iteration, the hash object passed as argument is passed in to the block and assigned to the block parameter `hash`. `each_with_object` executes the block once for each element, ignoring the block return value, and after iteration will return the object passed as argument.

Within the block, on line 2, hash element assignment is used to create a new key value pair. The key will be the return value of a string element reference to index `0` of the string object currently referenced by `value`; this will return a new single-character String object whose value is the first character of `value`. The value part of the new key-value pair is the string referenced by `value` itself. This is the last evaluated expression in the block and so forms its return value, but `each_with_object` ignores this.

Therefore, this invocation of `each_with_object` returns the initially-empty hash object passed to the method in literal notion, now populated with key-value pairs `{"a"=>"ant","b"=>"bear","c"=>"cat"}`

This example demonstrates how Ruby's `each_with_object` interacts with both an argument and a block; specifically, it demonstrates a typical use case -- building a new collection object of some kind.

--9:56 not sure about what this example demonstrates

Having read the answer, it's maybe that `each_with_object` makes available an object within the block on each iteration for purposes of iterative mutation.

<details>
    <summary>Answer</summary>
    <code># => { "a" => "ant", "b" => "bear", "c" => "cat" }</code><br>Based on our knowledge of <code>each</code>, it might be reasonable to think that <code>each_with_object</code> returns the original collection. That isn't the case, though. When we invoke <code>each_with_object</code>, we pass in an object (<code>{}</code> here) as an argument. This object is then available inside the block, such that it can be mutated. Once <code>each_with_object</code> has iterated over the calling collection, it returns the initially given object, which now contains all of the updates.<br><br>In this code, we start with the hash object, <code>{}</code>. On the first iteration, we add <code>"a" => "ant"</code> to the hash. On the second, we add <code>"b" => "bear"</code>, and on the last iteration, we add <code>"c" => "cat"</code>. Thus, <code>#each_with_object</code> in this example returns a hash with those 3 elements.
</details>



### 5 ###

What does `shift` do in the following code? How can we find out?

```ruby
hash = { a: 'ant', b: 'bear' }
hash.shift
```

On line 1, local variable `hash` is initialized to hash literal `{ a: 'ant', b: 'bear' }`. Next, the `Hash#shift` method is called on `hash`. This will return the first key-value pair in insertion order as a two-element array: `[:a, "ant"]`. This information can be found by reading the documentation or through experiment in a Ruby REPL such as IRB or Pry.

--4:19

<details><summary>Answer</summary>
    <p><code>shift</code> destructively removes the first key-value pair in hash and returns it as a two-item array. If we didn't already know how <code>shift</code> worked, we could easily learn by checking the docs for <code>Hash#shift</code>. The description for this method confirms our understanding:<br><br><center><code>Removes a key-value pair from hsh and returns it as the two-item array [ key, value ], or the hash’s default value if the hash is empty.</code></center><br><br>There are quite a few Ruby methods, and you're not expected to know them all. That's why knowing how to read the Ruby documentation is so important. If you don't know how a method works you can always check the docs.</p></details>



### 6 ###

What is the return value of the following statement? Why?

```ruby
['ant', 'bear', 'caterpillar'].pop.size
```

The `Array#pop` method is here called on array literal `['ant', 'bear', 'caterpillar']`; this will destructively remove and return the last element `'caterpillar'`. A call to `String#size` is chained on this return value, and returns an integer representation of the number of characters in the string, `11`.

--2:42

### 7 ###

What is the **block**'s return value in the following code? How is it determined? Also, what is the return value of `any?` in this code and what does it output?

```ruby
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
```

On line 1, the `Array#any?` method is invoked on array literal `[1, 2, 3]` with a `do...end` block. The `any?` method iterates through the calling array passing each element in turn to the block to be assigned to block parameter `num`. `any?` considers the truthiness of the block return value. If any block iteration returns a truthy value, `any?` will immediately return `true` but if all blocks return falsey values then `any?` will return `false`.

Within the block, on line 2, the `puts` method is invoked with `num` passed as argument. This will output the integer currently referenced by `num` to screen and return `nil` as `puts` always does. Next, on line 3, the `Integer#odd?` method is invoked on `num`. This will return `true` if `num` currently references an odd integer, `false` otherwise. This is the last evaluated expression in the block and so forms its return value.

Consequently, the only block return value during this invocation of `any?` will be `true`, since the first element in the collection is `1` and so the `odd?` method will return `true`. At this point, `any?` ceases block iteration and returns `true` because `any?` is checking whether the criterion in the block is true for at least one element and this has already been confirmed. For the same reason, the `puts` call will only execute once with `1` passed as argument, so this is all that this code will output.

This example demonstrates how Ruby's `any?` method uses the return value of the block; specifically, it considers the truthiness of the block return and if it receives a single truthy block return, it ceases to iterate and returns `true`.

--9:55

### 8 ###

How does `take` work? Is it destructive? How can we find out?

```ruby
arr = [1, 2, 3, 4, 5]
arr.take(2)
```

On line 1, local variable `arr` is initialized to the array `[1, 2, 3, 4, 5]`. Next, the `Array#take` method is invoked on `arr` with `2` passed as argument. This will non-destructively return the ~~last~~ **first** two elements from `arr` in a new array object. This information can be found by consulting the documentation for Ruby's Array class.

--1:40 but I was WRONG -- it returns the **first** *n* elements not the last *n* elements

### 9 ###

What is the return value of `map` in the following code? Why?

```ruby
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```

On line 1, `Enumerable#map` is invoked on hash literal `{ a: 'ant', b: 'bear' }` with a `do...end` block. The `map` method iterates through each key-value pair in the hash in turn, passing the key and value objects to the block to be assigned to block parameters `key` and `value` respectively. The `map` method uses the return value of the block for purposes of transformation, returning a new array object whose elements are the objects returned by the block.

Within the block, on line 2, is an `if` statement whose condition uses the `Integer#>` method to check whether the integer return value of calling `String#size` on the string currently referenced by `value` is greater than `3`. If so, then the simple expression `value` on line 3 forms the block's return value, since it will then be the last evaluated expression in the block. Since there is no `else` branch and no more expressions in the block, if the `if` condition evaluates as `false` then the `if` expression returns `nil` and the return value of the block will be `nil`.

On the first iteration, the return value of calling `size` on the first hash value `"ant"` will be `3`. This means the block will return `nil`, since `3` is not greater than `3`. On the second iteration, the condition evaluates as true since the return value of calling `size` on `"bear"` will be `4`, so this block iteration returns `"bear"`. Therefore, this `map` invocation will return `[nil, "bear"]`.

This example demonstrates how the `map` method uses the return value of the block for purposes of transformation.

--9:39 == Possibly should say something about Enumerable#map always returning an array even if called on a hash???

### 10 ###

What is the return value of the following code? Why?

```ruby
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
```

On line 1, the `Array#map` method is invoked on array literal `[1, 2, 3]` with a `do...end` block. The `map` method iterates through the calling array passing each element in turn to the block to be assigned to block parameter `num`. The `map` method uses the return value of the block for purposes of transformation, returning a new array whose elements are the objects returned by the block.

Within the block, an `if...else` statement extends over lines 2-6. The `if` condition checks whether the integer currently referenced by `num` is greater than `1`. If so, line 3 is executed, calling the `Kernel#puts` method with `num` passed as argument. This will output the integer to screen and return `nil`, since `puts` always returns `nil`. If this branch is followed, then `nil` will form the return value of the block since there are no further expressions in the block left to be evaluated. If the `if` condition evaluates as false, then the `else` branch on line 5 is executed, which simply states `num` as the return value of the block.

This `map` invocation therefore outputs to screen `2` and `3`, since these elements are greater than `1`. The return value of this `map` invocation will be `[1, nil, nil]` because of the logic explained above.

This example demonstrates how the `map` method uses the return value of the block for purposes of transformation.

--8:40



## Practice Problems: Additional Practice ##

### 1 ###

```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end
```

On line 1, local variable `flintstones` is initialized to the array `["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]`. Next, on line 3, the local variable `flintstones_hash` is initialized to an empty hash.

Following these initializations, the `Array#each_with_index` method is invoked on `flintstones` with a `do...end` block. The `each_with_index` iterates through the calling array passing each element in turn to the block to be assigned to the block parameter `name`; on each iteration, the index of the current element is also passed to the block to be assigned to block parameter `index`. `each_with_index` performs iteration, ignoring the return value of the block and ultimately returning a reference to the calling collection.

Within the block, on line 5, hash element assignment is used to initialize a new key-value pair whose key is the string currently referenced by `name` and whose value is the integer currently referenced by `index`. This operation returns the value part of the element assignment, the integer referenced by `index` and since this is the last evaluated expression in the block it forms the block return value; however, `each_with_index` ignores this.

This invocation of `each_with_index` thus iteratively populates the `flintstones_hash` hash with key-value pairs:

```
{"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5}
```

It returns a reference to the `flintstones` array on which it was invoked.

This example demonstrates how `each_with_index` performs iteration, making the index of each element available within the block along with each element itself.

--9:25

### 2 ###

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.inject(:+)
```

On line 1, local variable `ages` is initialized to the hash `{ "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }`.

On line 3, the `Hash#values` method is invoked on `ages` returning a new array that contains only the values from the hash: `[32, 30, 5843, 10, 22, 237]`. Chained on this returned array is a call to `Enumerable#inject` with the symbol `:+` passed as argument. This symbol names the method that `inject` should use, in this case the `+` method. Since the elements are integers, this will mean the `Integer#+` method. The `+` method is called on the first element with the second element passed as argument; thereafter, `+` is called again on each return value with the next element passed as argument. Here, this will successively sum all of the integers in the calling array and `inject` will then return the total sum. This will  be `6174`.

As well as method chaining, this example demonstrates how the `Enumerable#inject` method can be called with the name of a method passed as argument in place of a block.

--?:??

### 3 ###

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.keep_if { |_, age| age < 100 }
```

~~On line 1, local variable ages is initialized to the hash `{ "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }`.~~

~~On line 3, `Enumerable#keep_if` is invoked on `ages` with a `{...}` block. `keep_if` will iterate through the calling hash passing each key-value pair in turn to the block to be assigned to the block parameters. Here, the value object is assigned to block parameter `age`, while the key object is assigned to `_`, signifying by Ruby convention that this particular block parameter will not be used. `Enumerable#keep_if` considers the truthiness of the block return value for purposes of selection, returning a new array containing only those elements whose block iteration returned an object considered truthy by Ruby, that is an object other than `false` or `nil`.~~

~~Within the block, the only expression is an invocation of `Integer#<` on the integer currently referenced by `age` with `100` passed as argument. This will return `true` if `num` is less than `100`, `false` otherwise. Since this is the last evaluated expression in the block, it forms the block return value.~~

~~Therefore, this invocation of `keep_if` will return a new array whose elements are those value objects from the caller less than 100: `[32, 30, 10]`.~~

~~This example demonstrates how Ruby's `Enumerable#keep_if` method uses the return value of the block; specifically, `keep_if` considers the truthiness of the block return value for purposes of selection.~~

--6:59 AND THIS IS WRONG!!!! Hash has a keep_if method. AAAAAH!

On line 1, local variable `ages` is initialized to the hash given in literal notation `{ "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }`. Next, on line 3, the `Hash#keep_if` method is invoked on `ages` with a `{...}` block. The destructive `keep_if` method iterates through the calling hash passing each key-value pair to the block to be assigned to the block parameters. In this case, the value object is assigned to block parameter `age`, while the key object is assigned to block parameter `_`, a naming convention that signifies that this parameter won't need to be used in this particular block. `keep_if` considers the truthiness of each block return value for purposes of mutating selection; only those key-value pairs from the caller whose block iteration returns a truthy value will be selected to be retained in the calling hash, while those key-value pairs whose blocks returned `false` or `nil` will be destructively removed from the calling hash.

Within the block, the only expression is `age < 100`. This calls the `Integer#<` method on `age` with `100` passed as argument, which returns `true` if the integer currently referenced by `age` is less than 100, `false` otherwise. Since this is the last evaluated expression in the block, it forms the block return value.

Therefore, this invocation of `keep_if` returns a reference to the caller whose state is now: `{ "Herman"=>32, "Lily"=>30, "Eddie"=>10}`, while `"Grandpa"=>402` has been destructively removed.

This example demonstrates how Ruby's `keep_if` method uses the return value of the block; specifically, `keep_if` considers the truthiness of the block return value for purposes of destructive selection.

### 4 ###

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.min
```

On line 1, local variable `ages` is initialized to the hash `{ "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }`.

Next, on line 3, the `Hash#values` method is invoked on `ages`. This will return a new array containing only the values from the `ages` hash: `[32, 30, 5843, 10, 22, 237]`. Chained on this returned array is a call to `Array#min`. `min` will return the minimum value from the calling array, in this case `10`.

This example demonstrates Ruby's facility for chaining a succession of method calls on the return values of preceding method calls.

--3:07

### 5 ###

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.index { |name| name[0, 2] == "Be" }
```

On line 1, local variable `flintstones` is initialized to an array of strings.

Next, on line 3, the `Array#index` method is invoked on `flintstones` with a `{...}` block. When called with a block, the `index` method iterates through the collection passing each element in turn to the block to be assigned to the block parameter, here `name`. The `index` method considers the truthiness of the block return value, returning the integer index of the first element whose block iteration returns a truthy value. If `index` finishes iterating without an element's block iteration returning a truthy value, it returns `nil`.

Within the block, the `String#[]` method is called on `name` with `0, 2` passed as arguments. This will return the first two characters of the string currently referenced by `name` as a new string object. This is then tested for equality against the string literal `"Be"`, returning `true` if they are equal, false otherwise. This is the last evaluated expression in the block and so forms the block return value.

This invocation of `index` will therefore return `3` because this is the index of the string `"Betty"` which is the first (and only) element in the collection whose first two characters are `Be`.

This example demonstrates how `Array#index` can be called with a block and how it uses the block return value; specifically, it considers the truthiness of the block return value in order to return the first element that meets the criterion specified in the block's logic.

--9:09

### 6 ###

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name[0,3] }
```

On line 1, local variable `flintstones` is initialized to the array of strings `%w(Fred Barney Wilma Betty BamBam Pebbles)`

Next, on line 3, the destructive `Array#map!` method is invoked on `flintstones` with `{...}` block. The `map!` method iterates through the calling collection passing each element in the calling collection to the block to be assigned to block parameter `name`. The `map!` method uses the return value of the block for purposes of transformation, replacing each element in the caller with the object returned by that element's block iteration (unless of course the object returned by the block is the element itself).

Within the block, the `String#[]` method is called on `name`. The `0, 3` arguments signify that `[]` will return the first three characters in the calling string as a new String object. This is the last evaluated expression in the block and so forms the return value of the block.

This invocation of `map!` will therefore mutate the array referenced by `flintstones` such that its elements are now new string objects containing the first three characters from the previous string elements in `flintstones`: `["Fre", "Bar", "Wil", "Bet", "Bam", "Peb"]`.

This example demonstrates how the destructive `Array#map!` method uses the return value of the block in order to perform transformation.

--9:49

### 7 ###

```ruby
statement = "The Flintstones Rock"

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.count(letter)
  result[letter] = letter_frequency if letter_frequency > 0
end
```

On line 1, local variable `statement` is initialized to the string `"The Flintstones Rock"`. Next, local variable `result` is initialized to an empty hash. Local variable `letters` is initialized to an array constructed by converting two ranges `('A'..'Z')` and `('a'..'z')` into Array objects and concatenating them with the `Array#+` method. This array now contains every capital and lowercase letter as single-character strings.

On line 6, the `Array#each` method is called on `letters` with a `do...end` block. The `each` method iterates over the calling array passing each element in turn to the block. `each` ignores the return value of the block and simply returns a reference to the calling collection.

Within the block, variable `letter_frequency`, local to the inner scope of the block, is initialized to the return value of calling `count` on `statement`, with the single-character string currently referenced by `letter` passed as argument. This call to `count` will return an integer count of the occurrences of the `letter` in `statement`, which is then assigned to `letter_frequency`.

Next, on line 8, an `if` modifier determines whether a new key-value pair will be inserted into the `result` hash. The condition is `letter_frequency > 0`. If `count` found at least one occurrence of `letter` in `statement`, a new key-value pair is created with hash element assignment. The key object is `letter`, with is associated with the value object `letter_frequency` using the `Hash#[]=` method. The value part of the key-value part is the return value of this method and this is the last evaluated expression in the block and so forms its return value. Each ignores this however.

Therefore, after `each` returns, the `result` hash will now contain every uppercase and lowercase letter that occurs at least once in the phrase `"The Flintstones Rock"` as keys, each associated to a value that is the integer representation of the number of times the letter occurs in that phrase.

This example demonstrates how the `each` method can be used to iteratively work on collection objects; it also suggests that local variables initialized in the scope exterior to a block are available for mutation within the inner scope created by a block (though not vice versa).

--15:16

### 8a ###

What happens when we modify an array while we are iterating over it? What would be output by this code?

```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
```

On line 1, local variable `numbers` is initialized to an array of integers: `[1, 2, 3, 4]`.

Next, the `Array#each` method is invoked on `numbers` with a `do...end` block. `each` performs iteration, passing each element in the calling collection in turn to the block and executing the block. `each` ignores the return value of the block, and after iteration has completed, `each` returns a reference to the calling collection.

Within the block, on line 3, `number` is passed to the `Kernel#p` method, which outputs the integer currently referenced by `number` to the screen and returns a reference to `number`. On the next line, the destructive `Array#shift` method is called on the collection we are iterating over, `numbers`, with `1` passed as argument. When an argument is passed to `shift`, the method destructively removes the number of elements from the front of the array specified by the integer argument and returns them in a new Array object. Here, the first element is removed and returned in a new array. This is the last evaluated expression in the block, and so forms the return value, but `each` ignores this.

On ~~the~~ ~~each~~ the first iteration, then, the first element `1` is output to screen. Next, this first element is removed from the array we are iterating over and `numbers` now has the state: `[2, 3, 4]`. ~~More importantly,~~ this changes which elements are at which indexes, and this causes problems for `each` since the iterator method increments a private index counter on each block iteration to access the next element for the next iteration. So after the first iteration, that index will change from `0` to `1`. The problem is, that index `1` now references what was the element at index `2`, since all the elements have been shifted to earlier index positions by the mutating operation of `shift` removing the first element.

So on the second iteration, the block outputs to screen what was the third element but is now the second, `3`. It then destructively removes what is now the first element `2` so the array now looks like `[3, 4]`. After this, the `each` method increments its private index counter to `2`, checks it against the dynamically-updated size of the array and concludes that since index `2` is greater than the last index of `numbers` (which now has a final index of `1`), it is time to stop iterating.

Mutating the array we were iterating over means that the block has only been executed for two, non-consecutive elements, instead of for *each* element, which is what we might assume.

This example demonstrates the problems with mutating the collection over which a method is iterating, specifically mutating operations that change the number of elements in the collection. 

--22:28

### 8b ###

```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
```

On line 1, local variable `numbers` is initialized to the array `[1, 2, 3, 4]`. Next, on line 2, the `Array#each` method is invoked on `numbers` with a `do...end` block. `each` is used for iteration, passing each element from the calling array in turn to the block to be assigned to the block parameter `number`. `each` ignores the return value of the block and returns a reference to the calling collection

Within the block, on line 3, `number` is passed as argument to the `Kernel#p` method. On the first iteration, this will output `1` and return a reference to `number`. On line 4, the destructive `Array#pop` method is called on the collection `each` is iterating over, `numbers`, with `1` passed as argument. This will destructively remove and return in a new array object the last element of the array. The `numbers` array now looks like `[1, 2, 3`].

On the second iteration, the second element of the array, `2` ,is output to the screen and the last element, now `3` is removed from the `numbers` array, which now looks like `[1, 2]`. Since `each` is checking its internal array index counter, which now gets set to `2`, against the dynamically-updated size of the numbers array, whose final index is now `1`, `each` concludes it has  reached the end of the array and stops iterating.

Therefore, this invocation of `each` outputs `1` and then `2` to screen and returns a reference to the now mutated caller whose state is now `[1, 2]`.

This example demonstrates the problems with mutating the collection object over which we are iterating.

--12:17

### 9 ###

```ruby
words = "the flintstones rock"

words.split.map { |word| word.capitalize }.join(' ')
```

On line 1, local variable words is initialized to the string `"the flintstones rock"`.

Next, on line 3, the `split` method is invoked on `words`. Since no argument is passed, `split` will divide the calling string into substrings at whitespace, and returns the substrings in a new array `["the", "flintstones", "rock"]`. Chained on this return value is a call to `map` with a `{...}` block. `Array#map` will iterate through the calling array passing each element in turn to the block to be assigned to the block parameter `word`. `map` uses the return value of the block for purposes of transformation, returning a new array whose elements are the objects returned by each block iteration.

Within the block, the `capitalize` method is called on the string currently referenced by `word`. This will return a new string with the first character, if it is a letter, in uppercase, and all remaining letters in the string in lowercase. This is the last evaluated expression in the block and so forms its return value. This `map` invocation therefore returns a new array whose state is `["The", "Flintstones", "Rock"]`. The method `Array#join` is chained on this return value, with the string `' '` passed as argument. The `join` method will return a new String object whose value is the strings in the calling array joined into one string with the space passed as argument inserted in between them.

Therefore, the final returned object from this chain of method calls is the new String object: `"The Flintstones Rock"`.

This example demonstrates Ruby's facility for chaining method calls onto the return value of preceding method calls.

--9:02

### 10 ###

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end

p munsters
```

On line 1, local variable `munsters` is initialized to a hash whose keys are strings representing names and whose values are hashes representing personal information:

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
```

Next, on line 9, the `Hash#each` method is invoked on `munsters` with a `do...end` block. The `each` method performs iteration, passing each key-value pair in turn from the caller to the block to be assigned to the block parameters, with the string key assigned to `name` and the value part, a nested hash, to `details`. `each` ignores the return value of the block and returns a reference to the caller.

Within the block, on lines 10-17 is a case statement which checks the value of the object currently referenced by `details["age"]`. If the integer referenced by `details["age"]` is within the exclusive range `1...18`, that is, from `1` through `17`, then the code on line 12 is executed. On line 12, the hash element assignment setter method `Hash#[]=` creates a new key-value pair in the hash currently referenced by `details` whose key is `"age_group"` and whose value is `"kid"`.

If `details["age"]` is from `18` through `64`, the code on line 14 is executed and the key `"age_group"` is associated instead with `"adult"`. If `details["age"]` falls outside either of these ranges, the `else` branch is followed and the `"age_group"` key is associated to `"senior"`. This case statement's return value is the last evaluated expression in the block and so forms the block return value, but `each` ignores this.

Therefore, at the end of this `each` invocation, the hash has been updated to:

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => { "age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior"},
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult"}
}
```

--15:34 - Not sure what single concept this is an example of really.

## Looping ##

### 1 ###

```ruby
arr = [1, 2, 3, 4, 5]
counter = 0

loop do
  arr[counter] += 1
  counter += 1
  break if counter == arr.size
end

p arr
```

On line 1, local variable `arr` is initialized to array `[1, 2, 3, 4, 5]`. Next, local variable `counter` is initialized to `0`.

On line 4, the `Kernel#loop` method is called with a `do...end` block. Within the block, on line 5, array element additive assignment syntactic sugar is used to increment the integer at index `counter` of the array currently referenced by `arr`. Next, on line 6, `counter` itself is incremented using the same syntax. On line 7, we `break` from the loop dependent on the `if` modifier condition `counter == arr.size`.

This `loop` invocation therefore performs mutative transformation, incrementing each integer in the `arr` array in-place, such that when `arr` is passed to the `p` method on line 10 it will output to screen `[2, 3, 4, 5, 6]`.

This example demonstrates how transformation can be performed on the elements of an array without Ruby's `map!` method  by using a simple loop and index counter.

--6:48

### 2 ###

```ruby
loop do
  number = rand(1..10)
  puts 'Hello!'
  if number == 5
    puts 'Exiting...'
    break
  end
end
```

On line 1, the `Kernel#loop` method is called with a `do...end` block. The `loop` performs iteration using a block; the method will continue to execute the block until a control keyword such as `break` exits iteration.

Within the block, on line 2, variable `number`, local to the inner scope of the block, is initialized to the return value of calling the `Kernel#rand` method with the range `1..10` passed as argument. This returns a psuedorandom integer within the range of the Range argument, so from `1` through `10`.

Next, on line 3, the `Kernel#puts` method is invoked with the string `"Hello!"` passed as argument. This outputs `Hello!` to screen and returns `nil`.

On line 4, an `if` statement checks if `number` is equal to `5`. If so, `puts` is called with the argument `"Exiting..."` and then, on line 6, the `break` statement breaks from iteration.

This `loop` invocation therefore continues to print `Hello` to the screen until the initial call to `rand` returns the integer `5`, on which iteration it will also print `Exiting...` and cease iteration.

--9:05

### 3 ###

```ruby
counter = 0

loop do
  counter += 1
  next if counter.odd?
  puts counter
  break if counter > 5
end
```

On line 1, local variable `counter` is initialized to the integer `0`.

Next, on line 3, the `Kernel#loop` method is invoked with a `do...end` block. The `loop` method performs iteration with a block, executing the block until a control statement such as `break` is used to cease iteration.

Within the block, on line 4, `counter` is incremented with `+=` syntactic sugar. On line 5, an `if` modifier checks whether the return value of calling `Integer#odd?` on `counter` evaluates as true. If so, the `next` keyword skips the rest of the block and begins iteration again. If `counter` references an even integer, `odd?` will return `false` and control passes to line 6, where the `Kernel#puts` method is invoked with `counter` passed as argument.

On line 7, the final line of the block, an `if` modifier checks whether `counter` is greater than `5`. If so, the `break` keyword quits iteration.

On the first iteration, `counter` is immediately set to `1`. Since this is an odd number, `odd?` will return `true` and the next iteration begins. On this second iteration, `counter` is set to `2` and so the `next` statement is not executed. `2` is output to screen and since `2` is less than `5`, iteration continues. On the next iteration, `counter` is set to `3` and since this is an odd number it will not be printed. On the next iteration `4` is printed. On the next, `5` is not printed. On the final iteration, `6` is printed and then we `break` from iteration, since `6` is greater than `5`.

This example demonstrates using the `loop` method with a block and a counter to perform iteration.

--8:45

### 4 ###

```ruby
alphabet = 'abcdefghijklmnopqrstuvwxyz'
counter = 0

loop do
  break if counter == alphabet.size
  puts alphabet[counter]
  counter += 1
end
```

On line 1, local variable `alphabet` is initialized to the string `'abcdefghijklmnopqrstuvwxyz'`. Next, local variable `counter` is initialized to integer `0`.

On line 4, the `Kernel#loop` method is invoked with a `do...end` block. `loop` performs iteration using a block; `loop` will continue to execute the block until a control statement such as `break` is used to exit iteration.

Within the block, on line 5, an `if` modifier checks whether the integer currently referenced by `counter` is equal to the return value of calling `size` on `alphabet`. If so, the `break` statement is executed and iteration ends, otherwise control passes to the next line of the block.

On line 6, the `String#[]` method is called on `alphabet` with `counter` passed as argument. This will return a new single-character string whose value is the character at index `counter` of the `alphabet` string. This return value is passed to the `Kernel#puts` method, which will output it to screen and return `nil`.

On line 7, `counter` is incremented using `+=` syntactic sugar.

This `loop` invocation will therefore print every character in the `alphabet` string on a new line before ceasing to iterate.

This example demonstrates using the `loop` method with block and a counter variable to perform iteration.

--7:49



### 5 ###

```ruby
colors = ['green', 'blue', 'purple', 'orange']
counter = 0

loop do
  break if counter == colors.size
  puts "I'm the color #{colors[counter]}!"
  counter += 1
end
```

On line 1, local variable `colors` is initialized to the array `['green', 'blue', 'purple', 'orange']`. On line 2, local variable `counter` is initialized to `0`.

Next, on line 4, the `Kernel#loop` method is invoked with a `do...end` block. The `loop` method uses the block to perform iteration, executing the block indefinitely until a control expression such as `break` is used to cease iteration.

Within the block, on line 5, there is a break condition; an `if` modifier checks if `counter` is equal to the return value of calling `Array#size` on the `colors` array; once this condition is reached, the `break` keyword is executed and iteration will stop. If the condition evaluates as false, control passes instead to the next line.

On line 6, the `Kernel#puts` method is invoked with a string involving string interpolation passed as argument: `"I'm the color #{colors[counter]}!"`. The code being interpolated calls the array element reference method `Array#[]` to return the element at index `counter`, which is interpolated into the string before it is output to the screen.

On line 7, the `counter` integer is incremented using `+=` syntactic sugar.

This `loop` invocation will therefore output to screen:

```
I'm the color green
I'm the color blue
I'm the color purple
I'm the color orange
```

and then cease iteration.

This example demonstrates using `loop` and a counter variable to iterate over a collection, in the same fashion as Ruby's `each` iterator method.

--8:22

### 6 ###

```ruby
objects = ['hello', :key, 10, []]
counter = 0

loop do
  break if counter == objects.size
  puts objects[counter].class
  counter += 1
end
```

On line 1, local variable `objects` is initialized to the array `['hello', :key, 10, []]`. Next, local variable `counter` is initialized to `0`.

Then, on line 4, the `loop` method is invoked with a `do...end` block. `loop` performs iteration, executing the block repeatedly until a control expression such as `break` is used to cease iteration. `loop` ignores the return value of the block.

On line 5, an `if` modifier checks whether the integer referenced by `counter` is equal to the return value of calling the `Array#size` method on the `objects` array. `size` returns the number of elements in the array. If this condition evaluates as true, the `break` keyword is executed, otherwise control passes to the next line.

On line 6, array element reference method `Array#[]` is called on `objects` with `counter` passed as argument, which returns the element at index `counter` of the `objects` array. Chained on this return value is the `class` method, which returns the class of the caller. This is then passed as argument to the `Kernel#puts` method which outputs a string representation of the class name to screen. On line 7, `counter` is incremented using `+=` syntactic sugar. 

This `loop` invocation will therefore output to screen

```
String
Symbol
Integer
Array
```

and then cease iteration.

This example demonstrates the use of the `loop` method and a counter variable to iterate over a collection in the same manner as Ruby's `each` method.

--9:16

### 7 ###

```ruby
number_of_pets = {
  'dogs' => 2,
  'cats' => 4,
  'fish' => 1
}
pets = number_of_pets.keys # => ['dogs', 'cats', 'fish']
counter = 0

loop do
  break if counter == number_of_pets.size
  current_pet = pets[counter]
  current_pet_number = number_of_pets[current_pet]
  puts "I have #{current_pet_number} #{current_pet}!"
  counter += 1
end
```

On line 1, local variable `number_of_pets` is initialized to the hash `{ 'dogs' => 2,  'cats' => 4,  'fish' => 1 }`.

Next, on line 7, local variable `pets` is initialized to the return value of calling `Hash#keys` on `number_of_pets`. This method returns a new array containing only the key objects from the hash in insertion order, `["dogs", "cats", "fish"]`; this array is assigned to `pets`.

On line 7, local variable `counter` is initialized to `0`.

Next, on line 9, the `Kernel#loop` method is invoked with a `do...end` block. `loop` performs iterations, repeatedly executing the block until a control expression like `break` is used to cease iteration.

Within the block, on line 10, an `if` modifier checks whether the integer currently referenced by `counter` is equal to the return value of calling `Hash#size` on `number_of_pets`; this will be an integer representing the number of key-value pairs in the hash. If this evaluates as true, the `break` keyword is executed and we break from the loop.

On line 11, variable `current_pet`, local to the inner scope of the block, is initialized to the return value of calling the array element reference method `Array#[]` on the `pets` array with `counter` passed as argument. This returns the element at index `counter`, which is then assigned to `current_pet`.

On line 12, local variable `current_pet_number` is initialized to the result of calling hash element reference method `Hash#[]` on the `number_of_pets` hash, with the string currently referenced by `current_pet` passed as the key argument. This will return the associated value object, an integer, which is assigned to `current_pet_number`.

Next, on line 13, a string involving string interpolation is passed to an invocation of the `Kernel#puts` method: `"I have #{current_pet_number} #{current_pet}"`. String representations of the objects referenced by those variables are interpolated into the string and it is output to screen, before `puts` returns `nil` as it always does.

On the last line of the block, `counter` is incremented with `+=` syntactic sugar.

This `loop` invocation will therefore output to screen

```
I have 2 dogs
I have 4 cats
I have 1 fish
```

before ceasing iteration and returning `nil` (since no expression was passed to the `break` keyword).

This example demonstrates using `loop` with a block and a counter variable in order to iterate over a hash in much the same way as Ruby's `Hash#each` method.

--13:53



## Selection and Transformation

### 1 ###

```ruby
alphabet = 'abcdefghijklmnopqrstuvwxyz'
selected_chars = ''
counter = 0

loop do
  current_char = alphabet[counter]

  if current_char == 'g'
    selected_chars << current_char
  end

  counter += 1
  break if counter == alphabet.size
end

p selected_chars 
```

On line 1, local variable `alphabet` is initialized to the string `'abcdefghijklmnopqrstuvwxyz'`. Next, local variable `selected_chars` is initialized to an empty string, and local variable `counter` is initialized to `0`.

After this, on line 5, the `Kernel#loop` method is invoked with a `do...end` block. The `loop` method performs iteration, repeatedly executing the block until a control expression such as `break` causes iteration to stop.

Within the block, local variable `current_char` is initialized to the return value of calling the `String#[]` method on `alphabet` with `counter` passed as argument.  This will return a new string containing the letter at index `counter` of the calling string `alphabet`, which is then assigned  to `current_char`. On line 8, an `if` statement checks whether `current_char` is equal to `g`; if so, `current_char` is destructively appended to `selected_chars` using the mutating `String#<<` method.

On line 12,  `counter` is incremented by `1` with `+=` syntactic sugar. And on line 13, an `if` modifier checks if `counter` is equal to the return value of calling `size` on `alphabet`, which returns the number of characters in the string as an integer; if so, the `break` keyword is executed and we break from the loop. So after iterating through every character in the string, we will break out of iteration.

This `loop` invocation therefore iterates through each character in `alphabet` by way of an index counter and any of them are `g` then a `g` is appended to the `selected_chars` array. So this is an implementation of a selection operation.

When, on line 16, `selected_chars` is passed to the `Kernel#p` method, the output will be `g`, since `g` appears one time in the `alphabet` string.

This example demonstrates an implementation of a selection operation on a String object using the `loop` method, an `if` condition for the selection criterion, a conditional `break` control expression, and an index counter variable.

--13:22

### 2 ###

```ruby
fruits = ['apple', 'banana', 'pear']
transformed_elements = []
counter = 0

loop do
  current_element = fruits[counter]

  transformed_elements << (current_element + 's')

  counter += 1
  break if counter == fruits.size
end

p transformed_elements
```

On line 1, local variable `fruits` is initialized to the array of strings `['apple', 'banana', 'pear']`. After this, local variable `transformed_elements` is initialized to an empty array, and variable `counter` is initialized to `0`.

Next, we invoke the `Kernel#loop` method with a `do...end` block. The `loop` method performs iteration, repeatedly executing the block until a control expression such as `break` causes iteration to stop.

Within the block, on line 6, local variable `current_element` is initialized to the return value of calling the `Array#[]` element reference method on `fruits` with `counter` passed as argument. This returns the element in `fruits` at index `counter`, which is assigned to `current_element`.

Next, on line 8, the `String#+` is used to concatenate the argument `'s'` to the end of `current_element`; the new, concatenated string returned by this method is then destructively appended to the `transformed_elements` array with the mutating `Array#<<` method.

On line 10, `counter` is incremented by `1` with `+=` syntactic sugar, and then on line 11 is a break condition. The `if` modifier checks whether `counter` is equal to the size of the the `fruits` array; if so, the `break` keyword is executed and we break from the loop.

This `loop` invocation therefore performs a transformation operation on the elements of a collection using the transformation criterion on line 8. The transformed elements are placed in the `transformed_elements` array, and when this is passed to the `Kernel#p` method on line 14, the output will be `["apples", "bananas", "pears"].

This example demonstrates an implementation of array element transformation similar to Ruby's `map` method, using instead a simple `loop`, a break condition, a counter variable, and a transformation criterion.

--10:29



### 3 ###

```ruby
def select_vowels(str)
  selected_chars = ''
  counter = 0

  loop do
    current_char = str[counter]

    if 'aeiouAEIOU'.include?(current_char)
      selected_chars << current_char
    end

    counter += 1
    break if counter == str.size
  end

  selected_chars
end

p select_vowels('the quick brown fox')
```

On lines 1-17, the `select_vowels` method is defined using the `def` keyword with one paramter `str`. Within the method definition body, on line 2, local variable `selected_chars` is initialized to an empty string. After this, local variable `counter` is initialized to `0`.

Next, on line 5, we invoke the `Kernel#loop` method with a `do...end` block. The `loop` method performs iteration, repeatedly executing the block until a control expression within the block such as `break` causes iteration to stop.

Within the block, local variable current_char is initialized to the return value of calling `String#[]` on `str` with `counter` passed as argument. This will return a new String object containing the character in `str` at index `counter`.

On line 8, an `if` condition checks whether `current_char` is a vowel, by calling `String#include?` on a string containing only every upper- and lowercase vowel, with `current_char` passed as argument. If this predicate method returns `true`, then line 9 is executed, destructively appending `current_char` to the `selected_chars` string using the mutating `String#<<` method.

On line 12, the `counter` is incremented by `1` using `+=` syntactic sugar. Then comes the break condition on line 13, where an `if` modifier checks whether `counter` is equal to the size in characters of `str`. If so, the `break` keyword exits the loop.

The last evaluated expression in the method definition, `selected_chars` on line 16, forms the implicit return value of the method.

Therefore, the `select_vowels` method performs a selection operation on the string passed as argument, using a simple loop, counter, break condition and selection criterion.

The invocation of `select_vowels` on line 19, with `'the quick brown fox'` passed as argument will return a string containing selected characters from the argument, which is passed to the `Kernel#p` method; the output will be `euioo`.

This example demonstrates an implementation of a selection operation on a string using a simple loop rather than an iterator method, such as `String#each_char`.

--13:01

### 4 ###

```ruby
def select_fruit(produce_list)
  produce_keys = produce_list.keys
  counter = 0
  selected_fruits = {}

  loop do
    # this has to be at the top in case produce_list is empty hash
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce)
```

On the first line below the method definition, line 23, local variable `produce` is initialized to hash `{'apple' => 'Fruit', 'carrot' => 'Vegetable', 'pear' => 'Fruit', 'broccoli' => 'Vegetable'}`. Next, on line 30, the `select_fruit` method is invoked with `produce` passed as argument.

The `select_fruit` method is defined on lines 1-21 with one parameter `produce_list`. Within the body of the definition, local variable `produce_keys` is initialized to the return value of calling the `Hash#keys` method on `produce_list`; the `keys` method returns a new array object containing only the key objects from the calling hash in insertion order. Next, on line 3, local variable `counter` is initialized to `0`. On line 4, local variable `selected_fruits` is initialized to an empty hash.

Following these initializations, on line 6, the `Kernel#loop` method is invoked with a `do...end` block. `loop` performs iteration, repeatedly executing the block until a control expression such as `break` causes iteration to stop.

Within the block, on line 8, the `break` condition is the first statement, an `if` modifier checking whether `counter` is equal to the return value of calling `Array#size` on `produce_keys`; if so, the `break` keyword is executed and we break from the loop.

On line 10,  local variable `current_key` is initialized to the return value of calling array element reference method `Array#[]` on the `produce_keys` array with `counter` passed as argument; this returns the element from `produce_keys` at index `counter`.

On the next line, local variable `current_value` is initialized to the return value of calling `Hash#[]` with `current_key` passed as argument; this method returns the value object associated to the key referenced by `current_key`, which is assigned to `current_value`.

Next, on line 13, and `if` condition checks whether `current_value` is equal to the string `'Fruit'`; if so, a new key value pair is created in the `selected_fruits` hash using the `Hash#[]=` element assignment method with `current_key` as the key part and `current_value` as the value part. This operation effectively copies the current key-value pair from `produce_list` to `selected_fruits` based on the selection criterion represented by the `if` condition.

On line 17, the last line in the `loop` block, `counter` is incremented by `1` using `+=` syntactic sugar.

After the `loop` invocation, the last evaluated expression in the `select_fruit` method definition is `selected_fruits` on line 20, which thus forms the implicit return value of the method.

Therefore the `select_fruits` method performs a selection operation on the hash passed as argument, using a simple loop, counter, selection criterion and break condition. When the return value of this invocation is passed to `Kernel#p` on line 30, the output will be: `{ "apple"=>"Fruit", "pear"=>"Fruit"}.

--18:14

### 5 ###

```ruby
def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers(my_numbers)
```

On line 17, the first line after the method definition, local variable `my_numbers` is initialized to the array `[1, 4, 3, 7, 2, 6]`. Next, the `double_numbers` method is invoked with `my_numbers` passed as argument.

The `double_numbers` method is defined on lines 1-15 with one parameter, `numbers`, which on this invocation is assigned to the array referenced by `my_numbers`. Within the body of the definition, on line 2, local variable `doubled_numbers` is initialized to an empty array. After this, local variable `counter` is initialized to `0`.

After this, on line 5, the `Kernel#loop` method is invoked with a `do...end` block. The first line within the block is a break condition; an `if` modifier checks whether `counter` is equal to the return value of calling `Array#size` on `numbers`; if so, the `break` keyword is executed and we break from the loop.

Next, on line 8, local variable `current_number` is initialized to the return value of calling array element reference method `Array#[]` on `numbers` with `counter` passed as argument; this returns the element in `numbers` at index `counter`. On line 9, the return value of the expression `current_number * 2` is destructively appended to the `doubled_numbers` array with the mutating `Array#<<` method. On the last line of the block, line 14, `counter` is incremented by `1` using `+=` syntactic sugar.

The last evaluated expression on line 14, which forms the return value of the `double_numbers` method, is `doubled_numbers`.

The `double_numbers` method therefore performs transformation on the elements in the argument array, returning a new  array containing the results of the transformation criterion `current_number * 2`. The return value of this invocation of `double_numbers` will be `[2, 8, 6, 14, 4, 12]`

This example demonstrates an implementation of a transformation operation on an array similar to Ruby's `map` method using a simple loop, counter, transformation criterion and break condition.

--10:58



### 6 ###

```ruby
def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] = current_number * 2

    counter += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers!(my_numbers)

p my_numbers          
```

On line 16, the first line after the `double_numbers!` method definition, local variable `my_numbers` is initialized to array `[1, 4, 3, 7, 2, 6]`. Next, the `double_numbers!` method is invoked with `my_numbers` passed as argument.

The `double_numbers!` method is defined using the `def` keyword over lines 1-14 with one parameter `numbers`, which on this invocation is assigned to the array referenced by `my_numbers`. Within the body of the definition, local variable `counter` is initialized to `0`.

Next, the `Kernel#loop` method is invoked with a `do...end` block. The `loop` method performs iteration, repeatedly executing the block until a control expression such as `break` causes iteration to cease.

Within the block, on line 5, the first line is a break condition. An `if` modifier tests whether `counter` is equal to the return value of calling `Array#size` on `numbers`; if so, the `break` keyword breaks from the loop.

On line 7, local variable `current_number` is initialized to the return value of calling array element reference method `Array#[]` on the `numbers` array, which returns the element at index `counter`.

After this, on line 8, array element assignment method `Array#[]=` is called on `numbers` with the expression `current_number * 2` passed as argument. This reassigns index `counter` of the `numbers` array to the integer twice as great as the previous integer at that index, mutating the array object referenced by `numbers` and in the `main` scope by `my_numbers`. 

The last line in the block increments `counter` by `1` using `+=` syntactic sugar.

On line 13, the final line of the method definition, the expression `numbers` forms the implicit return value of the `double_numbers!` method.

On line 19, `my_numbers` is passed to the `Kernel#p` method and the output will reflect the mutation performed by the `double_numbers!` method: `[2, 8, 6, 7, 4, 6]`

This example demonstrates an implementation of a destructive transformation operation on an array using a simple loop, counter, break condition and transformation criterion.

--12:15

### 7 ###

```ruby
def general_select(produce_list, selection_criteria)
  produce_keys = produce_list.keys
  counter = 0
  selected_produce = {}

  loop do
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    # used to be current_value == 'Fruit'
    if current_value == selection_criteria
      selected_produce[current_key] = current_value
    end

    counter += 1
  end

  selected_produce
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

general_select(produce, 'Fruit')
```

On line 23, the first line after the method definition, local variable `produce` is initialized to the hash ` {'apple' => 'Fruit', 'carrot' => 'Vegetable', 'pear' => 'Fruit', 'broccoli' => 'Vegetable'}`. Next, the `general_select` method is invoked with `produce` and string literal `"Fruit"` passed as arguments.

The `general_select` method is defined with the `def` keyword on lines 1-21 with two parameters `produce_list`, which on this invocation is assigned to the same Hash object referenced by `produce`, and `selection_criteria`, which is assigned to the string `"Fruit"`.

Within the definition body, local variable `produce_keys` is initialized to the return value of invoking `Hash#keys` on `produce_list`; this method returns a new array containing only the key objects from the hash. Next, on line 3, local variable `counter` is initialized to `0`. Then local variable `selected_produce` is initialized to an empty hash.

On line 6, the `Kernel#loop` method is invoked with a `do...end` block. The `loop` method performs iteration, repeatedly executing the block until a control expression within the block such as `break` terminates iteration.

Within the block, the first line is the break condition; an `if` modifier checks whether `counter` is equal to the return value of calling `Array#size` on `produce_keys`; if so, the `break` keyword is executed and we break from the loop.

Next, on  line 9, local variable `current_key` is initialized to the return value of calling array element reference method `Array#[]` on `produce_keys` with `counter` passed as argument; this returns the element in `produce_keys` at index `counter`. Then local variable `current_value` is initialized to the return value of calling hash element reference method `Hash#[]` on `produce_list` with the key `current_key` passed as argument; this returns the value object from the hash associated to the key object referenced by `current_key`.

Next, on line 13, an `if` condition checks whether `current_value` is equal to `selection_criteria`; if so, a new key-value pair is created in the `selected_produce` hash with `current_key` as the key and `current_value` as the value, using hash element assignment method `Hash#[]=`.

The last line of the block increments `counter` by `1` with `+=` syntactic sugar.

After the block, on line 20, the expression `selected_produce` forms the implicit return value, since this is the last evaluated expression in the method definition.

Therefore this invocation of `general_select` will return a new hash object whose state is: `{"apple"=>"Fruit", "pear"=>"Fruit"}`.

This example demonstrates the implementation of a selection operation on a hash using a user-defined method, a simple loop, counter, break condition and a variable selection criterion.

--13:57

### 8 ###

```ruby
def select_letter(sentence, character)
  selected_chars = ''
  counter = 0

  loop do
    break if counter == sentence.size
    current_char = sentence[counter]

    if current_char == character
      selected_chars << current_char
    end

    counter += 1
  end

  selected_chars
end

question = 'How many times does a particular character appear in this sentence?'

select_letter(question, 'a') # => "aaaaaaaa"
```

On line 19, the first line after the method definition, local variable `question` is initialized to the string `'How many times does a particular character appear in this sentence?'`.

Next, on line 21, the `select_letter` method is invoked with `question` and string literal `'a'` passed as arguments.

The `select_letter` method is defined with the `def` keyword on lines 1-17, with two parameters: `sentence`, assigned on this invocation to the same string object referenced by `question`, and `character`, which on this invocation is assigned to `"a"`.

Within the method definition body, on line 2, local variable `selected_chars` is initialized to an empty string. Next, local variable `counter` is initialized to `0`.

On line 5, the `Kernel#loop` method is invoked with a `do...end` block. The `loop` method performs iteration by repeatedly executing the block until a control expression within the block such as `break` causes iteration to terminate.

Within the block, the first line is a break condition; an `if` modifier checks whether `counter` is equal to the return value of calling `String#size` on `sentence`; if this evaluates as true, the `break` keyword breaks from the loop.

Next, on line 7, local variable `current_char` is initialized to the return value of calling  the `String#[]` method on `sentence` with `counter` passed as argument; this returns a new string containing the character at index `counter` in `sentence`.

After this, on line 9, an `if` condition checks whether `current_char` is equal to `character`; if so, line 10 is executed and `current_char` is destructively appended to the `selected_chars` string with the `String#<<` method.

The last line of the block, line 13, increments `counter` by `1` using `+=` syntactic sugar.

The last line of the method definition is the expression `selected_chars` which thus forms the implicit return value of `select_letter`.

This method therefore performs a non-destructive selection operation on the string object passed as the first argument, using the second argument as a selection criterion. The return value for this invocation would be the new string `"aaaaaaaa"`.

This example demonstrates an implementation of a non-mutating selection operation on a string, using a simple loop, counter variable, break condition and selection criterion.

--11:30

### 9 ###

```ruby
alphabet = 'abcdefghijklmnopqrstuvwxyz'

for char in alphabet.chars
  puts char
end
```

On line 1, local variable `alphabet` is initialized to string `'abcdefghijklmnopqrstuvwxyz'`.

Next, on line 3, we enter a `for` loop that iterates through each element in the return value of calling `String#chars` on `alphabet`; this returns a new array of new single-character strings representing each character in turn from the calling string, `alphabet`. The `for` loop iterates through this array assigning each element in turn to the variable initialized in the loop expression, `char`, and executing the code in the body of the loop once for each value assigned to `char`.

Within the body of the loop, the only expression is a call to `Kernel#puts` with `char` passed as argument. This will output the string currently referenced by `char` and return `nil`, since `puts` always returns `nil`.

The output from this loop will therefore be

```
a
b
c
d
e
f
g
h
i
j
k
l
m
n
o
p
q
r
s
t
u
v
w
x
y
z
```

This example demonstrates iteration over a collection using a Ruby's language-feature `for` loop, as opposed to the more idiomatic iterator methods such as `each`.

--6:27

