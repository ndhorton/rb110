pathname = "#{__dir__}/test.txt"

text = File.read(pathname)
p text.class == String

lines_of_text = File.readlines(pathname)
puts lines_of_text

closed_file = File.open(pathname) do |file| # here, the return value is a closed file
  file.each { |line| p line }               # this is because the return value of IO::open
end # with a block will be the return value of the block and the return value of the `IO#each_line` method
# (the last expression in the block) is a reference to the calling IO/File object `file`;
# here, that File object is closed by `open` before the method returns, so our return value is
# a File object whose iostream and FD have been closed.
# You can reopen a File object but you need to respecify the pathname and, at the system level,
# the object will be opening a new iostream and a opening a new (though possibly numerically the same 
# if there are no other streams being opened within our process, etc...) file descriptor even though
# the Ruby object identity remains the same. So the Ruby object id is retained but the actual process
# state is different. Essentially, we are operating on/with File objects rather than directly on raw FDs
# as in C. (This doesn't mean there is no need to call `close` on File objects with open file streams
# once you are done with them, as a file stream needs an FD in a Ruby process like any other process
# and they are a finite resource, especially when dealing with an arbitrarily large number of files
# as web backend code may well be doing)

puts closed_file.object_id

closed_file.reopen(pathname, 'r')

puts closed_file.object_id

closed_file.each_line { |line| print(line[0], ' ') }

closed_file.close

i = 0
hmm = File.open(pathname, 'r') do |file| # hmm will be the block return value (this method is not iterative)
  i += 1
end
puts hmm
