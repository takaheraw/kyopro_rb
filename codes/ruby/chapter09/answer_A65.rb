# 入力（A[2], ..., A[N] が入力される値になるようにする）
N = gets.to_i
A = [0, 0] + gets.split.map(&:to_i)

# 隣接リストの作成
G = Array.new(N + 1) { [] }
(2..N).each do |i|
  G[A[i]].push(i) # 上司 → 部下の方向に方向に辺を追加
end

# 動的計画法（dp[x] は社員 x の部下の数）
dp = Array.new(N + 1, 0)
(N.downto(1)).each do |i|
  G[i].each do |j|
    dp[i] += (dp[j] + 1)
  end
end

# 答え (dp[1], dp[2], ..., dp[N]) を空白区切りで出力
puts dp[1..-1].join(' ')
