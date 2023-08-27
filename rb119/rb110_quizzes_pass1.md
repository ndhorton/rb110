# RB110 Quizzes #

## Lesson 1 ##

### 1 ###

```ruby
numbers = ['2', '3', '5', '7', '8', '11', '13', '15', '18']
odd_numbers = []

for number in numbers
  if number.to_i.odd?
    odd_numbers.push(number)
  end
end

p odd_numbers
```

On line 1, local variable `numbers` is initialized to the array `['2', '3', '5', '7', '8', '11', '13', '15', '18']`. Next, local variable `odd_numbers` is initialized to an empty array.

On line 4, a `for` loop begins, initializing local variable `number` and iterating through the `numbers` array, assigning each element in turn to `number`. Within the loop, on line 5, the `String#to_i` method is called on `number`, returning an Integer object representation of the decimal string. Chained on this return value is a call to `Integer#odd?`, which returns Boolean `true` if the integer is odd, `false` otherwise. This return value forms the condition of an `if` expression. If the return value from `odd?` is `true`, line 6 is executed.

On line 6, the `Array#push` method is called on `odd_numbers` with `number` passed as argument. This destructively appends the decimal string referenced by `number` to the `odd_numbers` array.

After the `for` loop has ceased iteration, the `odd_numbers` array will contain all the string representations of odd numbers from the `numbers` array. So when, on line 10, `odd_numbers` is passed as argument to the `Kernel#p` method, the output to screen will be `['3', '5', '7', '11', '13', '15']`

This example demonstrates using a `for` loop to perform a selection operation on an array.

--9:13

### 2 ###

```ruby
numbers = ['2', '3', '5', '7', '8', '11', '13', '15', '18']
odd_numbers = []
counter = 0

loop do
  number = numbers[counter].to_i

  odd_numbers << numbers[counter] unless number.even?

  counter += 1
  break if counter == numbers.size
end

p odd_numbers
```

On line 1, local variable `numbers` is initialized to the array `['2', '3', '5', '7', '8', '11', '13', '15', '18']`. Next, local variable `odd_numbers` is initialized to an empty array.  Local variable `counter` is initialized to `0`.

On line 5, the `Kernel#loop` method is called with a `do...end` block. The `loop` method performs iteration, executing the block repeatedly until a control expression breaks out of the loop.

Within the block, on line 6, local variable `number` is initialized to the return value of a chain of method calls. First, the `Array#[]` element reference method is called on `numbers` with `counter` passed as argument; this returns the element in the `numbers` array at index `counter`. Chained on this return value is a call to `String#to_i` which returns an Integer object representation of the digit String. This Integer object is assigned to `number`.

Next, on line 8, an `unless` modifier uses for its condition the return value of calling `Integer#even?` on `number`. If the integer currently referenced by `number` is even, the return value will be `true` and the `unless` modifier does not execute the preceding code on the line. If `number` is odd, the return value will be `false` and the preceding code on line 8 executes. The `Array#[]` method is called on numbers with `counter` passed as argument and the returned String object is destructively appended to the `odd_numbers` array by the `Array#<<` method.

On line 9, the `counter` variable is incremented with `+=` syntactic sugar. Then, on line 11, a `break` condition checks whether `counter` is equal to the return value of calling `Array#size` on `numbers`, breaking from the loop if so.

This `loop` invocation therefore appends every String representation of an odd number from the `numbers` array to the `odd_numbers` array. When `odd_numbers` is passed to the `Kernel#p` method on line 14, the output to the screen will be `['3', '5', '7','11', '13', '15']`

This example demonstrates using a simple `loop`, counter, conditional selection criterion and break condition to perform selection on an array.

--12:48

### 3 ###

```ruby
numbers = ['2', '3', '5', '7', '8', '11', '13', '15', '18']
odd_numbers = []

numbers.each do |number|
  odd_numbers << number if number.to_i.odd?
end

p odd_numbers
```

On line 1, local variable `numbers` is initialized to the array `['2', '3', '5', '7', '8', '11', '13', '15', '18']`. Next, local variable `odd_numbers` is initialized to an empty array.

On line 4, the `Array#each` method is called on `numbers` with ` do...end` block. `each` performs iteration, passing each element in turn to the block to be assigned to the block parameter `number` and executing the block. `each` ignores the block return value and returns a reference to the caller.

Within the block, on line 5, the `String#to_i` method is called on `number`, returning an Integer representation of the digit String. Chained on this integer return value is a call to `Integer#odd?`, which returns `true` if the caller is odd, `false` otherwise. This Boolean return value forms the condition of an `if ` modifier. If `odd?` returns `true`, the preceding code on the line is executed. This consists of an invocation of `Array#<<` on `odd_numbers` with `number` passed as argument. So if the `if` modifiers condition evaluates as true, the string referenced by `number` is destructively appended to the `odd_numbers` array.

After `each` returns, therefore, the `odd_numbers` array will contain the string representations of only the odd numbers in the numbers array. So when `odd_numbers` is passed to the `Kernel#p` method on line 8, the output will be `['3', '5', '7','11', '13', '15']`

This example demonstrates the use of the `each` iterator method to perform a selection operation on an array.

--7:28

### 4 ###

```ruby
hsh = {a: 'apple', b: 'pear', c: 'orange', d: 'kiwi', e: 'banana'}
counter = 0

new_hsh = {}

for letter, fruit in hsh
  new_hsh[letter] = fruit if fruit.size > 4
end

p new_hsh
```

On line 1, local variable `hsh` is initialized to the hash `{a: 'apple', b: 'pear', c: 'orange', d: 'kiwi', e: 'banana'}`. Next, local variable `counter` is initialized to `0`. Then local variable `new_hsh` is initialized to an empty hash.

On line 6, a `for` loop begins iterating through the key-value pairs in `hsh`, assigning each key object in turn to local variable `letter` and each value object to local variable `fruit`.

Within the loop, on line 7, the `String#size` method is called on `fruit` and a comparison method `Integer#>` is called on this return value with `4` passed as argument. This expression returns `true` if the number of characters in `fruit` is greater than `4`, `false` otherwise. This Boolean return value is used as the condition for an `if` modifier. If the comparison returns `true`, the code preceding the modifier is executed. This is a call to the hash element assignment method `Hash#[]=` with `letter` and `fruit` passed as arguments, mutating the `new_hsh` hash by initializing a new key-value pair with `letter` as the key and `fruit` as the value.

After this `for` loop executes, the `new_hsh` hash will contain each key-value pair from `hsh` where the value part, a string, contains more than four characters.

Thus when `new_hsh` is passed to the `Kernel#p` method on line 10, the output will be `{:a=>"apple", :c=>"orange", :e=>"banana"}`.

This example demonstrates using a `for` loop to perform selection on a hash.

--10:05



### 5 ###

```ruby
def some_method(words)
  arr = []
  counter = 0

  loop do
    word = words[counter]
    arr << word if word.size < 4

    counter += 1
    break if counter == words.size
  end

  arr
end

poem = %w(April is the cruelest month)
p some_method(poem)
```

On line 16, the first line after the method definition, local variable `poem` is initialized to the array of strings `%w(April is the cruelest month)`.

Next, the `some_method` method is called with `poem` passed as argument.

The `some_method` method is defined over lines 1-14 with the `def` keyword and one parameter `words` which on this invocation is assigned to the same Array object referenced by `poem`.

Within the method definition body, on line 2, local variable `arr` is initialized to an empty array. Next, local variable `counter` is initialized to the integer `0`.

On line 5, the `Kernel#loop` method is called with a `do...end` block. `loop` performs iteration, executing the block repeatedly until a control expression in the block breaks out of the loop.

Within the block, on line 6, local variable `word` is initialized to the return value of calling element reference method `Array#[]` on `words` with `counter` passed as argument, which returns the string element at index `counter`.

Next, on line 7, an `if` modifier checks whether the integer return value of calling the `String#size` method on `word` is less than `4`. If so, the code preceding the modifier is executed. Here, the `Array#<<` method is called on `arr` with `word` passed as argument, which destructively appends the string referenced by `word` to the `arr` array.

On line 9, `counter` is incremented with `+=` syntactic sugar. Then, on line 10, a `break` condition checks whether `counter` is equal to the return value of calling `Array#size` on `words`, breaking from the loop if so.

After the loop has finished executing, `arr` will therefore contain each string from the `words` array that has less than `4` characters. On line 13, `arr` is expressed as the implicit return value of `some_method`.

So on line 17, the array that is returned by `some_method` and passed as argument to the `Kernel#puts` method to be output to screen is `["is", "the"]`

This example demonstrates a method that uses a simple `loop`, counter, conditional selection criterion, and break condition to perform selection on an array.

--11:32

### 6 ###

```ruby
def star_method(stars)
  arr = []
  stars.each do |star|
    arr.push(star.upcase)
  end
  arr
end

stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
p star_method(stars_1)
```

On line 9, the first line after the method definition, local variable `stars_1` is initialized to the array `['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']`. Next, the `star_method` is invoked with `stars_1` passed as argument.

The `star_method` method is defined over lines 1-7 with the `def` keywords and one parameter, `stars`, which on this invocation is assigned to the same array referenced by `stars_1`.

Within the body of the definition, local variable `arr` is initialized to an empty array. On line 3, the `Array#each` method is invoked on `stars` with a `do...end` block. The `each` method performs iteration, passing each element in turn to the block parameter `star` and executing the block. `each` ignores the return value of the block and returns a reference to the caller.

Within the block, on line 4, the `Array#push` method is called on `arr`; the argument is the return value of calling `String#upcase` on the string currently referenced by `star`, which returns a new string with all letters from the caller in uppercase. The `push` method destructively appends this new string to the `arr` array.

This `each` invocation therefore appends to `arr` uppercase versions of all the string elements from the `stars` array.

Finally, on line 6, `arr` is expressed as the implicit return value of the `star_method` method.

Therefore, on line 10, when the return value of `star_method` is passed to `Kernel#p` as argument, the output to the screen will be `["SIRIUS", "RIGEL", "VEGA", "POLARIS", "ALTAIR"]`.

This example demonstrates using the iterative method `each` with a block, with a variable initialized to a matching empty collection outside of the block in order to remain in scope once the `each` method returns, to perform a transformation operation on an array.

--10:00



### 7 ###

```ruby
def star_method(stars)
  arr = []
  counter = 0

  until counter == stars.size do
    arr << stars[counter][0, 3]

    counter += 1
  end
  arr
end

stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
p star_method(stars_1)
```

On line 13, the first line after the method definition, local variable `stars_1` is initialized to the array `['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']`. Next, on line 14, the return value of calling the `star_method` with `stars_1` passed as argument is passed to the `Kernel#p` method.

The `star_method` is defined over lines 1-11 with the `def` keyword and has one parameter, `stars` which on this invocation is assigned to the same array referenced by `stars_1`.

Within the body of the definition, on line 2, local variable `arr` is initialized to an empty array. Next, local variable `counter` is initialized to the integer `0`.

On line 5, an `until` loop iterates until `counter` is equal to the size of the `stars` array. Within the loop, on line 6, the `Array#[]` element reference method is invoked on `stars` with `counter` passed as argument, returning the string element at index `counter`. Chained on this return value is a call to the `String[]` method with two arguments, `0` and `3`. This returns a new string containing `3` characters from the string starting at index `0`. This return value is passed as argument to an invocation of `Array#<<` on `arr`, destructively appending the string to the `arr` array.

On line 8, `counter` is incremented by `1` using `+=` syntactic sugar. After the loop, on line 10, `arr` is expressed as the implicit return value of `star_method`.

Therefore, the new array object passed to `p` on line 14 and output to screen will be: `["Sir", "Rig", "Veg", "Pol", "Alt"]`

This example demonstrates using a simple loop, counter and transformation criterion to perform a transformation operation on an array.

--10:37

### 8 ###

```ruby
numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]

odd_numbers = numbers.select do |number|
                number.odd?
              end

even_numbers = numbers.select do |number|
                number.even?
              end
```

On line 1, local variable `numbers` is initialized to the array `[1, 2, 4, 5, 7, 8, 10, 13, 14]`.

Next, on line 3, local variable `odd_numbers` is initialized to the return value of calling `select` on `numbers` with a `do...end` block. The `select` method iterates through the calling collection passing each element in turn to the block to be assigned to the block parameter `number`. `select` considers the truthiness of the return value from the block for purposes of selection, returning a new array whose elements are only those elements from the caller whose block returned a truthy value.

Within the block, the `Integer#odd?` method is called on the integer currently referenced by `number`. This returns `true` if the integer is odd, `false` otherwise. This is the last evaluated expression in the block and so forms the return value. Therefore this `select` call returns a new array whose elements are `[1, 5, 7, 13]`, which is assigned to `odd_numbers`.

Next, on line 7, local variable `even_numbers` is initialized to the return value of calling `select` on `numbers` again with a block whose parameter is `number`.  Within this block, on line 8, the selection criterion is a call to `Integer#even?` on `number`, which returns `true` if the calling integer is even, `false` otherwise. This forms the return value from the block.

The second `select` call therefore returns a new array with only the even numbers from `numbers` which is assigned to `even_numbers`: `[2, 4, 8, 10, 14]`.

This example demonstrates how the `select` method with a block performs selection on a collection.

--7:01



### 9 ###

```ruby
numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]
odd_numbers = []
even_numbers = []

numbers.each do |number|
  if number.even?
    even_numbers << number
  elsif number.odd?
    odd_numbers << number
  end
end
```

On line 1, local variable `numbers` is initialized to the array ` [1, 2, 4, 5, 7, 8, 10, 13, 14]`. Next, local variable `odd_numbers` is initialized to an empty array, and local variable `even_numbers` is also initialized to an empty array.

On line 5, the `Array#each` method is called on `numbers` with a `do...end` block. `each` performs iteration, passing each element in turn to the block to be assigned to parameter `number`. `each` ignores the return value from the block and returns a reference to the caller.

Within the block, an `if...else` expression extends over lines 6-10. The `if` branch condition evaluates the return value of calling `Integer#even?` on `number`. If the integer is even, `even?` returns `true` and the branch code on line 7 is executed. On line 7, the `Array#<<` method is called on `even_numbers` with `number` passed as argument, destructively appending `number` to the array.

If the `if` condition evaluated to false, the `elsif` condition on line 8 is checked, which evaluates the return value from calling `Integer#odd?` on `number`. If the integer is odd, `odd?` returns `true` and the code on line 9 is executed. Here, the `Array#<<` method is called on `odd_numbers` with `number` passed as argument.

Therefore, after this `each` invocation finishes iteration, `even_numbers` will contain: `[2, 4, 8, 10, 14]`; `odd_numbers` will contain `[1, 5, 7, 13]`.

This example demonstrates using the basic iteration method `each` to perform a partition operation on an array.

--8:19

### 10 ###

```ruby
numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]
odd_numbers = []
even_numbers = []

for number in numbers
  next if number.odd?
  even_numbers << number
end

for number in numbers
  next unless number.odd?
  odd_numbers << number
end
```

On line 1, local variable `numbers` is initialized to the array `[1, 2, 4, 5, 7, 8, 10, 13, 14]`. Next, local variable `odd_numbers` is initialized to a new empty array, and local variable `even_numbers`  is initialized to a new empty array.

A `for` loop extends over lines 5-8. The loop initializes local variable `number`, assigning it each element in turn from the `numbers` array over successive iterations.

Within the loop, on line `6`, an `if` condition evaluates the return value of calling `Integer#odd?` on `number`, which returns `true` if the integer caller is odd, `false` otherwise. If `odd?` returns `true`, the `next` keyword is executed, skipping to the next iteration of the loop without executing any more code on this iteration.

If `odd?` returns `false`, this iteration continues on line 7, where the `Array#<<` method is called on `even_numbers` with `number` passed as argument. This destructively appends `number` to the `even_numbers` array.

Thus, after this `for` loop finishes iteration, the `even_numbers` array will contain all even integers from `numbers`.

On lines 10-13, is a very similar `for` loop. The differences are on lines 11 and 12. On line 11, the `if` modifier is replaced by an `unless` modifier, reversing the logic. This loop will skip those numbers whose `odd?` invocation returns `false`. On line 12, the integer referenced by `number`, which the preceding line has determined to be odd, is destructively appended to the `odd_numbers` array.

Therefore after this second `for` loop, the `odd_numbers` array contains all odd integers from the `numbers` array. So at the end of  this code, `odd_numbers` contains `[1, 5, 7, 13]`, while `even_numbers` contains `[2, 4, 8, 10, 14]`

This example demonstrates using two `for` loops to perform a partition operation on an array.

--10:59

### 11 ###

```ruby
countries_and_capitals = {
  'France' => 'Paris',
  'Belgium' => 'Brussels',
  'Morocco' => 'Rabat',
  'Barbados' => 'Bridgetown',
  'Peru' => 'Lima',
  'Bolivia' => 'La Paz',
  'Brazil' => 'Brasilia'
}

countries_and_capitals.each_with_object({}) do |(k, v), obj|
  obj[k] = v if k.chr == 'B'
end
```

On line 1, local variable `countries_and_capitals` is initialized to the hash:

```ruby
{
  'France' => 'Paris',
  'Belgium' => 'Brussels',
  'Morocco' => 'Rabat',
  'Barbados' => 'Bridgetown',
  'Peru' => 'Lima',
  'Bolivia' => 'La Paz',
  'Brazil' => 'Brasilia'
}
```

Next, the `Enumerable#each_with_object` method is called on `countries_and_capitals` with an empty Hash object passed as argument, with a `do...end` block. The `each_with_object` method iterates through the calling collection passing each key-value pair to the block to be assigned to parameters `k`, for the key object, and `v` for the value object. On each iteration the Hash object passed as argument is also passed into the block and assigned to block parameter `obj`. The `each_with_object` method ignores the return value from the block and returns the Hash object passed as argument.

Within the block, an `if` modifier checks whether the return value of calling `String#chr` on `k`, which returns the first character from the string as a new string, is equal to `'B'`. If so, the code preceding the modifier is executed. Here, a new key-value pair is initialized in the `obj` hash using the `Hash#[]=` method, with `k` passed as the key argument and `v` as the value argument.

This means that this invocation of `each_with_object` will selectively copy key-value pairs from `countries_and_capitals` to the `obj` hash that is to be returned by the method only if the string used as key starts with the letter `'B'`.

Therefore, once the `each_with_object` method returns the hash object passed as argument it now contains the key-value pairs: `{"Belgium"=>"Brussels", "Barbados"=>"Bridgetown", "Bolivia"=>"La Paz", "Brazil"=>"Brasilia"}`.

This example demonstrates performing a selection operation on a hash using the `each_with_object` method.

--9:27

### 12 ###

```ruby
countries_and_capitals = {
  'France' => 'Paris',
  'Belgium' => 'Brussels',
  'Morocco' => 'Rabat',
  'Barbados' => 'Bridgetown',
  'Peru' => 'Lima',
  'Bolivia' => 'La Paz',
  'Brazil' => 'Brasilia'
}

def select_countries(hsh)
  sub_set = {}
  hsh.each_key do |country|
    if country[0] == 'B'
      sub_set[country] = hsh[country]
    end
  end
  sub_set
end

select_countries(countries_and_capitals)
```

On line 1, local variable `countries_and_capitals` is initialized to the hash:

```ruby
{
  'France' => 'Paris',
  'Belgium' => 'Brussels',
  'Morocco' => 'Rabat',
  'Barbados' => 'Bridgetown',
  'Peru' => 'Lima',
  'Bolivia' => 'La Paz',
  'Brazil' => 'Brasilia'
}
```

On lines 11-19 the `select_countries` method is defined with the `def` keyword to have one parameter `hsh`.

On line 21, the `select_countries` method is called with `countries_and_capitals` passed as argument. Thus on this invocation, parameter `hsh` is assigned to the same hash referenced by `countries_and_capitals`.

Within the body of the method definition, on  line 12, the local variable `sub_set` is initialized to an empty hash. On the next line, the `Hash#each_key` method is invoked on `hsh` with a `do...end` block. The `each_key` method iterates through the calling hash passing each key object from the hash to the block to be assigned to parameter `country`. `each_key` ignores the return value from the block and returns a reference to the caller.

Within the block, on line 14, an `if` condition checks whether the first character from the string referenced by `country` is equal to the string `'B'`. If so, line 15 is executed. Here, a new key-value pair is initialized in the `sub_set` hash by calling the `Hash#[]=` element assignment method with `country` passed as key argument; the value argument is  the return value of calling the `Hash#[]` element reference method on `hsh` with `country` passed as argument, which returns the value object in `hsh` that is associated with the key referenced by `country`. This operation copies a key-value pair from `hsh` into `sub_set`, if the `if` condition on line 14 evaluates as true.

Therefore at the end of this `each_key` invocation, the `sub_set` hash contains all key-value pairs from the `hsh` hash where the first character of the string key is `'B'`.

On line 18, `sub_set` is expressed as the implicit return value of the `select_countries` method. Therefore when this hash is returned to line 21, its state will be `{'Belgium' => 'Brussels', 'Barbados' => 'Bridgetown', 'Bolivia' => 'La Paz', 'Brazil' => 'Brasilia'}`.

This example demonstrates using the `each_key` method to perform a selection operation on a hash.

--12:37

### 13 ###

```ruby
countries_and_capitals = {
  'France' => 'Paris',
  'Belgium' => 'Brussels',
  'Morocco' => 'Rabat',
  'Barbados' => 'Bridgetown',
  'Peru' => 'Lima',
  'Bolivia' => 'La Paz',
  'Brazil' => 'Brasilia'
}

def begins_with_b(string)
  string[0] == 'B'
end

countries_and_capitals.find_all do |country, capital|
  begins_with_b(country)
end
```

On line 1, local variable `countries_and_capitals` is initialized to the hash:

```ruby
{
  'France' => 'Paris',
  'Belgium' => 'Brussels',
  'Morocco' => 'Rabat',
  'Barbados' => 'Bridgetown',
  'Peru' => 'Lima',
  'Bolivia' => 'La Paz',
  'Brazil' => 'Brasilia'
}
```

On lines 11-13, the `begins_with_b` method is defined using the `def` keyword and one parameter `string`. Within the body of the definition, on line 12, the `String#[]` method is called on `string` with `0` passed as argument. This method call returns a new string containing the first character from the caller. Chained on this method is a call to `String#==` with `'B'` passed as argument, returning Boolean `true` if the caller is considered equal to the argument, `false` otherwise. Since this is the last evaluated expression in the method definition, it forms the implicit return value. This method therefore checks whether the string passed as argument starts with uppercase letter `"B"`, returning `true` if so, `false` otherwise.

After the method definition, on line 15, the `Enumerable#find_all` method is called on `countries_and_capitals` with a `do...end` block. The `find_all` method iterates through the calling hash passing each key-value pair to the block, with the key object being assigned to the parameter `country` and the value object assigned to parameter `capital`. `find_all` considers the truthiness of the block return value, returning a new nested array whose elements are two-element sub-arrays containing the key and value objects for only those key-value pairs whose block iteration returned a truthy value.

Within the block, the `begins_with_b` method is called with the string currently referenced by `country` passed as argument. This returns `true` if the `country` string starts with `"B"`, `false` otherwise. This is the last evaluated expression in the block and so forms the return value.

This invocation of `find_all` therefore returns a new array containing sub-arrays containing a key object and associated value object of only those key-value pairs from the calling hash whose key begins with `"B"`: `[["Belgium", "Brussels"], ["Barbados", "Bridgetown"], []"Bolivia", "La Paz"], ["Brazil", "Brasilia"]]`

This example demonstrates how the `find_all` method uses the return value from the block; specifically the method considers the truthiness of the block return value for purposes of selection.

--14:38

### 14 ###

```ruby
mailing_campaign_leads = [
  {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
  {name: 'mike richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
  {name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]

counter = 0

loop do
  break if counter == mailing_campaign_leads.size
  full_name = mailing_campaign_leads[counter][:name]
  names = full_name.split

  names_counter = 0
  loop do
    break if names_counter == names.size
    name = names[names_counter]
    names[names_counter] = name.capitalize

    names_counter += 1
  end

  capitalized_full_name = names.join(' ')
  mailing_campaign_leads[counter][:name] = capitalized_full_name

  counter += 1
end

usable_leads = []
counter = 0

loop do
  break if counter == mailing_campaign_leads.size
  last_login = mailing_campaign_leads[counter][:days_since_login]
  subscribed_to_list = mailing_campaign_leads[counter][:mailing_list]

  if last_login < 60 && subscribed_to_list
    usable_leads << mailing_campaign_leads[counter]
  end

  counter += 1
end
```

On line 1, local variable `mailing_campaign_leads` is initialized to the array of hashes: 

```ruby
[
  {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
  {name: 'mike richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
  {name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]

```

Next, local variable `counter` is initialized to integer `0`.

After these variable initializations, on line 10, the `loop` method is invoked with a `do...end` block. The `Kernel#loop` method performs iteration, executing the block until a control expression breaks out of the loop. This is achieved with a `break` condition on the first line within the block, which checks whether `counter` is equal to the size of the `mailing_campaign_leads` array; if so, the `break` keyword is executed and we break from the loop. The `counter` is incremented on the final line of the block, line 27.

On the second line of the block, line 12, the `Array#[]` element reference method is called on `mailing_campaign_leads` with `counter` passed as argument. This call returns the element at the index represented by the integer referenced by `counter`. Chained on the hash that is returned is a call to hash element reference method `Hash#[]` with the symbol `:name` passed as argument. This call returns the value object associated with the key `:name`, which will be a string. This string is used to initialize local variable `full_name`.

Next, on line 13, local variable `names` is initialized to the return value of calling `String#split` on `full_name`; this return value will be a new array containing the first and last name substrings from the calling string split on whitespace.

On line 15, local variable `names_counter` is initialized to `0`.

Next, on line 16, the `loop` method is called again with a `do...end` block. On line 17, the first line of the second-level block, the `break` condition checks if `names_counter` is equal to the size of the `names` array; if so, we break out of the loop. `names_counter` is incremented on the final line of the second-level block.

On the second line of the second-level block, line 18, local variable `name` is initialized to the return value of calling `Array#[]` with `names_counter` passed as argument, returning the string element at the index given by `names_counter`. Next, element assignment method `Array#[]=` is called on the `names` arrays with `names_counter` passed as the index argument and the return value of calling `String#capitalize` on `name` passed as the object to be reassigned at this index. `capitalize` returns a new string with the first character from the caller, if it is a letter, as an uppercase letter, and any remaining letters as lowercase letters. This operation mutates the `names` array so that the string at index `names_counter` now references a new capitalized string. This second-level `loop` invocation with block therefore performs destructive transformation on the elements of the `names` array, capitalizing the first and last names.

After this, on line 24,  local variable `capitalized_full_name` is initialized to the return value of calling join on the `names` array with a space `' '` passed as argument. This returns a new string containing the values of the two strings from `names` separated by a space between them.

Next, array element method `Array#[]` is called on `mailing_campaign_leads` with `counter` passed as argument, returning the hash at index `counter`. Chained on this hash return value is a call to hash element assignment method `Hash#[]=` with `:name` passed as the key argument and `capitalized_full_name` passed as argument. This mutates the hash so that the value associated with `:name` is now  the capitalized version of the name that was stored there before. Therefore, this first-level `loop` invocation with block performs transformation on the value element associated with the `:name` key of each hash in the `mailing_campaign_leads` array.

After this outer `loop` has finished, on line 30, local variable `useable_leads` is initialized to an empty array. Next, `counter` is reassigned to `0`.

Next, on line 33, `loop` is called again with a block. The `break` condition on the first line within the block checks whether `counter` is equal to the size of the `mailing_campaign_leads` array, breaking from the loop if so. `counter` is incremented on line 42.

Next, on line 35, local variable `last_login` is initialized to the return value of a chain of element reference calls. `Array#[]` is called on `mailing_campaign_leads` with `counter` passed as argument, returning the hash element at index `counter`. Chained on this return value is a call to `Hash#[]` with `:days_since_login` passed as argument. This returns the Integer value-object associated with the key `:days_since_login`. This is used to initialize `last_login`.

Next, local variable `subscribed_to_list` is initialized to the return value of a similar chain of method calls, but the second call, to `Hash[]`, this time has `:mailing_list` passed as argument, returning the associated Boolean value-object, which is assigned to `subscribed_to_list`. 

On line 38, an `if` condition checks that the integer referenced by `last_login` is less than `60` and that `subscribed_to_list` references a truthy value. If both these conditions evaluate as true, then line 39 is executed.

On line 39, the `Array#<<` method is called on `usable_leads`, the argument being the return value of calling `Array#[]` on `mailing_campaign_leads` with `counter` passed as argument. This destructively appends the hash element from `mailing_campaign_leads` at index `counter` to the `useable_leads` array`.

Therefore, this final `loop` invocation performs a selection operation on `campaign_mailing_list`, with `usable_leads` containing only those hash elements from the source array which satisfy the two selection criteria given in the `if` condition on line 38.

This example demonstrates using simple loops, counters, break conditions and conditional control-flow expressions to perform transformation and selection operations on a nested data structure.

--56:07

### 15 ###

```ruby
mailing_campaign_leads = [
  {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
  {name: 'mike richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
  {name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]

mailing_campaign_leads.each do |lead|
  names = lead[:name].split
  names.map! { |name| name.capitalize }
  lead[:name] = names.join(' ')
end

usable_leads = mailing_campaign_leads.select do |lead|
  lead[:days_since_login] < 60 && lead[:mailing_list]
end
```

On line 1, local variable `mailing_campaign_leads` is initialized to an array of hashes.

On line 1, local variable `mailing_campaign_leads` is initialized to the array of hashes.

Next, the `Array#each` method is invoked on `mailing_campaign_leads` with a `do...end` block. `each` performs iteration, executing the block once for each hash element, which is passed in and assigned to the block parameter `lead`. `each` ignores the return value of the block and returns a reference to the caller.

Within the block, on line 9, hash element reference method `Hash#[]` is called on the hash currently referenced by `lead` with `:name` passed as the key argument, returning the associated value, a String object. Chained on this return value is a call to `String#split` with no argument, returning a new array with the string from the caller divided into substrings divided on the default delimiter of one or more contiguous whitespace characters. Local variable `names` is then initialized to the array of strings returned by `split`.

Next, the mutating `Array#map!` method is called on `names` with a `{...}` block. The `map!` method iterates through the calling collection passing each element in turn to the block to be assigned to the parameter `name`. `map!` uses the return value of the block for purposes of transformation, destructively replacing the element in the calling array with the object returned by that element's block iteration. Within the block, the `String#capitalize` method is called on `name`, returning a new string based on the caller whose first character, if it is a letter, will now be in uppercase in the new string and all remaining letters will be lowercase. This is the last evaluated expression in the block and so forms the return value. So after this call to `map!`, the first-name and last-name strings in `names` will be new, capitalized strings.

On line 11, the `Array#join` method is called on `names` with a string literal containing a single space passed as the separator argument, returning a new string formed by joining the substrings from the caller with a single space character between consecutive substrings. This new string is then reassigned with the `Hash#[]=` method to be the value-object now associated with the key `:name` in the hash currently referenced by `lead`. This is the last evaluated expression in the block and so forms the return value, but `each` ignores this.

Thus after this call to `each`, every string associated with the key `:name` in every hash in the `mailing_campaign_list` array will have both the first-name and surname capitalized:

```ruby
[
  {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
  {name: 'Mike Richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
  {name: 'Jane Williams', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]
```



After this, on line 14, local variable `useable_leads` is initialized to the return value of calling `Array#select` on `mailing_campaign_leads` with a `do...end` block. `select` iterates through the calling collection passing each hash element to the block to be assigned to the block parameter `lead`. `select` considers the truthiness of the block return value, returning a new array whose elements are only those elements from the caller whose block iteration returned a truthy value.

Within the block, on line 15, two conditional expression are connected with a logical `&&`. The first checks whether the integer associated with the key `:days_since_login` in the hash currently referenced by `lead` is less than `60`, returning Boolean `true` if so, `false` otherwise. The second expression checks whether the Boolean object associated with the key `:mailing_list` in the `lead` hash evaluates as true. The overall expression evaluates as true only if both of these expressions evaluate as true. If the first expression evaluates as false, the overall expression immediately evaluates as false. This is the last evaluated expression in the block and so forms the return value, which `select` uses to determine whether each element will be included in the new array it will return.

Therefore this `select` invocation returns a new array with only those hashes from the caller whose `:days_since_login` key is associated with an integer less than 60, and whose `:mailing_list` key is associated to Boolean object `true`:

```ruby
[
  {name: 'Jane Williams', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]
```

This new array is assigned to variable `useable_leads`.

This example demonstrates using an invocation of `each` to transform the value elements in a hash, and using `select` to perform selection within the context of a nested data structure.

Next, on line 8, the `Array#each` method is called on `mailing_campaign_leads` with a `do...end` block. The `each` method performs iteration, calling the block once for each element in turn with each hash element being assigned to block parameter `lead`. `each` ignores the return value of the block and returns a reference to the caller.

Within the block on line 9, the hash element reference method `Hash#[]` is called on `lead` with `:name` passed as the argument, returning the string value-object associated with the key `:name`. Chained on this return value is a call to `String#split`, which returns a new array containing substrings from the caller divided on whitespace. This array is used to initialize local variable `names`.

Next, on line 10, the mutating `Array#map!` method is called on `names` with a `{...}` block. The `map!` method iterates through the caller passing each element in turn to the block to be assigned to block parameter `name`. `map!` uses the return value from the block to perform destructive transformation, replacing each element in the caller with the object returned by that element's block iteration.

Within the `map!` block, the `String#capitalize` method is called on `name`, returning a new string based on the caller, with the first character, if it is a letter, in uppercase and all remaining letter characters in lowercase. This is the last evaluated expression in the block and so forms the return value.

On line 11, the mutating `Hash[]=` element assignment method is called on `lead` to update the value object associated with `:name`, passed as the key argument; the value argument is the return value of calling `String#join` on `names` with a single space character passed as the separator argument, returning a new string with the strings from the caller joined around a space.

Therefore, this `each` invocation with a block performs transformation on the string associated with the key `:name` in each hash in the `mailing_campaign_leads` array, replacing each full name with a new string where both first and last name are capitalized:

```
[
  {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
  {name: 'Mike Richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
  {name: 'Jane Williams', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]
```



Next, on  line 14, local variable `useable_leads` is initialized to the return value of calling `Array#select` on the `mailing_campaign_leads` array. `select` iterates through the caller passing each hash element in turn to the block to be assigned to the block parameter `lead`. `select` considers the truthiness of the block return value in order to perform selection, returning a new array whose elements are only those elements from the caller whose block iteration returned a truthy value.

Within the block, on line 15, is the `&&` logical operator combines two Boolean expressions. The left operand is the return value of a comparison expression that checks whether the integer value-object associated with the key `:days_since_login` in the hash currently referenced by `lead` is less than `60`, returning `true` if so, `false` otherwise. The right hand expression is the Boolean value-object associated with the key `:mailing_list` in `lead`. Only if both the left- and right-hand expressions evaluate to `true` will the combined expression evaluate to `true`, `false` otherwise. This is the last evaluated expression in the block and so forms the return value.

This `select` invocation therefore returns a new array containing only those hash elements from the caller where the `:days_since_login` integer is less than `60` and the Boolean object associated with `:mailing_list` is `true`:

```
[
  {name: 'Jane Williams', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]
```



This example demonstrates performing transformation and selection on a nested data structure.

29:58

## Lesson 2 ##

### 1 ###

```ruby
arr = [
  {one: '1', two: 2},
  [{four: 5, three: 6}, :three],
  :three,
  {2=>:two, 3=>:three}
]

arr[1][0][:three]
```

On line 1, local variable `arr` is initialized to the array:

On line 1, we initialize local variable `arr` to an an array.

Next, on line 8, the array element reference method `Array#[]` is called on `arr` with `1` passed as argument, returning the element at index `1`, the array `[{four: 5, three: 6}, :three]`. Chained on this return value is another call to `Array#[]` with `0` passed as argument, returning hash object `{four: 5, three: 6}`. Chained on this return value is a call to `Hash#[]` with `:three` passed as argument, returning the value-object associated to the key `:three`, which is the integer `6`.

This example demonstrates using a chain of collection reference methods to return an innermost element in a nested data structure.

--4:34

```ruby
[
  {one: '1', two: 2},
  [{four: 5, three: 6}, :three],
  :three,
  {2=>:two, 3=>:three}
]

```

Next, on line 8, the `Array#[]` element reference method is called on `arr` with `1` passed as argument. This returns the element at index `1`: `[{four: 5, three: 6}, :three]`. Chained on this return value is another call to `Array#[]` with `0` passed as argument, returning the first element `{four: 5, three: 6}`. Chained on this return value is a call to `Hash#[]` with the symbol `:three` passed as argument. This returns the value-object associated with the key-object `:three`, which is the integer `6`.

This example demonstrates chaining element reference methods to return an innermost element in a nested data structure.

--4:23

### 2 ###

```ruby
todo_lists = [
  {
    id: 1,
    list_name: 'Groceries',
    todos: [
      { id: 1, name: 'Bread', completed: false },
      { id: 2, name: 'Milk', completed: false },
      { id: 3, name: 'Apple Juice', completed: false }
    ]
  }
]

todo_lists[0][:todos][2][:name] = 'Orange Juice'

p todo_lists
```

On line 1, local variable `todo_lists` is initialized to the array:

```ruby
[
  {
    id: 1,
    list_name: 'Groceries',
    todos: [
      { id: 1, name: 'Bread', completed: false },
      { id: 2, name: 'Milk', completed: false },
      { id: 3, name: 'Apple Juice', completed: false }
    ]
  }
]
```

Next, the `Array#[]` element reference method is called on `todo_lists` with `0` passed as argument, returning the first and only element:

```ruby
 {
    id: 1,
    list_name: 'Groceries',
    todos: [
      { id: 1, name: 'Bread', completed: false },
      { id: 2, name: 'Milk', completed: false },
      { id: 3, name: 'Apple Juice', completed: false }
    ]
 }
```

Chained on this return value is a call to `Hash#[]` element reference method with `:todos` passed as argument, returning the value-object associated with the key `:todos`:

```ruby
[
      { id: 1, name: 'Bread', completed: false },
      { id: 2, name: 'Milk', completed: false },
      { id: 3, name: 'Apple Juice', completed: false }
]
```

Chained on this return value is a call to `Array#[]` with `2` passed as argument, returning the element at index `2`: `{:id=>3, :name=>"Apple Juice",:completed=>false}`. Chained on this returned hash is a call to the element assignment method `Hash#[]=1`. Here, this mutating method is used to reassign the value-object associated with the key `:name` in the hash to the new string given in literal notation `'Orange Juice'`. This operation mutates the hash object itself.

Therefore after this chain of method calls, when `todo_lists` is passed to the `Kernel#p` method, the output will be:

```ruby
[
  {
    id: 1,
    list_name: 'Groceries',
    todos: [
      { id: 1, name: 'Bread', completed: false },
      { id: 2, name: 'Milk', completed: false },
      { id: 3, name: 'Orange Juice', completed: false }
    ]
  }
]
```

This example demonstrates the use of a chain of element reference and element assignment methods in order to mutate inner objects within a nested data structure.

--8:32



### 3 ###

```ruby
todo_lists = [
  {
    id: 1,
    list_name: 'Groceries',
    todos: [
      { id: 1, name: 'Bread', completed: false },
      { id: 2, name: 'Milk', completed: false },
      { id: 3, name: 'Apple Juice', completed: false }
    ]
  },
  {
    id: 2,
    list_name: 'Homework',
    todos: [
      { id: 1, name: 'Math', completed: false },
      { id: 2, name: 'English', completed: false }
    ]
  }
]

todo_lists[1].each do |list_key, list_value|
  if list_key == :todos
    list_value.each { |todo| todo[:completed] = true }
  end
end
```

On line 1 local variable `todo_lists` is initialized to the array

```ruby
todo_lists = [
  {
    id: 1,
    list_name: 'Groceries',
    todos: [
      { id: 1, name: 'Bread', completed: false },
      { id: 2, name: 'Milk', completed: false },
      { id: 3, name: 'Apple Juice', completed: false }
    ]
  },
  {
    id: 2,
    list_name: 'Homework',
    todos: [
      { id: 1, name: 'Math', completed: false },
      { id: 2, name: 'English', completed: false }
    ]
  }
]
```

Next, on line 21, the `Array#[]` element reference method is called with `1` passed as argument, returning the hash element at index `1`:

```ruby
  {
    id: 2,
    list_name: 'Homework',
    todos: [
      { id: 1, name: 'Math', completed: false },
      { id: 2, name: 'English', completed: false }
    ]
  }
```



 Chained on this return value is a call to `Hash#each` with a `do...end` block. `each` performs iteration, passing each key-value pair in turn to the block, assigning the key object to block parameter `list_key` and the value object to `list_value`, and executing the block. `each` ignores the return value from the block and returns a reference to the caller.

Within the block, on line 22, an `if` condition checks whether the symbol currently referenced by `list_key` is equal to `:todos`. If so, control passes to line 23. Here, the `Array#each` method is called on the array referenced by `list_value` with a `{...}` block. `each` passes each hash element to the block to be assigned to the block parameter `todo`.

Within the inner block, hash element assignment method `Hash#[]=` is called on `todo` with `:completed` passed as the key argument and `true` passed as the value argument. This mutates the Hash object so that the existing `:completed` key is now associated with the Boolean object `true`.

Therefore, these nested calls to `each` perform destructive transformation so that the state of the `todos_list` is now 

```ruby 
[
  {
    id: 1,
    list_name: 'Groceries',
    todos: [
      { id: 1, name: 'Bread', completed: false },
      { id: 2, name: 'Milk', completed: false },
      { id: 3, name: 'Apple Juice', completed: false }
    ]
  },
  {
    id: 2,
    list_name: 'Homework',
    todos: [
      { id: 1, name: 'Math', completed: true },
      { id: 2, name: 'English', completed: true }
    ]
  }
]
```

This example demonstrates using nested iterator methods to transform the innermost elements of a nested data structure.

--13:04

### 4 ###

```ruby
todo_lists = [
  {
    id: 1,
    list_name: 'Groceries',
    todos: [
      { id: 1, name: 'Bread', completed: false },
      { id: 2, name: 'Milk', completed: false },
      { id: 3, name: 'Apple Juice', completed: false }
    ]
  },
  {
    id: 2,
    list_name: 'Homework',
    todos: [
      { id: 1, name: 'Math', completed: false },
      { id: 2, name: 'English', completed: false }
    ]
  }
]

todo_lists[1][:todos][0][:completed] = true
todo_lists[1][:todos][1][:completed] = true
```

On line 1, local variable `todo_lists` is initialized to an array of hashes:

```ruby
[
  {
    id: 1,
    list_name: 'Groceries',
    todos: [
      { id: 1, name: 'Bread', completed: false },
      { id: 2, name: 'Milk', completed: false },
      { id: 3, name: 'Apple Juice', completed: false }
    ]
  },
  {
    id: 2,
    list_name: 'Homework',
    todos: [
      { id: 1, name: 'Math', completed: false },
      { id: 2, name: 'English', completed: false }
    ]
  }
]
```

Next, on line 21, the `Array#[]` element reference method is called on `todo_lists` with `1` passed as argument, returning the hash element at index 1:

```ruby
  {
    id: 2,
    list_name: 'Homework',
    todos: [
      { id: 1, name: 'Math', completed: false },
      { id: 2, name: 'English', completed: false }
    ]
  }
```

Chained on this return value is a call to `Hash#[]` element reference method with symbol `:todos` passed as argument, returning the Array object associated to the key `:todos`:

```ruby
[
      { id: 1, name: 'Math', completed: false },
      { id: 2, name: 'English', completed: false }
]
```

Chained on this return value is a call to `Array#[]` with `0` passed as argument, returning the first hash `{ id: 1, name: 'Math', completed: false }`. Chained on this return value is a call to the mutating `Hash#[]=` element assignment method with `:completed` passed as the key argument and Boolean object `true` passed as value argument. This destructively reassigns the key `:completed` so that it is now associated with `true`.

Next, on line 22, the `Array#[]` element reference method is called on `todo_lists` with `1` passed as argument, returning the hash element at index `1`:

```ruby
  {
    id: 2,
    list_name: 'Homework',
    todos: [
      { id: 1, name: 'Math', completed: false },
      { id: 2, name: 'English', completed: false }
    ]
  }
```

Chained on this return value is a call to `Hash#[]` with `:todos` passed as argument, returning the array value-object associated with the key-object `:todos`:

```ruby
[
      { id: 1, name: 'Math', completed: false },
      { id: 2, name: 'English', completed: false }
]
todo_lists[1][:todos][1][:completed] = true
```

Chained on this return value is a call to `Array#[]` with `1` passed as argument, returning the hash element at index `1`: `{ id: 2, name: 'English', completed: false }`. Chained on this return value is a call to the mutating hash element assignment method `Hash#[]=` with `:completed` passed as the key argument and `true` passed as the value argument. This destructively reassigns the existing key `:completed` so that it is now associated with the object `true`.

Therefore, at the end of these two chains of element reference and assignment, the state of the nested data structure referenced by `todo_lists ` is:

```ruby 
[
  {
    id: 1,
    list_name: 'Groceries',
    todos: [
      { id: 1, name: 'Bread', completed: false },
      { id: 2, name: 'Milk', completed: false },
      { id: 3, name: 'Apple Juice', completed: false }
    ]
  },
  {
    id: 2,
    list_name: 'Homework',
    todos: [
      { id: 1, name: 'Math', completed: true },
      { id: 2, name: 'English', completed: true }
    ]
  }
]

```

This example demonstrates using a chain of element reference and assignment methods in order to reassign the innermost elements of a nested data structure.

--13:16

### 5 ###

```ruby
todo_lists = [
  {
    id: 1,
    list_name: 'Groceries',
    todos: [
      { id: 1, name: 'Bread', completed: false },
      { id: 2, name: 'Milk', completed: false },
      { id: 3, name: 'Apple Juice', completed: false }
    ]
  },
  {
    id: 2,
    list_name: 'Homework',
    todos: [
      { id: 1, name: 'Math', completed: false },
      { id: 2, name: 'English', completed: false }
    ]
  }
]

todo_lists[1][:todos].each do |todo|
  todo[:completed] = true
end
```

On line 1, local variable `todo_lists` is initialized to the array of hashes

```ruby
[
  {
    id: 1,
    list_name: 'Groceries',
    todos: [
      { id: 1, name: 'Bread', completed: false },
      { id: 2, name: 'Milk', completed: false },
      { id: 3, name: 'Apple Juice', completed: false }
    ]
  },
  {
    id: 2,
    list_name: 'Homework',
    todos: [
      { id: 1, name: 'Math', completed: false },
      { id: 2, name: 'English', completed: false }
    ]
  }
]
```

Next, on line 21, the `Array#[]` element reference method is called on `todo_lists` with `1` passed as argument, returning the hash element at index `1`:

```ruby
{
    id: 2,
    list_name: 'Homework',
    todos: [
      { id: 1, name: 'Math', completed: false },
      { id: 2, name: 'English', completed: false }
    ]
  }

```

Chained on this return value is a call to `Hash#[]` with `:todos` passed as argument, returning the value object, an array, associated with the key object `:todos`:

```ruby
[
      { id: 1, name: 'Math', completed: false },
      { id: 2, name: 'English', completed: false }
]
```

Chained on this return value is a call to the `Array#each` method with a `do...end` block. The `each` method performs iteration, passing each element in turn to the block to be assigned to the block paramter `todo`. `each` ignores the return value from the block and returns a reference to the caller.

Within the block, on line 22, the mutating hash element assignment method `Hash#[]=` is called on `todo` with `:completed` passed as the key argument and the boolean object true passed as the value argument. This mutates this hash so that  the existing key `:completed` is now associated with the object `true`.

Therefore at the end of this code, the state of the `todo_lists` array is:

```ruby 
todo_lists = [
  {
    id: 1,
    list_name: 'Groceries',
    todos: [
      { id: 1, name: 'Bread', completed: false },
      { id: 2, name: 'Milk', completed: false },
      { id: 3, name: 'Apple Juice', completed: false }
    ]
  },
  {
    id: 2,
    list_name: 'Homework',
    todos: [
      { id: 1, name: 'Math', completed: true },
      { id: 2, name: 'English', completed: true }
    ]
  }
]
```

This example demonstrates using chained calls to element reference and element assignment methods to mutate nested data structures.

--8:25

### 6 ###

```ruby
a = 'hi'
english_greetings = ['hello', a, 'good morning']

greetings = {
  french: ['bonjour', 'salut', 'allo'],
  english: english_greetings,
  italian: ['buongiorno', 'buonasera', 'ciao']
}

greetings[:english][1] = 'hey'

greetings.each do |language, greeting_list|
  greeting_list.each { |greeting| greeting.upcase! }
end

puts a
puts english_greetings[1]
puts greetings[:english][1]
```

On line 1, local variable `a` is initialized to the string `"hi"`.

Next, on line 2, local variable `english_greetings` is initialized to the array `["hello", a, "good morning"]`. Currently, the reference at index `1` of the `english_greetings` array and variable `a` both reference the same String object.

On line 3, local variable `greetings` is initialized to the hash

```ruby
{
  french: ['bonjour', 'salut', 'allo'],
  english: english_greetings,
  italian: ['buongiorno', 'buonasera', 'ciao']
}
```

Currently, the value associated with the key `:english` in the `greetings` hash and the `english_greetings` variable both reference the same Array object.

On line 10, the destructive `Hash#[]=` element assignment method is called on `greetings` with `:english` passed as argument, returning the array referenced by the hash key `:english` as well as the `english_greetings` variable. Chained on this return value is a call to the element assignment method `Array#[]=` with `1` passed as the index argument and the string `hey` passed as the element argument. This reassigns the reference at index `1` of the array to point to the new string given in literal notation `hey`. This mutates the array referenced in by the `english_greetings` variable and the `:english` key in `greetings`.

Next, the `Hash#each` method is called on the `greetings` hash with a `do...end` block. The `each` method performs iteration, passing each key-value pair in turn to the block, the key being assigned to parameter `language` and the value to `greeting_list`. `each` ignores the return value of the block and returns a reference to the caller.

Within the block, on line 13, the `Array#each` method is called on `greeting_list` with a `{...}` block, passing each element in turn to the block parameter `greeting`. Within the block, the destructive `String#upcase!` method is called on `greeting`, mutating the String object such that all letter characters are now in uppercase.

Therefore, at the end of this code, when `a` is passed to the `Kernel#puts` method on line 16, the output will still be `hi`. When `english_greetings[1]` is passed to `puts` on line 17 the output will be `HEY`. When `greetings[:english][1]` is passed to `puts` on the final line, the output will also be `HEY`, since this is the same String object referenced as argument on line 17.

This example demonstrates how, in Ruby, variables, the indexes of Arrays, and the associative references of Hashes act as pointers to objects.

--24:46

### 7 ###

```ruby
order_data = [
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 351, order_date: '12/04/16', order_fulfilled: true, order_value: 135.99},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 383, order_date: '12/04/16', order_fulfilled: true, order_value: 289.49},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 392, order_date: '01/10/17', order_fulfilled: false, order_value: 58.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 241, order_date: '11/10/16', order_fulfilled: true, order_value: 120.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 395, order_date: '01/10/17', order_fulfilled: false, order_value: 85.65},
  # rest of data...
]

customer_orders = {}

order_data.each do |row|
  if customer_orders.key?(row[:customer_id])
    customer_orders[row[:customer_id]][:orders] << {
      order_fulfilled: row[:order_fulfilled],
      order_value: row[:order_value]
    }
  else
    customer_orders[row[:customer_id]] = {
      customer_id: row[:customer_id],
      customer_name: row[:customer_name],
      orders: [
        {
          order_fulfilled: row[:order_fulfilled],
          order_value: row[:order_value]
        }
      ]
    }
  end
end

customer_orders = customer_orders.values
```

On line 1, local variable `order_data` is initialized to an array of hashes. Next, on line 10, local variable `custom_orders` is initialized to an empty hash.

On line 12, the `Array#each` method is called on `order_data` with a `do...end` block. `each` performs iteration, passing hash each element in turn to the block to be assigned to parameter `row` and executing the block. `each` ignores the block return value and returns a reference to the caller.

Within the block, on line 13, an `if` condition checks whether the return value of calling the `Hash#key?` predicate method on `customer_orders` with `row[:customer_id]` passed as argument evaluates as true. The  `Hash#[]` method called on `row` returns the value object associated with key `:customer_id` and it is this value object that is returned and passed as argument to `key?`. `key?` will return `true` if the value object associated with `:customer_id` in the hash currently referenced by `row` is present as a key object in the `customer_orders` hash, `false` otherwise. If `key?` returns `true`, this means the key has already been created on a previous iteration where the `else` branch was followed, so now the `if` branch is followed and the code on lines 14-17 is executed.

On line 14, the `Hash#[]` method is called on `customer_orders`, again with `row[:customer_id]` passed as argument;  the nested call to `Hash#[]` returns the Integer value-object from `row` associated with the key-object `:customer_id` and passes it as argument to the call to `Hash#[]` on `customer_orders` as the key argument, returning the associated hash value. Chained on this return value is another call to `Hash#[]` with `:orders` passed as the key argument, returning the associated Array object. Chained on this return value is a call to `Array#<<`, which destructively appends a new hash given in literal notation `{order_fulfilled: row[:order_fulfilled], order_value: row[:order_value]}` to the array. This adds a new hash to the array of `:orders`, grouping order details from the hash currently referenced by `row`, with the same `:customer_id`, within the nested data structure that this `each` call with block is building.

If `key?` returns `false` on line 13, the `else` branch is followed and the code on lines 19-28 is executed. Here, a new key-value pair is created in `customer_orders` for the integer associated with `:customer_id` in `row`. To achieve this, the `Hash#[]=` element assignment method is called on `customer_orders` with `row[:customer_id]` passed as the key argument and a hash given in literal notation passed as the value argument:

```ruby
{
      customer_id: row[:customer_id],
      customer_name: row[:customer_name],
      orders: [
        {
          order_fulfilled: row[:order_fulfilled],
          order_value: row[:order_value]
        }
      ]
}
```

This creates the array referenced by `:orders` in the new hash that is the value part of a new key-value pair in `customer_orders` for this `:customer_id` to which the `if` branch then adds more order details if other hash elements in the `order_data` array share the same `:customer_id`.

After this `each` invocation finishes iteration, the state of the `customer_orders` hash will be

```ruby
{
    12 => {
      customer_id: 12,
      customer_name: "Emma Lopez",
      orders: [
        {
          order_fulfilled: true,
          order_value: 135.99
        },
        {
          order_fulfilled: true,
          order_value: 289.49
        },
        {
          order_fulfilled: false,
          order_value: 58.00
        }
      ]
    },
    32 => {
      customer_id: 32,
      customer_name: "Michael Richards",
      orders: [
        {
          order_fulfilled: true,
          order_value: 120.00
        },
        {
          order_fulfilled: false,
          order_value: 85.65
        }
      ]
    }
}
```

Finally, on line 32, the `customer_orders` variable is reassigned to the return value of calling `Hash#values` on `customer_orders`, which returns a new array object whose elements are only the value objects from the key-value pairs in the caller.

Therefore, at the end of this code, the state of the new array reassigned to `customer_orders` will be:

```ruby
{
    {
      customer_id: 12,
      customer_name: "Emma Lopez",
      orders: [
        {
          order_fulfilled: true,
          order_value: 135.99
        },
        {
          order_fulfilled: true,
          order_value: 289.49
        },
        {
          order_fulfilled: false,
          order_value: 58.00
        }
      ]
    },
    {
      customer_id: 32,
      customer_name: "Michael Richards",
      orders: [
        {
          order_fulfilled: true,
          order_value: 120.00
        },
        {
          order_fulfilled: false,
          order_value: 85.65
        }
      ]
    }
}
```



This example demonstrates using iterator method `each` to iteratively build a new nested data structure that restructures data from another nested data structure.

--51:45



### 8 ###

```ruby
customer_orders = [
  {
    customer_id: 12,
    customer_name: 'Emma Lopez',
    orders: [
      { order_fulfilled: true, order_value: 135.99 },
      { order_fulfilled: true, order_value: 289.49 },
      { order_fulfilled: false, order_value: 58.00 }
    ]
  },
  {
    customer_id: 32,
    customer_name: 'Michael Richards',
    orders: [
      { order_fulfilled: true, order_value: 120.00 },
      { order_fulfilled: false, order_value: 85.65 }
    ]
  },
  # rest of data...
]

all_orders = customer_orders.map do |customer_data|
  order_value = customer_data[:orders].inject(0) do |total, order_data|
    total + order_data[:order_value]
  end

  {
    customer_id: customer_data[:customer_id],
    customer_name: customer_data[:customer_name],
    total_order_value: order_value
  }
end

```

On line 1, local variable `customer_orders` is initialized to an array of hashes.

Next, on line 22, local variable `all_orders` is initialized to the return value of invoking `Array#map` on `customer_orders` with a `do...end` block. `map` iterates through the calling array passing each hash element in turn to the block to be assigned to block parameter `customer_data`. `map` uses the return value of the block in order to perform  transformation, returning a new array whose elements are the return values from the block iterations.

Within the block on line 23, local variable `order_value` is initialized to the return value of a chain of method calls. The `Hash#[]` element reference method is called on `customer_data` with `:orders` passed as argument, returning the value array associated with the key `:orders`. Chained on this return value is a call to `Array#inject` with `0` passed as argument and a `do...end` block. `inject` iterates through the calling collection passing each element in turn to be assigned to block parameter `order_data`. Since `inject` was called with an argument, on the first iteration the argument `0` is passed to the block to be assigned to the block parameter `total`; on each iteration thereafter, the return value from the previous block iteration is assigned to `total`; finally, `inject` returns the return value of the final block iteration.

Within the block, on line 24, the `Integer#+` method is invoked on `total`; the argument passed is the return value of calling `Hash#[]` on `order_data` with `:order_value` passed as argument, returning an integer. This is the last evaluated expression in the block and so forms its return value. Thus, this `inject` invocation iterates through the array referenced by `:orders` and sums the integers in each hash element that are associated with the key `:order_value`, creating a sum total of the expenditure of all of that customer's orders.

The last evaluated expression in the block which forms the return value of the `map` block is a hash literal that makes use of the integer value calculated by the call to `inject` and assigned to variable `order_value`:

```ruby
  {
    customer_id: customer_data[:customer_id],
    customer_name: customer_data[:customer_name],
    total_order_value: order_value
  }
```

Thus, after this call to `map`, the nested data structure assigned to `all_orders` will be:

```ruby
[
   {
    customer_id: 12,
    customer_name: "Emma Lopez",
    total_order_value: 483.48
  },
  {
    customer_id: 32,
    customer_name: "Michael Richards",
    total_order_value: 205.65
  }
]
```

This example demonstrates using nested iterators to transform a nested data structure.

--21:08



### 9 ###

```ruby
customer_orders = [
  {
    customer_id: 12,
    customer_name: 'Emma Lopez',
    orders: [
      { order_fulfilled: true, order_value: 135.99 },
      { order_fulfilled: true, order_value: 289.49 },
      { order_fulfilled: false, order_value: 58.00 }
    ]
  },
  {
    customer_id: 32,
    customer_name: 'Michael Richards',
    orders: [
      { order_fulfilled: true, order_value: 120.00 },
      { order_fulfilled: false, order_value: 85.65 }
    ]
  },
  # rest of data...
]

all_orders = customer_orders.map do |customer|
  {
    customer_id: customer[:customer_id],
    customer_name: customer[:customer_name]
  }
end

customer_orders.each_with_index do |data, index|
  order_value = data[:orders].reduce(0) do |total, order|
    total + order[:order_value]
  end

  all_orders[index][:total_order_value] = order_value
end
```

On line 1, local variable `customer_orders` is initialized to the array of hashes

```ruby
customer_orders = [
  {
    customer_id: 12,
    customer_name: 'Emma Lopez',
    orders: [
      { order_fulfilled: true, order_value: 135.99 },
      { order_fulfilled: true, order_value: 289.49 },
      { order_fulfilled: false, order_value: 58.00 }
    ]
  },
  {
    customer_id: 32,
    customer_name: 'Michael Richards',
    orders: [
      { order_fulfilled: true, order_value: 120.00 },
      { order_fulfilled: false, order_value: 85.65 }
    ]
  },
  # rest of data...
]
```

where each hash element represents a customer.

Next, on line 22, local variable `all_orders` is initialized to the return value of calling `Array#map` on `customer_orders` with a `do...end` block. `map` iterates through the caller, passing each hash element in turn to the block to be assigned to the block parameter `customer`. `map` uses the return value of the block to perform transformation, returning a new array whose elements are the return values from the block iterations.

Within the block, on line 23, a new hash is constructed in literal notation. The first key-value pair, on line 24, has for key  a symbol given in literal notation `:customer_id`. The value part is the return value of calling the `Hash#[]` element reference method on the customer hash currently referenced by `customer` with `:customer_id`, which returns an integer customer id. On line 25, the key is `:customer_name` and the value part is the return value of calling `Hash#[]` on `customer` with `:customer_name` passed as argument, which returns a string. This new hash is the last evaluated expression in the `map` block and so forms its return value.

This invocation of `map` therefore makes new shallow copies of each customer hash from the `customer_orders` array except with only the `:customer_id` and `:customer_name` key value pairs present; the `:orders` pair is missing. These new hashes are returned in a new array, where each index of each hash element corresponds to the index of the same customer's hash in `customer_orders`. This new array is assigned to `all_orders`:

```ruby
[
  {
    customer_id: 12,
    customer_name: 'Emma Lopez'
  },
  {
    customer_id: 32,
    customer_name: 'Michael Richards'
  },
  # rest of data...
]
```



 After this, on line 29, the `Array#each_with_index` method is called on `customer_orders` with a `do...end` block. `each_with_index` performs iteration, passing each element from the caller and its integer index to the block to be assigned to block parameters `data` and `index` respectively. `each` ignores the return value from the block and returns a reference to the caller.

Within the block, on line 30, local variable `order_value` is called on the return value of calling `Array#reduce` on the array that is the value part of the key-value pair in `data` whose key is `:orders` with `0` passed as argument. The `Array#reduce` method iterates through the caller passing each hash element in turn to the block to be assigned to the second block parameter `order`. On the first iteration, the argument `0` is passed to the first block parameter `total`. On every subsequent iteration, the return value of the previous block is assigned to `total`. `reduce` then returns the final block return value as the method return value.

Within the block, on line 31, the only expression, which thus forms the block return value, adds the Numeric referenced by `total` to the Float return value of calling `Hash#[]` on `order` with `:order_value` passed as argument. Therefore, this `reduce` invocation returns the sum of every order's monetary value, taken from the `:orders` array in the `customer_orders` hash as a Float and assigns it to the `order_value` variable.

On line 34, a new key-value pair is created in the hash in the `all_orders` array at the same `index` as the current `data` hash is at in the `customer_orders` array. To achieve this, the `Hash#[]=` method is invoked on the `all_orders` array's hash at this `index`, with the new symbol `:total_order_value` as the key and the Float referenced by `order_value` passed as the value argument.

Therefore, this `each_with_index` returns a reference to the `all_orders` array whose state is now: 

```ruby
[
  {
    customer_id: 12,
    customer_name: 'Emma Lopez',
    total_order_value:  483.48
  },
  {
    customer_id: 32,
    customer_name: 'Michael Richards',
    total_order_value: 205.65
  },
  # rest of data...
]
```

This example demonstrates using nested iterator methods to construct a new nested data structure based on data from another nested data structure.

39:17

### 10 ###

```ruby
customer_orders = [
  {
    customer_id: 12,
    customer_name: 'Emma Lopez',
    orders: [
      { order_fulfilled: true, order_value: 135.99 },
      { order_fulfilled: true, order_value: 289.49 },
      { order_fulfilled: false, order_value: 58.00 }
    ]
  },
  {
    customer_id: 32,
    customer_name: 'Michael Richards',
    orders: [
      { order_fulfilled: true, order_value: 120.00 },
      { order_fulfilled: false, order_value: 85.65 }
    ]
  },
  # rest of data...
]

all_orders = []

customer_orders.each do |customer_data|
  customer_total_orders = {
    customer_id: customer_data[:customer_id],
    customer_name: customer_data[:customer_name],
    total_order_value: 0
  }

  customer_data[:orders].each do |order|
    customer_total_orders[:total_order_value] += order[:order_value]
  end

  all_orders << customer_total_orders
end
```

