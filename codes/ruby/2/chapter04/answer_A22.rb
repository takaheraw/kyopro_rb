n = gets.to_i
a = Array.new(n + 1)
b = Array.new(n + 1)
a[0] = nil
b[0] = nil
gets.split.map(&:to_i).each_with_index { |num, i| a[i + 1] = num }
gets.split.map(&:to_i).each_with_index { |num, i| b[i + 1] = num }

dp = Array.new(n + 1, - (10**9))
dp[1] = 0

(1...n).each do |i|
  dp[a[i]] = [dp[a[i]], dp[i] + 100].max
  dp[b[i]] = [dp[b[i]], dp[i] + 150].max
end

puts dp[n]
