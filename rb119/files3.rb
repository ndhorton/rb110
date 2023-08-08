# read text as one string using IO::read

pathname = "#{__dir__}/test.txt"

text = File.read(pathname)
p text


# a manual version
text2 = ''
File.open(pathname, 'r') do |file|    # 'r' is default so not necessary here really
  text2 << file.gets until file.eof?
end

p text2 == text

