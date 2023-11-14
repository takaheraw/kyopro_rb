d  = gets.to_i
n  = gets.to_i
lr = Array.new(n) { gets.split.map(&:to_i) }

b = Array.new(d + 2, 0)

lr.each do |l, r|
  b[l] += 1
  b[r + 1] -= 1
end

answer    = Array.new(d + 2, 0)
answer[0] = 0

# 累積和
(1..d).each do |d|
  answer[d] = answer[d - 1] + b[d]
end

(1..d).each do |d|
  puts answer[d]
end
