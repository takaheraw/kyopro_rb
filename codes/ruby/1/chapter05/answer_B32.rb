# 入力
N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

# 勝者を計算する
# 配列 dp について： dp[x]=true のとき勝ちの状態、dp[x]=false のとき負けの状態
dp = Array.new(N + 1, false)
(0..N).each do |i|
  (0..K - 1).each do |j|
    if i >= A[j] && !dp[i - A[j]]
      dp[i] = true # 負けの状態に遷移できれば、勝ちの状態
    end
  end
end

# 出力
if dp[N]
  puts "First"
else
  puts "Second"
end
