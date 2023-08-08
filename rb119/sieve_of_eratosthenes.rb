# Sieve of Eratosthenes

=begin

Problem: implement Sieve of Eratosthenes as a method that accepts
an integer, limit, and returns an array of every prime from 2 to limit

Examples:

all_primes_upto(100) == [
  2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 
  41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97
]

DS: an array to act as a sieve
another array to contain only the primes
The sieve will have the composite numbers marked as nil
to facilitate boolean evaluation

Algorithm:

SUBPROCESS new_sieve(limit)
  Set sieve := empty array
  Iterate for each number from 0 to limit
    append number to sieve
  sieve[0] = nil (mark numbers below first prime as nil)
  sieve[1] = nil
  return sieve

SUBPROCESS next_prime(sieve, current_prime)
  Iterate through each number in sieve
    if number && number > prime
      return number
  return current_prime

Given an integer, limit
If limit < 2
  return empty array
Set sieve := SUBPROCESS new_sieve(limit)

prime = 2      (first prime)
Iterate, breaking if prime * 2 > limit
  factor = 2     (factor of first multiple)
  Iterate, breaking if factor * prime > limit
    sieve[factor * prime] = nil
    factor += 1
  new_prime = next_prime(sieve, prime)
  if new_prime == prime
    break
  prime = new_prime
primes = select non-zero numbers from sieve
return primes  

=end

require 'prime'

def new_sieve(limit)
  sieve = []
  (0..limit).each { |n| sieve << n }
  sieve[0] = nil
  sieve[1] = nil
  sieve
end

def next_prime(sieve, current_prime)
  sieve.each do |number|
    if number && number > current_prime
      return number
    end
  end
  return current_prime
end

def all_primes_upto(limit)
  return [] if limit < 2
  sieve = new_sieve(limit)
  prime = 2

  loop do
    factor = 2
    break if factor * prime > limit

    loop do
      break if factor * prime > limit
      sieve[factor * prime] = nil
      factor += 1
    end

    new_prime = next_prime(sieve, prime)
    break if new_prime == prime
    prime = new_prime
  end

  sieve.select { |n| n }
end

p all_primes_upto(100) == [
  2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 
  41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97
]

primes_upto_10000 = all_primes_upto(10000)

primes_upto_10000.each do |n|
  puts "Something went wrong" unless Prime.prime?(n)
end
