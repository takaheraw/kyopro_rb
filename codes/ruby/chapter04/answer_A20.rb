# 入力
S = gets.chomp
T = gets.chomp
N = S.length
M = T.length

# 配列 dp の定義
dp = Array.new(N + 1) { Array.new(M + 1, 0) }

# 動的計画法
dp[0][0] = 0
for i in 1..N
  for j in 1..M
    if S[i - 1] == T[j - 1]
      dp[i][j] = [dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1] + 1].max
    else
      dp[i][j] = [dp[i - 1][j], dp[i][j - 1]].max
    end
  end
end

# 出力
puts dp[N][M]
