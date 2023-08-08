

odds = arr.select { |number| number.odd? }


=begin

Select only the odd integers from arr and place in new array, odds

Set odds := empty array
Iterate over each number in arr
  If number is odd
    Append number to odds


=end

words = sentence.split

# Split sentence on whitespace and store substrings in new array, words

capitalized_words = words.map { |word| word.capitalize }

=begin

Transform words array to new array of new strings so that
  each tranformed string is capitalized,
Store new array as capitalized_words

Transform words array to a new array of new strings such that 
  for each new transformed string element:
    only the first character is uppercase, the rest lowercase
    non-alphabetic characters are left as they are
Store the new array as capitalized_words

Set capitalized_words := empty array
Iterate through each word in words
  Create new string based on word so that
    if first letter of word is lowercase, change to uppercase
    change all remaining letters to lowercase
  Append new string object to capitalized_words

=end


PROBLEM
---------------- 
INPUT:
OUTPUT:

RULES:
- ...

EXAMPLES
----------------


DATA STRUCTURES
----------------


ALGORITHM
----------------


=begin
Write a method that takes an array of consecutive letters as input and returns the missing letter.

p determine_missing_letter(['a','b','c','d','f']) == 'E' 
p determine_missing_letter(['o','q','r','s']) == 'P'
p determine_missing_letter(['H','J','K','L']) == 'i'
p determine_missing_letter([]) == []
=end

=begin

SAMPLE PEDAC TEMPLATE #2

PROBLEM
---------------- 
- Goal: understand what you're being asked to do
  - Read the problem description
  - Identify expected input and output
  - Establish rules/requirements/define the boundaries of the problem
  - Ask clarifying questions
  - Take your time on this step!


INPUT: Array object with individual strings at each indices
OUTPUT: String object (single character)

RULES:
- 
- if an empty array is passed, the method should return an empty array
- All but one array elements should be consecutive letters, and there should be a gap of only one letter between non-consecutive letters
- The expected output has the opposite case as the strings in the array that is passed in

EXAMPLES/ MODELING
----------------
- Goal: further expand and clarify understanding about what you're being asked to do 
  - Use examples/test cases to confirm or refute assumptions made about the problem in the previous step

['a','b','c','d','f']
a b c d e f
=> e
=> 'E' 

['H','J','K','L']
h i j k l
=> i
=> 'i'


[]
=> []


DATA STRUCTURES
----------------
- Goal: begin to think logically about the problem
  - What data structures could we use to solve this problem?
    - What does our data look like when we get it? (input)
    - What does our data look like when we return it? (output?)
    - What does our data need to look like in the intermediate steps?

Array

input: array
inbetween: array
output: string

ALGORITHM
----------------
- Goal: write out steps to solve the given problem in plain English
  - A logical sequence of steps for accomplishing a task/objective
  - Start high level, but make sure you've thought through and have provided sufficient detail for working through the most difficult parts of the problem
  - Stay programming-language-agnostic
  - Can create substeps for different parts or separate concerns into a helper method
  - You can (and should) revisit your algorithm during the implementation stage if you need to refine your logic
  - Before moving onto implementing the algorithm, check it against a few test cases
- - - - 

If given an empty array return an empty array

Initialize array object of consecutive letters with same starting and ending letters (0..end) as input array 

Compare each letter of the created array object and the given array object.
  - How to compare each letter?
    -
  - if they are the same do nothing
  - otherwise break or use the letter as the missing letter

Change the case of the missing letter to be the opposite

Return the missing letter

=end


