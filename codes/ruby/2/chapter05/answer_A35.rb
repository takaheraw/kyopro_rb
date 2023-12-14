n = gets.to_i
a = gets.split.map(&:to_i)

dp = Array.new(n + 1) { Array.new(n + 1, 0) }

(1..n).each do |i|
  dp[n][i] = a[i - 1]
end

(1...n).to_a.reverse.each do |i|
  (1..i).each do |j|
    dp[i][j] = if i.odd?
                 [dp[i + 1][j] || 0, dp[i + 1][j + 1] || 0].max
               else
                 [dp[i + 1][j] || 0, dp[i + 1][j + 1] || 0].min
               end
  end
end

puts dp[1][1]
