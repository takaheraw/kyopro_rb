# 入力
N = gets.to_i
H = gets.split.map(&:to_i)

# 配列の準備
dp = Array.new(N)

# 動的計画法
dp[0] = 0
dp[1] = (H[0] - H[1]).abs
(2...N).each do |i|
  dp[i] = [dp[i-1] + (H[i-1] - H[i]).abs, dp[i-2] + (H[i-2] - H[i]).abs].min
end

# 出力
puts dp[N-1]
