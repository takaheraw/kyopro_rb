n = gets.to_i
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)

dp = Array.new(n + 1)
dp[1] = 0
dp[2] = a[0]
(3..n).each do |i|
  dp[i] = [dp[i - 1] + a[i - 2], dp[i - 2] + b[i - 3]].min
end

puts dp[n]
