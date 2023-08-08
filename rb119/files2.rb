# readlines and similar manual operations

pathname = "#{__dir__}/test.txt"

# one liner with `File < IO::readlines`
lines1 = File.readlines(pathname)
p lines1

# IO::open with block
lines2 = []
File.open(pathname, 'r') do |file|
  until file.eof? 
    line = file.gets
    lines2 << line
  end
end

# IO::open without block
file = File.open(pathname, 'r')
lines3 = []
loop do
  break if file.eof?
  line = file.gets
  lines3 << line
end
file.close # must explicitly close file streams

p lines1 == lines2 # all three operations
p lines1 == lines3 # have had the same effect
