# def words_and_spaces(string)
#   string.scan(/\s+|\S+/)
# end
#
# def words_and_spaces(string)
#   string.split(/\b/)
# end
#
# p words_and_spaces("hello   and  \t\nwelcome")

def symbol_tally(string)
  char_tally = string.chars.tally
  char_tally.transform_keys { |key| key.to_sym }
end

str = 'april is the cruellest month, breeding lilacs out of the dead ground etc...'

p symbol_tally(str)
