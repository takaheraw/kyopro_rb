# 入力
n, q = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
l_r = Array.new(q) { gets.split.map(&:to_i) }

# 累積和の計算
s = Array.new(n + 1, 0)
(1..n).each do |i|
  s[i] = s[i - 1] + a[i - 1]
end

# 質問に答える
l_r.each do |l, r|
  puts s[r] - s[l - 1]
end
