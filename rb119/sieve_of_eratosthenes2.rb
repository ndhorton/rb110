# Sieve of Eratosthenes (Part 2)

# pseudocode from wikipedia - 2023-05-28

# algorithm Sieve of Eratosthenes is
#   input: an integer n > 1
#   output: all prime numbers from 2 through n

#   let A be an array of Boolean values, indexed by integers 2 to n
#   initially all set to true
#   Algorithm did not mention but you need to set sieve[0] and sieve[1] to false
#   if the indexes corresond to the numbers

#   for i = 2, 3, 4, ..., not exceeding sqrt(n) do
#     if A[i] is true
#       for j = (i ** 2), (i ** 2) + i, (i ** 2) + 2i, ..., not exeeding n do
#         set A[j] := false
  
#   return all i such that A[i] is true

def new_sieve(limit)
  sieve = Array.new(limit, true)
  sieve[0] = nil
  sieve[1] = nil
  sieve
end

def eratosthenes(limit)
  return [] if limit < 2
  sieve = new_sieve(limit)

  (2..Math.sqrt(limit)).each do |i|
    if sieve[i]
      factor = 0
      loop do
        break if (i ** 2) + (i * factor) > limit
        j = (i ** 2) + (i * factor)
        sieve[j] = false
        factor += 1
      end
    end
  end

  primes = []
  sieve.each_with_index { |n, index| primes << index if n }
  primes
end

p eratosthenes(100) == [
  2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37,
  41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97
]
