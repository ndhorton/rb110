# Most frequently used words in a text

=begin
Notes:
require 'objspace'
ObjectSpace.memsize_of(some_object)
result[index..-1] = [match_arr,*result[1..a.size-2]

possibilities are:
result array size < 3 = (the following should cover the case of empty result array)
  iterate through each match_arr in result with index
    [if current occurrences is bigger than any of the stored occurences
    then insert before that stored occurence at index]
    if occurrences > match_arr occurences
      insert new_match_arr at index
      inserted_current_match = true
      break
  [otherwise insert at the end]
  unless inserted current match
    append new_match_arr to result
    inserted_current_match = true (probably redundant at this point)
result array size == 3
  iterate through each match_arr in result with index
    [if occurrences greater than any stored, then insert at index]
    if occurrences > match_arr occurrences
      insert new_match_arr at index
      Pop result
      break

Problem:
input: a string of text possibly with punctuation and line-breaks
output: an array of the three most-occuring words in descending order

rules:
  words are only letters and apostrophes
  words can have more than one apostrophe at any position so long as
    the apostrophe is not separated from letters by whitespace
  apostrophes on their own are not words
  matches should be case-insensitive
  words should be returned lowercase
  whitespace seperators of words, can include newlines

Examples and test cases:

Data structures:

create two-element arrays within the result array
containing word and count for that word
then transform the array into just the words

Algorithm:
Given a string, text
Set result := empty array
Iteratively scan a lowercase version of the text for groups of letters and apostrophes
  For each match
    If match doesn't contain letters
      Next iteration
    If any match_arr string in result == match
      Next iteration

    Set inserted_current_match := false
    Set word_count := count occurences in lowercase version of string
    Set new_match_arr := array containing current match and word_count
    If result array size < 3 (the following should cover the case of empty result array)
      iterate through each match_arr in result with index
        [if current occurrences is bigger than any of the stored occurences
        then insert before that stored occurence at index]
        if occurrences > match_arr occurences
          insert new_match_arr at index
          inserted_current_match = true
          break
      [otherwise insert at the end]
      unless inserted current match
        append new_match_arr to result
        inserted_current_match = true (probably redundant at this point)
    If result array size == 3
      iterate through each match_arr in result with index
        [if occurrences greater than any stored, then insert at index]
        if occurrences > match_arr occurrences
          insert new_match_arr at index
          Pop result
          break
Iterate through each match_arr in result
  Transform match_arr to only the string object element
Return result

=end
require 'pry-byebug'

def top_3_words(text)
  result = []
  lowercase_text = text.downcase
  lowercase_text.scan(/[a-z']+/) do |current_match|
    next unless current_match =~ /[a-z]/
    next if result.any? { |match_arr| match_arr.first == current_match }
    
    inserted_current = false
  
    occurrences = 0
    count_regex = /\b#{current_match}\b/
    lowercase_text.scan(count_regex) { occurrences += 1 }

    new_match_arr = [current_match, occurrences]

    if result.size < 3
      result.each_with_index do |match_arr, index|
        if occurrences > match_arr.last
          result.insert(index, new_match_arr)
          inserted_current = true
          break
        end
      end
      unless inserted_current
        result << new_match_arr
      end
    elsif result.size == 3
      result.each_with_index do |match_arr, index|
        if occurrences > match_arr.last
          result[index..-1] = [new_match_arr, *result[index..result.size - 2]]
          break
        end
      end
    end
  end
  result.map(&:first)
end

p (top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"])
p (top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"])
p (top_3_words("  //wont won't won't ") == ["won't", "wont"])
p (top_3_words("  , e   .. ") == ["e"])
p (top_3_words("  ...  ") == [])
p (top_3_words("  '  ") == [])
p (top_3_words("  '''  ") == [])
p (top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"])
