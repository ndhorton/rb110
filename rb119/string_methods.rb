# String Methods

# size - returns the count of characters in self

str = 'hello'
p str.size # => 5

# count -returns the total number of characters in self that are specified by the
      #  given Character Selectors

a = "hello world"
a.count("lo") # => 5 ... 3 * 'l' + 2 * 'o'

  # Character Selectors used by:
    # String#tr, #tr!, #tr_s, #tr_s!
    # String#count
    # String#delete, #delete!
    # String#squeeze, #squeeze!

  # Character selector metachars:
    # ^ (leading) NOT operator for the chars following
    # - (between two other chars) defines a range of characters
    # \ acts as escape for a caret, hypen or another backslash
  
  # Multiple Character Selectors used by all above methods
  # except `tr` and its relatives
  # The given selectors are formed into a single selector consisting of only
  # those characters common to *all* of the given selectors (the intersection of
  # the arguments)

# include? - returns `true` if calling string contains substring given as argument,
          #  otherwise `false`

str = "hello world"
p str.include?('hell') # => true

# slice - non-destructively returns a slice from the calling string according to the
        # intersection of the arguments
        #
        # a slice of a string is a substring that is selected by certain criteria
        # the String#[] method is an alias for `slice`.
        # The argument forms are:
          # string[index] - returns a single character as a new string, `nil` if out-of-bounds
          # string[start, length] - returns `length` chars starting from index `start`
          # string[range] - returns slice indicated by range of indexes
            # Special cases:
              # [start, length] returns `nil` if `length` is negative
              # [start, length] and [range] return `nil` if totally out-of-bounds but
              # return an empty string if `start` or the first index of the range are
              # equal to array.size. [range] returns an empty string if the start of the
              # range is greater than the end of the range.
          # string[regexp, capture = 0] - when capture = 0, returns first substring that
          # matches regexp. If `capture` argument is not 0, returns the indexed or named
          # capture group specified (index as Integer, name as Symbol or String)
          # string[substring]

str = 'hello world'
p str.slice(4)                  # => "o"
p str.slice(0, 4)               # => "hell"
p str.slice(0..4)               # => "hello"
p str.slice(/w.*/)              # => "world"
p str.slice(str.size, 1 )       # => ""
p str.slice(str.size..str.size) # => ""
p str.slice(str.size + 1, 1)    # => nil
# slice! - works similarly to `slice` except destructively removes and returns slice as new
        #  string object. The calling string is mutated to be missing the slice
        # So important to be aware of destructive side-effect AND significant return value
name = "John Person 92837423"
id_number = name.slice!(/\s\d+/)
p name
p id_number.to_i 


# strip - returns a copy of the receiver with leading and trailing whitespace removed
      #  no parameters, no block use 
name = "   John Surname     \n"
p name.strip
p name

# strip! - mutates the caller to destructively remove leading and trailing whitespace
        #  returns reference to self if changes are made, `nil` if no changes
name = "\n   Johan Person  \t\t   "
name.strip!
p name

# reverse - returns a new string with the characters in self in reverse order
string = 'live'
p string.reverse

# reverse! - returns self with its characters destructively reversed
string = 'live'
string.reverse!
p string

# upcase - non-destructively returns a new string object whose characters are those of the calling string
          # but with all letters in uppercase 
message = "I'm not shouting"
p message.upcase

# upcase! - destructively replaces all lowercase letters in the calling string with uppercase letters
message = "I'm not shouting"
message.upcase!
p message

# downcase - returns a new string containing the characters from the caller except with
            # all uppercase letters replaced with lowercase
str = 'TURN IT DOWN'
p str.downcase

# downcase! - destructively changes any uppercase letters in the calling string to lowercase
str = 'TURN IT DOWN'
str.downcase!
p str

# concat - destructively concatenates each string passed as argument to the calling string
str = 'hello'
str.concat(' world')
p str

# split - returns an array of substrings of self that are the result of splitting self at
#         each occurence of the given field seperator. If no field separator is given
#         and global variable `$;` is set to `nil`, as is default, then the field
#         separator will default to whitespace. If a positive integer limit is given as a second
#         argument, the number of substring splits returned will be limited to that number.
#         If 0 is given as limit, this is the same as default behaviour, which is no limit
#         and any trailing empty strings caused by the split will be suppressed. If a negative
#         limit is given, there is no limit but trailing empty substrings are not suppressed.
#         If the field seperator is a regex, the split occurs at each instance of a match.
#         `split` can be called with a block its behaviour is significantly different: the block is
#         called once for each substring, which is passed to the block parameter; 
#         `split` with block ignores the return value
#         of the block and returns the calling string unaltered

str = 'hello world'
p str.split # => ["hello", "world"]
p str.split('l') # => ["he", "", "o wor", "d"]
p str.split('l', 2) # => ["he", "lo world"]
p 'ababaaaa'.split('a', -1) # => ["", "b", "b", "", "", ""]

existing_arr = []
str.split { |substring| existing_arr << substring.capitalize }

# chars - returns an array of the characters in self
p 'stars'.chars # => ["s", "t", "a", "r", "s"]
# compare calling `split('')`
p 'stars'.split('') # => ["s", "t", "a", "r", "s"]

# *** note on related String methods `partition` and `rpartition` ***
# `rpartition` behaves like `partition` except the middle string in the returned array
# is the *last possible match* instead of the first match. This explains why
p 'hello'.partition(/l+/)  # returns => ["he", "ll", "o"], but
p 'hello'.rpartition(/l+/) # returns => ["hel", "l", "o"]
# The docs are somewhat misleading on this point, suggesting that `rpartition` simply searches
# from back to front, which is not consistent with these return values.

# freeze - (for docs see Object#freeze) Prevents further modification to object. A RuntimeError
#          will be raised if modification is attempted.
#          An object cannot be unfrozen though an unfrozen copy can be made 
str = 'the plums that were in the icebox'
str.freeze
# str.replace('so sweet and so cold') # => raises FrozenError
unfrozen_str = str.dup # can also use `+str` instead of `str.dup`
unfrozen_str.replace('so sweet and so cold') # => 'so sweet and so cold'

# replace - destructively replaces the string value of the calling String object with the value of
#           the String object passed as argument. 
str = 'hello'
p str.object_id
str.replace('goodbye')
p str
p str.object_id

# upto - with a block given, calls the block with each String value returned by successive calls
#        to String#succ; the sequence terminates when the string passed as argument is reached.
#        If a second argument with a truthy value is given, the range will be exclusive and
#        iteration will halt one step before the string passed as argument is reached.
#        Returns a reference to the caller

'a'.upto('z') { |str| print(str) } # prints the alphabet in lowercase
puts