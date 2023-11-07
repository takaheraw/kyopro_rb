# 入力
t = gets.chomp.to_i
n = gets.chomp.to_i
l = []
r = []
n.times do
  input = gets.chomp.split.map(&:to_i)
  l << input[0]
  r << input[1]
end

# "前の時刻との差" に加算
b = Array.new(t+1, 0)
n.times do |i|
  b[l[i]] += 1
  b[r[i]] -= 1
end

# 累積和をとる
answer = Array.new(t+1)
answer[0] = b[0]
(1..t).each do |d|
  answer[d] = answer[d-1] + b[d]
end

# 出力
(t-1).times do |d|
  puts answer[d]
end
