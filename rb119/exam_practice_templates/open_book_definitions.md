## **Sort without a block**

When called without a block, `sort` returns a new array object containing the elements from the caller sorted in ascending order. In order to achieve this, `sort` makes a series of comparisons between pairs of elements using the `<=>` method of the elements being compared.



Here the elements are ... so the ... method is used.



 In the case of a hash, the key-value pairs will be two-element sub-array elements in the new array, with the key at the first index, the value at the second index.

## **Sort with a block**

When called with a block, `sort` passes each pair of elements that need to be compared to the block to be assigned to the block parameters.

`sort` uses the return value from the block as though it were the return value of calling the `<=>` method on the object assigned to the first parameter with the object assigned to the second parameter passed as argument. If the block returns `-1`, the object passed to the first block parameter is considered lesser; if the block returns `0`, they are considered equal; if the block returns `1`, the object passed to the first block parameter is considered greater. The `sort` method then returns a new array object with the elements from the caller sorted in what would be ascending order if the return values from the block were the return values from simple calls to `<=>`.



 In the case of a hash, the key-value pairs will be two-element sub-array elements in the new array, with the key at the first index, the value at the second index.

## **Integer#<=>**

The `Integer#<=>` method makes a comparison based on numeric value between the calling integer and the argument in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, `1` if the caller is greater. If the object passed as argument cannot be compared to the caller, `<=>` returns `nil`.

If `sort` receives a `nil` return from `<=>`, this causes `sort` to throw an `ArgumentError`.

## **String#<=>**

The `String#<=>` method makes character-wise comparison between two strings based on ASCII character table order: the later the placement in the ASCII table, the greater the value. Character-wise comparison means that the characters at index `0` in the two strings are compared and if no difference is found then the characters at index `1` are compared and so on until a difference is found. If no difference is found up to the length of the shorter string, the longer string is considered greater. If no difference is found in equal-sized strings, they are considered equal. The `String#<=>` method makes this comparison between caller and argument in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, and `1` if the caller is greater. If the argument cannot be compared to the caller, the `<=>` method returns `nil`.

If `sort` receives a `nil` return value from `<=>`, this causes `sort` to throw an `ArgumentError`.

## **Array#<=>**

`Array#<=>` compares Array objects in an element-wise manner. The elements at index `0` of the two arrays are compared and if no difference is found then the elements at index `0` are compared and so on until a difference is found. If no difference is found up to the end of the shorter array then the longer array is considered greater. If no difference is found in equally-sized arrays, they are considered equal. `Array#<=>` makes this comparison between caller and argument in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, `1` if the caller is greater. If the argument object cannot be compared to the calling array, `Array#<=>` returns `nil`. These element comparisons are made using the `<=>` method proper to the elements being compared. If the `<=>` method call comparing individual elements finds that the elements cannot be compared, it returns `nil`, in which case the `Array#<=>` method also returns `nil`.

A `nil` return from the `<=>` method causes `sort` to throw an `ArgumentError`.

## Freezing

`Object#freeze` (*avoid mentioning class here since the documentation only mentions String extending* `freeze` *and gives no details of whether there is any difference to the Object instance method). Array and Hash docs do not mention a* `freeze` *method at all and may simply inherit.*

The `freeze` method causes the caller to take on a frozen state and returns a reference to the caller. Once frozen, an object can no longer be mutated. An object cannot then be unfrozen. Immutable objects such as Integers are considered always-frozen since they cannot be mutated.

## Enumerable methods in study guide

Hashes use `Enumerable#map`, `Enumerable#all?`

Arrays use `Enumerable#each_with_object`, `Enumerable#partition`

## `Integer#times`

The `Integer#times` method calls the block the number of times specified by the integer caller, passing to the block parameter each integer from `0` up to but not including the caller. `times` ignores the return value from the block and returns a reference to the caller.

## **`Enumerable#sort_by` with a block**

The `sort_by` method returns a new array whose elements are the elements from the calling collection sorted according to the criterion given in the block. In order to do this, `sort_by` passes each element in turn to the block to be assigned to the block parameter.

`sort_by` then uses the return value of each element's block iteration as a sort key that is used in place of the associated element in the series of comparisons `sort_by` makes to determine the relative valuation of elements. These comparisons are made with the `<=>` method of the sort key objects returned by the block. `sort_by` then returns a new array containing the elements from the caller sorted in ascending order of the value of the sort-key object associated to each element during the sorting process.

 In the case of a hash, the key-value pairs will be two-element sub-array elements in the new array, with the key at the first index, the value at the second index.

## **`Array#min`/`Enumerable#min` without block**

The `min` method returns the element in the calling collection determined to be the least in value. To determine this, the `min` method makes a series of comparisons between pairs of elements by invoking the `<=>` method appropriate to the objects being compared, with one element as caller and one as argument. The `<=>` method returns `-1` if the caller is lesser than the argument, `0` if they are equal, `1` if the caller is greater than the argument, and `nil` if they cannot be compared. The `min` method will throw an `ArgumentError` if it receives a `nil` return from any of these comparisons.

## **`Array#max`/`Enumerable#max` without block**

The `max` method returns the element in the calling collection determined to be the greatest in value. To determine this, the `max` method makes a series of comparisons between pairs of elements by invoking the `<=>` method appropriate to the objects being compared, with one element as caller and one as argument. The `<=>` method returns `-1` if the caller is lesser than the argument, `0` if they are equal, `1` if the caller is greater than the argument, and `nil` if they cannot be compared. The `max` method will throw an `ArgumentError` if it receives a `nil` return from any of these comparisons.

## **`Array#minmax`/`Enumerable#max` without block**

The `minmax` method returns a two element array whose first element is the element from the calling collection determined to be the least in value and whose second is the element from the calling collection determined to be the greatest in value. To determine this, the `minmax` method makes a series of comparisons between pairs of elements by invoking the `<=>` method appropriate to the class of object being compared, with one element as caller and one as argument. The `<=>` method returns `-1` if the caller is lesser than the argument, `0` if they are equal, `1` if the caller is greater than the argument, and `nil` if they cannot be compared. The `minmax` method will throw an `ArgumentError` if it receives a `nil` return from any of these comparisons.

## **`Enumerable#min_by`**

The `min_by` method returns the element from the calling collection determined to be of least value according to a given criterion. To determine this, `min_by` passes each element to the given block in turn to be assigned to a parameter; the return value from that block execution forms the criterion by which comparisons between elements are to be made. The `min_by` method then makes a series of comparisons in a similar manner to `min`, yet these comparisons are between the block return values associated with each element from the caller rather than between the elements themselves. The element determined to be of least value according to its associated block return value will then form the return value of the `min_by` method.

## **`Enumerable#max_by`**

The `max_by` method returns the element from the calling collection determined to be of greatest value according to a given criterion. To determine this, `max_by` passes each element to the given block in turn to be assigned to a parameter; the return value from that block execution forms the criterion by which comparisons between elements are to be made. The `min_by` method then makes a series of comparisons in a similar manner to `max` except these comparisons are between the block return values associated with each element from the caller rather than between the elements themselves. The element determined to be of greatest value according to its associated block return value will then be returned by the `max_by` method.

## **`Enumerable#minmax_by`**

The `minmax_by` method returns a two element array; the first and second elements of this returned array are, respectively, the element from the calling collection determined to be of least value and the element determined to be of greatest value according to a given criterion. To determine this, `minmax_by` passes each element in turn to the given block to be assigned to a parameter; the return value from that block execution forms the criterion by which comparisons between elements are to be made. The `minmax_by` method then makes a series of comparisons in a similar manner to `minmax` except these comparisons are between the block return values associated with each element from the calling collection rather than between the elements themselves. The `minmax_by` method then returns a two-element array whose elements are the two elements determined to be least and greatest according to this comparison criterion.

## `break` and `next` keywords ##

`break` - the `break` keyword breaks out of the current block or loop. `break` can accept an argument that forms the return value of the overall expression. Used in the block given to a method invocation, `break` breaks out of the entire method invocation with block expression, not merely the current block iteration.

`next` - the `next` keyword skips to the next iteration. `next` can accept an argument that will be used as the return value of the current block iteration 

## Nested Data Structures, Nested Iteration ##

A nested data structure is a collection that contains other collections. An outermost collection may contain collections, which may contain collections, and so on.

If we need to iterate over all the innermost elements in a nested data structure, it becomes necessary to nest iterator methods with blocks, taking care to match the layers of nested iteration to the layers of nesting in the data structure.



## Shallow Copy and Deep Copy ##

The methods `dup` and `clone` both return a shallow copy of a collection object. This means that the returned collection will be a new object of the caller's class, but the elements of the new collection will be the same objects referenced by the calling collection. The elements are shared between the original collection object and the new copy. A deep copy would mean that, in addition to making a copy of the collection object, all elements in the original collection would be copied, forming new objects in the new collection; there is no equivalently-simple method for making a deep copy of a collection in Ruby.

The principal difference between `dup` and `clone` is that `clone` preserves the frozen state of a frozen object while `dup` does not.

 ## Method Chaining ##

 In Ruby, since every method returns a value, another method call can be chained on the return value of a previously called method. Another method can be chained on that return value, and so on. For example,

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



## **pass-by-reference and \*pass-by-value\***

In a pass-by-value object passing strategy, a copy is made of the object passed to a method as argument and any changes to the object’s value within the method definition are actually being performed on a copy and will not affect the object that was passed as argument.

In a pass-by-reference object passing strategy, what is passed is a reference to the memory space of the object passed as argument. Any change to the object’s value within the method, including reassignment, will directly affect the object that was passed. A parameter variable in the method is a direct alias of the variable passed as argument.

In Ruby’s object passing strategy, sometimes called pass-by-reference-value, what is passed is a reference to an object, separate to any variable used as the argument that references that object. This is because Ruby variables do not contain objects, only pointers to objects elsewhere in memory. Thus, if an object provides mutating methods, its internal state in memory can be mutated within the method it has been passed into; but if the method parameter variable is reassigned, this reassignment only reassigns the parameter variable local to the method. Reassignment of a method parameter variable simply causes the variable local to the method to point to another object while the variable used as the argument to the invocation cannot be reassigned from within the method. It is only the object’s reference that has been passed, not a reference to a variable. Thus in Ruby, a local variable cannot be reassigned by being passed to a method as argument; the corresponding parameter variable is not an alias to it.

## **The Call Stack**

The call stack is a way of organizing memory such that Ruby can keep track of which method should currently have control and where to resume execution when that method returns. The call stack is a last-in-first-out data structure consisting of stack frames, each pertaining to a method invocation. When a method is called, Ruby updates the current stack frame with the point in the program at which the call was made and pushes a new stack frame to the call stack for the method that has been invoked. If that method calls another method, the point where control should resume is saved in the current frame and another stack frame is pushed to the stack. When the currently executing method returns, its frame is popped from the stack and execution resumes at the point it was called from.

If the number of stack frames exceeds the size of memory allocated to the call stack, a `SystemStackError` is thrown. Blocks, procs and lamdas all use the call stack similarly to methods.

## **`String#upto`**

The `Stringupto` method iterates over a sequence of String objects that are the result of successive calls to the `String#succ` method. On the first iteration the caller is passed to the block to be assigned to the block parameter. On the second iteration, the return value of calling `succ` on the caller is passed to the block. On the third, the return value of calling `succ` on the previous return value of `succ` is passed to the block, and so on. Iteration stops when the string passed as argument is reached, which must therefore be a string whose character-wise ASCII valuation is greater than the caller. `upto` ignores the return value from the block, and returns a reference to the calling string.

## **`String#succ`**

The `String#succ` method returns a new string that is the successor to the caller; this is determined by incrementing characters.

The character to be incremented will be either the rightmost alphanumeric character or, if there are none, the rightmost character. A digit will be incremented to the next digit; if the digit is '9', this will be rolled over to `0`, carrying to increment the character to the left. If it is necessary in order to express the carry, another digit is inserted to the left of the digit that is rolling over.

The successor to a letter character is the next letter of the same case. Letters will rollover and carry similarly to digits, inserting another letter of the same case to the left of the letter that is rolling over if this is necessary to express the carry.

Carrying can occur between alphabetic and numeric characters, so `"a9".succ` will return `"b0"`.

The successor to a non-alphanumeric character is the next character in character set, rolling over and carrying if necessary.

If called on an empty string, the return value will be a new empty string.

`succ` will thus return a new string with with either the rightmost alphanumeric character incremented, carrying and rolling over if necessary, or if there are no alphanumerics, the rightmost character incremented, carrying and rolling over if necessary.

## 