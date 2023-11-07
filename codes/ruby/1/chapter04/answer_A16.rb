# 入力（A, B が 0 番目から始まっていることに注意）
n = gets.to_i
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)

# 動的計画法
dp = Array.new(n + 1)
dp[1] = 0
dp[2] = a[0]
(3..n).each do |i|
	dp[i] = [dp[i-1] + a[i-2], dp[i-2] + b[i-3]].min
end

# 出力
puts dp[n]
