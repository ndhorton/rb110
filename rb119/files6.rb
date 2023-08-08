# Most important methods for text file reading
# (most, possibly all, of these inherit from IO class)
# Command injection (warned about in IO class) is less of a concern when dealing with
# File subclass; this is simply because it accesses and
# addresses files rather than necessarily executing commands
# read from an input stream (unless you then execute lines from the file)

# Strategy
# --------
# You want, whenever possible, to avoid free-floating File objects
# for now. As such, using class methods to return text or an array of lines
# of text is first choice for reading text files.
# so File.read or File.readlines, and these don't even need blocks.
# For writing, you can use File.write to write a whole string into a file at once
# without a block
# If you need to do more complicated write operations, or you need to read smaller
# pieces of a file at once (on very large files) you can use
# File.open { |file| with block } and the stream will be closed

# Class methods
# -------------


# File::foreach(path, sep = $/, **opts) { |line| block } -> nil
# File::foreach(path, limit, **opts) { |line| block } -> nil
# File::foreach(path, sep, limit, **opts) { |line| block } -> nil
# File::foreach(...) -> new Enumerator

# # calls block once for each successive line read from the file stream; closes stream
# # sep is the line separator
# # limit is an integer representing the maximum number of bytes (unless dealing
# # with multi-byte chars) returned for each line
