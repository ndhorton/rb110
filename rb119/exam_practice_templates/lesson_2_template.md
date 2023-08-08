# Lesson 2 #

## Sorting ##

### 1 ###

```ruby
[2, 5, 3, 4, 1].sort
```



### 2 ###

```ruby
['c', 'a', 'e', 'b', 'd'].sort
```



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





### 5 ###

```ruby
[2, 5, 3, 4, 1].sort do |a, b|
  a <=> b
end
```



### 6 ###

```ruby
[2, 5, 3, 4, 1].sort do |a, b|
  b <=> a
end
```





### 7 ###

```ruby
[2, 5, 3, 4, 1].sort do |a, b|
  puts "a is #{a} and b is #{b}"
  a <=> b
end
```



### 8 ###

```ruby
['arc', 'bat', 'cape', 'ants', 'cap'].sort
```



### 9 ###

```ruby
[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort
```



### 10 ###

```ruby
['cot', 'bed', 'mat'].sort_by do |word|
  word[1]
end
```



### 11 ###

```ruby
people = { Kate: 27, john: 25, Mike:  18 }

people.sort_by do |_, age|
  age
end
```



## Other Methods that Call the `<=>` Method ##

### 1 ###

```ruby
[4, 3, 5, 2, 1].min
```



### 2 ###

```ruby
[4, 3, 5, 2, 1].min(2)
```



### 3

```ruby
ruminants = %w(llama Yak sheep Horse cow)

ruminants.min do |a, b|
  a.downcase <=> b.downcase
end
```



### 4 ###

```ruby
[4, 3, 5, 2, 1].max
```



### 5

```ruby
['a', 'f', 'd', 'l', 'z'].max(3)
```



### 6

```ruby
lizards = ['Iguana', 'basilisk', 'Gecko', 'Water dragon']

lizards.max do |a, b|
  a.downcase <=> b.downcase
end
```





### 7

```ruby
[4, 3, 5, 2, 1].minmax
```





### 8

```ruby
["Fortran", "Lisp", "Algol", "C", "Simula", "Smalltalk"].minmax do |a, b|
    a.size <=> b.size
end
```





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



## Nested Data Structures ###

### 1 ###

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2[1].upcase!

p arr2
p arr1
```



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
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```



### 5 ###

```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```



6

```ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
```



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



