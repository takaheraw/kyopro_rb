n = gets.to_i
a = gets.split.map(&:to_i)

xor_sum = a[0]
(1...n).each do |i|
  xor_sum ^= a[i]
end

if xor_sum >= 1
  puts 'First'
else
  puts 'Second'
end
