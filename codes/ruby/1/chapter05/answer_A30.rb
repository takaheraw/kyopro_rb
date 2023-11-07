def power(base, exponent, mod)
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

def division(numerator, denominator, mod)
  return (numerator * power(denominator, mod - 2, mod)) % mod
end

# Input
n, r = gets.split.map(&:to_i)
m = 1000000007

# Step 1: Calculate numerator
numerator = 1
for i in 1..n
  numerator = (numerator * i) % m
end

# Step 2: Calculate denominator
denominator = 1
for i in 1..r
  denominator = (denominator * i) % m
end
for i in 1..n-r
  denominator = (denominator * i) % m
end

# Step 3: Calculate the result
puts division(numerator, denominator, m)
