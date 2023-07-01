def fizzbuzz(upper_limit)
  divisible_by = -> divisor { -> m { m % divisor == 0 } }

  (1..upper_limit).map do |n|
    case n
    when divisible_by[15] then puts "fizzbuzz"
    when divisible_by[5]  then puts "buzz"
    when divisible_by[3]  then puts "fizz"
    else
      puts n
    end
  end
end

fizzbuzz(50)
