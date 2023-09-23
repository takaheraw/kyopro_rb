# 入力
N, W = gets.split.map(&:to_i)
w = Array.new(N + 1, 0)
v = Array.new(N + 1, 0)
for i in 1..N do
  w[i], v[i] = gets.split.map(&:to_i)
end

# 配列 dp の定義・初期化
dp = Array.new(N + 1) { Array.new(W + 1, -10**15) }
dp[0][0] = 0

# 動的計画法
for i in 1..N do
  for j in 0..W do
    if j < w[i]
      dp[i][j] = dp[i - 1][j]
    else
      dp[i][j] = [dp[i - 1][j], dp[i - 1][j - w[i]] + v[i]].max
    end
  end
end

# 出力
puts dp[N][W]
