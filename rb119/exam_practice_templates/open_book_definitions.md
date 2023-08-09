## Sort without a block

When called without a block, `sort` returns a new array object containing the elements from the caller sorted in ascending value. In order to achieve this, `sort` makes a series of comparisons between pairs of elements using the `<=>` method proper to the elements being compared.

Here the elements are ... so the ... method is used.

## Sort with a block

When called with a block, `sort` passes each pair of elements that need to be compared to the block to be assigned to the block parameters.

`sort` uses the return value from the block as though it were the return value of calling the `<=>` method on the object assigned to the first parameter with the object assigned to the second parameter passed as argument. If the block returns `-1`, the object passed to the first parameter is considered lesser; if the block returns `0`, they are considered equal; if the block returns `1`, the object passed to the first parameter is considered greater. The `sort` method then returns a new array object with the elements from the caller sorted in what would be ascending order if the return values from the block were the return values from simple calls to `<=>`.

## Integer#<=> ##

The `Integer#<=>` method makes a comparison based on numeric value between the calling integer and the argument in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, `1` if the caller is greater. If the object passed as argument cannot be compared to the caller, `<=>` returns `nil`.

If `sort` receives a `nil` return from `<=>`, this causes `sort` to throw an `ArgumentError`.

## String#<=> ##

The `String#<=>` method makes character-wise comparison between two strings based on ASCII character table order: the later the placement in the ASCII table, the greater the value. Character-wise comparison means that the characters at index `0` in the two strings are compared and if no difference is found then the characters at index `1` are compared and so on until a difference is found. If no difference is found up to the length of the shorter string, the longer string is considered greater. If no difference is found in equal-sized strings, they are considered equal. The `String#<=>` method makes this comparison between caller and argument in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, and `1` if the caller is greater. If the argument cannot be compared to the caller, the `<=>` method returns `nil`. 

If `sort` receives a `nil` return value from `<=>`, this causes `sort` to throw an `ArgumentError`. 

## Array#<=> ##

`Array#<=>` compares Array objects in an element-wise manner. The elements at index `0` of the two arrays are compared and if no difference is found then the elements at index `0` are compared and so on until a difference is found. If no difference is found up to the end of the shorter array then the longer array is considered greater. If no difference is found in equally-sized arrays, they are considered equal. `Array#<=>` makes this comparison between caller and argument in order to return a signal value: `-1` if the caller is lesser, `0` if they are equal, `1` if the caller is greater. If the argument object cannot be compared to the calling array, `Array#<=>` returns `nil`. These element comparisons are made using the `<=>` method proper to the elements being compared. If the `<=>` method call comparing individual elements finds that the elements cannot be compared, it returns `nil`, in which case the `Array#<=>` method also returns `nil`.

A `nil` return from the `<=>` method causes `sort` to throw an `ArgumentError`. 



## `Enumerable#sort_by` with a block



## `String#upto`



## `String#succ`





## pass-by-reference and *pass-by-value* ##

In a pass-by-value object passing strategy, a copy is made of the object passed to a method as argument and any changes to the object’s value within the method definition are actually being performed on a copy and will not affect the object that was passed as argument.

In a pass-by-reference object passing strategy, what is passed is a reference to the memory space of the object passed as argument. Any change to the object’s value within the method, including reassignment, will directly affect the object that was passed. A parameter variable in the method is a direct alias of the variable passed as argument.

In Ruby’s object passing strategy, sometimes called pass-by-reference-value, what is passed is a reference to an object, separate to any variable used as the argument that references that object. This is because Ruby variables do not contain objects, only pointers to objects elsewhere in memory. Thus, if an object provides mutating methods, its internal state in memory can be mutated within the method it has been passed into; but if the method parameter variable is reassigned, this reassignment only reassigns the parameter variable local to the method. Reassignment of a method parameter variable simply causes the variable local to the method to point to another object while the variable used as the argument to the invocation cannot be reassigned from within the method. It is only the object’s reference that has been passed, not a reference to a variable. Thus in Ruby, a local variable cannot be reassigned by being passed to a method as argument; the corresponding parameter variable is not an alias to it.

## The Call Stack

The call stack is a way of organizing memory such that Ruby can keep track of which method should currently have control and where to resume execution when that method returns. The call stack is a last-in-first-out data structure consisting of stack frames, each pertaining to a method invocation. When a method is called, Ruby updates the current stack frame with the point in the program at which the call was made and pushes a new stack frame to the call stack for the method that has been invoked. If that method calls another method, the point where control should resume is saved in the current frame and another stack frame is pushed to the stack. When the currently executing method returns, its frame is popped from the stack and execution resumes at the point it was called from.

If the number of stack frames exceeds the size of memory allocated to the call stack, a `SystemStackError` is thrown. Blocks, procs and lamdas all use the call stack similarly to methods.