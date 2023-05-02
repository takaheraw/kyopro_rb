def bisect_left(arr, x)
  idx = arr.bsearch_index { |v| v >= x }
  idx.nil? ? arr.length : idx
end

# 入力
N, W, L, R = gets.split.map(&:to_i)
X = gets.split.map(&:to_i)

# 西岸を足場 0、東岸を足場 N+1 とみなす
X = [0] + X + [W]

# 動的計画法（書籍内の sum[i] は本コードの dpsum[i] に対応）
MOD = 10**9 + 7 # = 1000000007
dp = Array.new(N + 2, 0)
dpsum = Array.new(N + 2, 0)
dp[0] = 1
dpsum[0] = 1
(1..(N + 1)).each do |i|
  posl = bisect_left(X, X[i] - R)
  posr = bisect_left(X, X[i] - L + 1) - 1
  # dp[i] の値を累積和で計算（C++ とは異なり、（負の値）% MOD も 0 以上 MOD-1 以下になることに注意）
  dp[i] = (posr >= 0 ? dpsum[posr] : 0) - (posl >= 1 ? dpsum[posl - 1] : 0)
  dp[i] %= MOD
  # 累積和 dpsum[i] の値を更新
  dpsum[i] = dpsum[i - 1] + dp[i]
  dpsum[i] %= MOD
end

# 出力
puts dp[N + 1]
