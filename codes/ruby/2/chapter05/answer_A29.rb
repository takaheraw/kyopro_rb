def calculate_remainder(base, exponent, mod)
  power_value = base
  result = 1
  30.times do |i|
    divisor = 2**i
    result = (result * power_value) % mod if (exponent / divisor).odd?
    power_value = (power_value * power_value) % mod
  end
  result
end

base, exponent = gets.split.map(&:to_i)

puts calculate_remainder(base, exponent, 1_000_000_007)
