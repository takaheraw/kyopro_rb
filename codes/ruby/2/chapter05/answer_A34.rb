n, x, y = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

grundy = Array.new(100_001)
100_001.times do |i|
  transit = [false, false, false]
  transit[grundy[i - x]] = true if i >= x
  transit[grundy[i - y]] = true if i >= y

  grundy[i] = if !transit[0]
                0
              elsif !transit[1]
                1
              else
                2
              end
end

xor_sum = 0
n.times do |i|
  xor_sum ^= grundy[a[i]]
end

if xor_sum >= 1
  puts 'First'
else
  puts 'Second'
end
