# 入力
n, w = gets.split.map(&:to_i)
weights = [nil] * (n + 1)
values = [nil] * (n + 1)
(1..n).each do |i|
  weights[i], values[i] = gets.split.map(&:to_i)
end

# 動的計画法
dp = Array.new(n + 1) { Array.new(100_001, 10**15) }
dp[0][0] = 0
(1..n).each do |i|
  (0..100_000).each do |j|
    if j < values[i]
      dp[i][j] = dp[i - 1][j]
    elsif j >= values[i]
      dp[i][j] = [dp[i - 1][j], dp[i - 1][j - values[i]] + weights[i]].min
    end
  end
end

# 出力
answer = 0
(0..100_000).each do |i|
  if dp[n][i] <= w
    answer = i
  end
end

puts answer
