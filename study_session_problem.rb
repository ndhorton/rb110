def prime?(n)
  return false if n < 2 # 1 is a special case
  (2...n/2).each do |divisor| # you only need to check factors up to n / 2 (integer division)
    return false if n % divisor == 0
  end
  true
end

def odd_not_prime(limit)
  selected_numbers = []
  
  current_integer = 1
  1.step(limit, 2) do |current_integer|
    selected_numbers << current_integer unless prime?(current_integer)
    current_integer += 2
  end
  
  selected_numbers.size
end

p odd_not_prime(15) == 3
p odd_not_prime(48) == 10
p odd_not_prime(82) == 20
