def calculate_remainder(base, exponent, mod)
  power_value = base
  result = 1
  for i in 0...30
    divisor = 2 ** i
    if (exponent / divisor) % 2 == 1
      result = (result * power_value) % mod 
    end
    power_value = (power_value * power_value) % mod
  end
  return result
end

# input
base, exponent = gets.split.map(&:to_i)

# output
puts calculate_remainder(base, exponent, 1000000007)
