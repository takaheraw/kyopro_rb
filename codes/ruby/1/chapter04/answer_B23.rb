# 入力
N = gets.to_i
X = Array.new(N)
Y = Array.new(N)
N.times do |i|
  X[i], Y[i] = gets.split.map(&:to_i)
end

# 配列 dp の初期化
dp = Array.new(2**N) { Array.new(N, 1_000_000_000.0) }

# 動的計画法（dp[通った都市][今いる都市] となっている）
dp[0][0] = 0
(2**N).times do |i|
  N.times do |j|
    if dp[i][j] < 1_000_000_000.0

      # 都市 j から k に移動したい！
      N.times do |k|
        if (i / (2**k)) % 2 == 0
          dist = Math.sqrt(1.0 * (X[j] - X[k]) * (X[j] - X[k]) + 1.0 * (Y[j] - Y[k]) * (Y[j] - Y[k]))
          dp[i + (2**k)][k] = [dp[i + (2**k)][k], dp[i][j] + dist].min
        end
      end
    end
  end
end

# 出力
puts dp[(2**N) - 1][0]
