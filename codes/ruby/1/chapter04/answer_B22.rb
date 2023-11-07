# 入力（A, B が 0 番目から始まっていることに注意）
N = gets.to_i
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

# 配列 dp の初期化
dp = [2_000_000_000] * N
dp[0] = 0

# 動的計画法
(0...N).each do |i|
  dp[i + 1] = [dp[i + 1], dp[i] + A[i]].min if i <= N - 2
  dp[i + 2] = [dp[i + 2], dp[i] + B[i]].min if i <= N - 3
end

# 出力
puts dp[N - 1]
