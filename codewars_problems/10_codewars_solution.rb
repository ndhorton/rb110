# Solution by rch.lee on Codewars
# Uses no regex
# ===============================

# Code:
# HELPER METHOD
def clean(str)
  clean_str = ""
  str.chars.each do |curr_char|
    if ("a".."z").include?(curr_char) || curr_char == "'"
      clean_str << curr_char 
    end
  end

  if clean_str.chars.all?("'")
    clean_str = ""
  end

  clean_str
end

# MAIN METHOD
# - create a method that takes one argument, a String 
def top_3_words(str)
  # - create an Array to hold topmost words
  top_words = []

  # - create an Array to hold all words in lowercase
  str_words = []
  str.split.each do |word|
    str_words << clean(word.downcase)
  end

  # - create a Hash to hold:
  #   - key: word
  #   - value: count
  word_count_hsh = {}

  # - iterate through Array of lowercase words and update Hash values 
  str_words.each do |word|
    if word_count_hsh.has_key?(word)
      word_count_hsh[word] += 1
    else
      word_count_hsh[word] = 1
    end
  end

  # - iterate through all value in Hash and sort by frequency of occurance
  word_count_sorted_arr = word_count_hsh.sort_by do |word, count|
    count
  end
  word_count_sorted_hsh = word_count_sorted_arr.reverse.to_h

  # - add top 3 words to the Array holding topmost words
  top_three_arr = []
  word_count_sorted_hsh.each_with_index do |(word, count), idx|
    if idx < 3 
      top_three_arr << word
    end
  end

  # - return the Array holding topmost words
  top_three_arr.delete("")
  top_three_arr
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
  