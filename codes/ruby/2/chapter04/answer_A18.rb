n, s = gets.chomp.split.map(&:to_i)
a = gets.chomp.split.map(&:to_i)

dp = []
(0..n).each do |i|
  dp << []
  (0..s).each do |j|
    dp[i][j] = nil
  end
end
dp[0][0] = true
(1..s).each do |j|
  dp[0][j] = false
end

(1..n).each do |i|
  (0..s).each do |j|
    dp[i][j] = if j < a[i - 1]
                 dp[i - 1][j]
               else
                 dp[i - 1][j] || dp[i - 1][j - a[i - 1]]
               end
  end
end

if dp[n][s]
  puts 'Yes'
else
  puts 'No'
end
