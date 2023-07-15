# Input
n, x, y = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

grundy = Array.new(100001)
(0...100001).each do |i|
  transit = [false, false, false]
  if i >= x
    transit[grundy[i-x]] = true
  end
  if i >= y
    transit[grundy[i-y]] = true
  end

  if !transit[0]
    grundy[i] = 0
  elsif !transit[1]
    grundy[i] = 1
  else
    grundy[i] = 2
  end
end

# Output
xor_sum = 0
n.times do |i|
  xor_sum ^= grundy[a[i]]
end
if xor_sum >= 1
  puts "First"
else
  puts "Second"
end
