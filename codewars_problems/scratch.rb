def all_intersections(string1, string2)
  characters1 = string1.chars
  characters2 = string2.chars
  result = []
  characters1.each do |char1|
    characters2.each do |char2|
      if char1 == char2
        result << char1
      end
    end
  end
  result
end