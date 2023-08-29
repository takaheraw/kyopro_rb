# 入力
n, w, l, r = gets.split.map(&:to_i)
x = [0] + gets.split.map(&:to_i) + [w]

# 動的計画法
MOD = 1_000_000_007
dp = Array.new(n + 2, 0)
sum = Array.new(n + 2, 0)

dp[0] = 1
sum[0] = 1

(1..n+1).each do |i|
  pos_l = x.bsearch_index { |e| e >= x[i] - r } || 0
  pos_r = x.bsearch_index { |e| e >= x[i] - l + 1 } || 0
  pos_r -= 1

  dp[i] += (pos_r >= 0 ? sum[pos_r] : 0)
  dp[i] -= (pos_l >= 1 ? sum[pos_l - 1] : 0)
  dp[i] = (dp[i] + MOD) % MOD

  sum[i] = sum[i - 1] + dp[i]
  sum[i] %= MOD
end

# 出力
puts dp[n + 1]
