# 入力
d = gets.to_i
n = gets.to_i
l_r = Array.new(n) { gets.split.map(&:to_i) }

# 前日比に加算
b = Array.new(d + 2, 0)

l_r.each do |l, r|
  b[l] += 1
  b[r + 1] -= 1
end

# 累積和をとる
answer = Array.new(d + 2, 0)
answer[0] = 0

(1..d).each do |d|
  answer[d] = answer[d - 1] + b[d]
end

# 出力
(1..d).each do |d|
  puts answer[d]
end
