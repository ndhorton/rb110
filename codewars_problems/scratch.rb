def words_and_spaces(string)
  string.scan(/\s+|\S+/)
end

def words_and_spaces(string)
  string.split(/\b/)
end

p words_and_spaces("hello   and  \t\nwelcome")