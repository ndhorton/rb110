write_path = "#{__dir__}/"

write_pathname = write_path + "testwrite.txt"

read_pathname = "#{__dir__}/test.txt"

# reading text into buffer string, writing whole string at once to writefile
buffer = File.read(read_pathname)
File.open(write_pathname, 'w') do |file|
  file.write(buffer)
end

# writing lines from an array
write_pathname = write_path + "testwrite2.txt"
line_buffer = buffer.scan(/^.*$/)
File.open(write_pathname, 'w') do |file|
  line_buffer.each { |line| file.puts(line) }
end

# without using existing buffer, nested file blocks with `open` write and `foreach` read
write_pathname = write_path + "testwrite3.txt"
File.open(write_pathname, 'w') do |writefile|
  File.foreach(read_pathname) do |line|
    writefile.puts(line)
  end
end

# using a loop within two-level nested iterators
File.open(read_pathname, 'r') do |read_file|
  File.open(write_path + "testwrite4.txt", 'w') do |write_file|
    write_file.puts(read_file.gets) until read_file.eof?
  end
end

# probably easiest way to copy a text file
File.open("#{__dir__}/testwrite5.txt", 'w') do |file|
  file.write(File.read(read_pathname))
end

number_of_bytes_written = 
  File.write("#{__dir__}/testwrite6.txt", File.read(read_pathname))
p number_of_bytes_written
