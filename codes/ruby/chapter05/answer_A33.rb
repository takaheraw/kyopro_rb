# Input
n = gets.to_i
a = gets.split.map(&:to_i)

# Calculate XOR sum
xor_sum = a[0]
for i in 1...n
  xor_sum ^= a[i]
end

# Output
if xor_sum >= 1
  puts "First"
else
  puts "Second"
end
