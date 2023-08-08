# Ruby Basics #

## Loops 1 ##

### 1 ###

```ruby
loop do
  puts 'Just keep printing...'
  break
end
```



### 2 ###

```ruby
loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break
  end

  break
end

puts 'This is outside all loops.'
```



### 3 ###

```ruby
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end
```



### 4 ###

```ruby
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == 'yes'
  puts 'Incorrect answer. Please answer "yes".'
end

```



### 5 ###

```ruby
say_hello = true
count = 0

while say_hello
  puts 'Hello!'
  count += 1
  say_hello = false if count == 5
end
```



### 6 ###

```ruby
numbers = []

while numbers.size < 5
  numbers << rand(100)
end

puts numbers

```



### 7 ###

```ruby
count = 1

until count > 10
  puts count
  count += 1
end
```





### 8 ###

```ruby
count = 0

until count == numbers.size
  puts numbers[count]
  count += 1
end
```



### 9 ###

```ruby
for i in 1..100
  puts i
end
```



### 10 ###

```ruby
friends = ['Sarah', 'John', 'Hannah', 'Dave']

for friend in friends
  puts "Hello, #{friend}!"
end
```



## Loops 2 ##

### 1 ###

```ruby
count = 1

loop do
  if count.even?
    puts "#{count} is even!"
  else
    puts "#{count} is odd!"
  end

  break if count == 5
  count += 1
end
```



### 2 ###

```ruby
loop do
  number = rand(100)
  puts number

  if number.between?(0, 10)
    break
  end
end
```



### 3 ###

```ruby
process_the_loop = [true, false].sample

if process_the_loop
  loop do
    puts "The loop was processed!"
    break
  end
else
  puts "The loop wasn't processed!"
end
```



### 4 ###

```ruby
loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i

  if answer == 4
    puts "That's correct!"
    break
  end

  puts 'Wrong answer. Try again!'
end
```



### 5 ###

```ruby
numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i

  numbers.push(input)
  break if numbers.size == 5
end
puts numbers
```



### 6 ###

```ruby
names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift
  break if names.empty?
end
```



### 7 ###

```ruby
5.times do |index|
  puts index
  break if index == 2
end
```



### 8 ###

```ruby
5.times do |index|
  puts index
  break if index == 4
end
```



### 9 ###

```ruby
5.times do |index|
  puts index
  break if index < 7
end
```



### 10 ###

```ruby
number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end
```



### 11 ###

```ruby
number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  next unless number_a == 5 || number_b == 5

  puts '5 was reached!'
  break
end

```



### 12 ###

```ruby
def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end
```

