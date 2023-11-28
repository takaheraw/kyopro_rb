s = gets.chomp
t = gets.chomp
n = s.length
m = t.length

dp = Array.new(n + 1) { Array.new(m + 1, 0) }

dp[0][0] = 0
(1..n).each do |i|
  (1..m).each do |j|
    dp[i][j] = if s[i - 1] == t[j - 1]
                 [dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1] + 1].max
               else
                 [dp[i - 1][j], dp[i][j - 1]].max
               end
  end
end

puts dp[n][m]
