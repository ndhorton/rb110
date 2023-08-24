# Typoglycemia Generator

=begin
Notes:
Does 'ignore capitalization' mean the string should be sorted case-insensitive?

Problem:
input: a string
output: a typoglycemic string

rules:
  for each word, first and last characters remain in place
  for each word, punction remains in place
  the letters in the word other than these should be sorted alphabetially
  if there is punctuation that breaks up a words such that letter on both
    sides need to be sorted alphabetically, they should be sorted all together
  if the word begins with a non-letter character, the first letter character
    should not be sorted; the same goes for any special chars at the end of the
    word
  punctuation is limited to: w%( - ' , . )
  words are separated only be a single space

Examples and test cases:

s h a n ' t
0 1 2 3 4 5

Data structures:
need to do sorting as array of char-strings

Algorithm:

split into words
create an empty string called scrambled
iterate for each word
  create new string with only the letters
  remove first and last
  convert to lowercase
  split into chars
  sort the chars
  join
  prepend the first letter again
  append the last
  Set result := empty string
  Iterate from first to last index character the orginal string
    if the current char is a non-letter char
      append the current char to the result string
    else
      destructive remove first char from sorted string
        and append to the result string
  Append result to scrambled
Join result words with a space separator

=end

def scramble_words(text)
  words = text.split
  scrambled = words.map do |word|
    result = ''
    characters = word.chars
    letters = characters.select { |char| ('a'..'z').cover?(char.downcase) }
    first = letters.shift
    last = letters.pop
    letters.sort!
    letters.unshift(first) if first # modifiers aren't actually necessary
    letters.push(last) if last      # because join ignores `nil` elements
    characters.each do |char|
      if ('a'..'z').cover?(char.downcase)
        result << letters.shift
      else
        result << char
      end
    end
    result
  end
  scrambled.join(' ')
end

p scramble_words('professionals') == 'paefilnoorsss' #, 'The first and last letters of a word should reamin in place with the inner letters sorted')
p scramble_words('i') == 'i' #, 'Must handle single charater words')
p scramble_words('') == '' #, 'Must handle empty strings')
p scramble_words('me') == 'me' #, 'Must handle 2 charater words')
p scramble_words('you') == 'you' #, 'Must handle 3 charater words')
p scramble_words('card-carrying') == 'caac-dinrrryg' #, 'Only spaces separate words and punctuation should remain at the same place as it started')
p scramble_words("shan't") == "sahn't" #, 'Punctuation should remain at the same place as it started')
p scramble_words('-dcba') == '-dbca' #, 'Must handle special character at the start')
p scramble_words('dcba.') == 'dbca.' #, 'Must handle special character at the end')
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth." #, 'Must handle a full sentence')

# 33:35
