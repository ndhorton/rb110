require 'test/unit'

class FibonacciTests < Test::Unit::TestCase
  def test_fibonacci
    assert(fibonacci(3) == 2, "Test first non-base case Fibonacci number")
    assert_equal(fibonacci(3), 2, "Test first non-base case Fibonacci number")
    assert(fibonacci(30) == 832040, "Test higher input")
  end
end

class PoemTests < Test::Unit::TestCase
  def test_poem_class_hangs_on_to_data
    the_text = <<-_HEREDOC_
    April is the cruellest month, breeding
    Lilacs out of the dead ground, mixing
    Memory and desire, stirring
    Dull roots with Spring rain.
    _HEREDOC_
    waste_land = Poem.new(
      "Eliot, Thomas Stearn",
      "The Waste Land",
      1922,
      the_text
    )

    assert(waste_land.title == 'The Waste Land', "test Poem class retains title")
    assert(waste_land.author == "Eliot, Thomas Stearn", 'test Poem class retains author')
    assert(waste_land.date == 1922, "test Poem class retains date")
    assert(waste_land.text == the_text, "test Poem class retains text of poem")
  end
end

class Poem
  attr_reader :author
  attr_reader :title
  attr_reader :date
  attr_reader :text
  def initialize(author, title, date, text)
    @author = author
    @title = title
    @date = date
    @text = text
  end
end

def fibonacci(n)
  return 1 if n < 3
  fibonacci(n - 1) + fibonacci(n - 2)
end
