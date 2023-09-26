# 入力（配列 A, B は 0 番目から始まることに注意！）
N = gets.to_i
A = Array.new(N + 1)
B = Array.new(N + 1)
A[0] = nil
B[0] = nil
gets.split.map(&:to_i).each_with_index { |num, i| A[i + 1] = num }
gets.split.map(&:to_i).each_with_index { |num, i| B[i + 1] = num }

# 配列の初期化
dp = Array.new(N + 1, -(10 ** 9))
dp[1] = 0

# 動的計画法
(1...N).each do |i|
	dp[A[i]] = [dp[A[i]], dp[i] + 100].max
	dp[B[i]] = [dp[B[i]], dp[i] + 150].max
end

# 出力
puts dp[N]
