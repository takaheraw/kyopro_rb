n = gets.to_i
t = []
d = []
n.times do
  ti, di = gets.split.map(&:to_i)
  t << ti
  d << di
end

# D の小さい順に並べ替える
problems = d.zip(t).sort
d, t = problems.map { |pair| pair[0] }, problems.map { |pair| pair[1] }

# 動的計画法：前準備
max_d = d.max
dp = Array.new(n + 1) { Array.new(max_d + 1, -1_000_000_000) }

# 動的計画法
dp[0][0] = 0
(1..n).each do |i|
  (0..max_d).each do |j|
    if j > d[i - 1] || j < t[i - 1]
      dp[i][j] = dp[i - 1][j]
    else
      dp[i][j] = [dp[i - 1][j], dp[i - 1][j - t[i - 1]] + 1].max
    end
  end
end

# 答えを求めて出力
answer = dp[n].max
puts answer
