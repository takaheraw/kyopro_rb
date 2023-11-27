n, w   = gets.split.map(&:to_i)
weight = Array.new(n + 1, 0)
value  = Array.new(n + 1, 0)
(1..n).each do |i|
  weight[i], value[i] = gets.split.map(&:to_i)
end

dp = Array.new(n + 1) { Array.new(w + 1, - 10**15) }
dp[0][0] = 0

(1..n).each do |i|
  (0..w).each do |j|
    dp[i][j] = if j < weight[i]
                 dp[i - 1][j]
               else
                 [dp[i - 1][j], dp[i - 1][j - weight[i]] + value[i]].max
               end
  end
end

puts dp[n][w]
