n, q = gets.split.map(&:to_i)
ar   = gets.split.map(&:to_i)
lr   = Array.new(q) { gets.split.map(&:to_i) }

s = Array.new(n + 1, 0)
(1..n).each do |i|
  s[i] = s[i - 1] + ar[i - 1]
end

lr.each do |l, r|
  puts s[r] - s[l - 1]
end
