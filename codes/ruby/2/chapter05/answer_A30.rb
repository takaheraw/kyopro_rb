def power(base, exponent, mod)
  power_value = base
  result = 1
  30.times do |i|
    divisor = 2**i
    result = (result * power_value) % mod if (exponent / divisor).odd?
    power_value = (power_value * power_value) % mod
  end
  result
end

def division(numerator, denominator, mod)
  (numerator * power(denominator, mod - 2, mod)) % mod
end

n, r = gets.split.map(&:to_i)
m = 1_000_000_007

numerator = 1
(1..n).each do |i|
  numerator = (numerator * i) % m
end

denominator = 1
(1..r).each do |i|
  denominator = (denominator * i) % m
end
(1..n - r).each do |i|
  denominator = (denominator * i) % m
end

puts division(numerator, denominator, m)
