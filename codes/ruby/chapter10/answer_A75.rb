# 入力
N = gets.to_i
problems = Array.new(N) { gets.split.map(&:to_i) } # タプル (T[i], D[i]) が N 個並んだ配列になる

# D[i] の小さい順に並べ替える
problems.sort_by! { |p| p[1] }

# 動的計画法：前準備
MAX_D = problems.map { |p| p[1] }.max # D[i] の最大値（書籍内のコードでは「1440」という定数を使っているが、ここでは代わりに MAX_D を使うことにする）
dp = Array.new(N + 1) { Array.new(MAX_D + 1, -(10 ** 10)) }

# 動的計画法
dp[0][0] = 0
N.times do |i|
  t, d = problems[i] # 書籍中の T[i], D[i] に対応
  (MAX_D + 1).times do |j|
    if j > d || j < t
      dp[i + 1][j] = dp[i][j]
    else
      dp[i + 1][j] = [dp[i][j], dp[i][j - t] + 1].max
    end
  end
end

# 答えを出力
answer = dp[N].max
puts answer
