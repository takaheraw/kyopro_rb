# 入力
S = gets.chomp
T = gets.chomp

# 配列の準備
dp = Array.new(S.length + 1) { Array.new(T.length + 1) }

# 動的計画法
dp[0][0] = 0
(0..S.length).each do |i|
  (0..T.length).each do |j|
    if i >= 1 && j >= 1 && S[i - 1] == T[j - 1]
      dp[i][j] = [dp[i - 1][j] + 1, dp[i][j - 1] + 1, dp[i - 1][j - 1]].min
    elsif i >= 1 && j >= 1
      dp[i][j] = [dp[i - 1][j] + 1, dp[i][j - 1] + 1, dp[i - 1][j - 1] + 1].min
    elsif i >= 1
      dp[i][j] = dp[i - 1][j] + 1
    elsif j >= 1
      dp[i][j] = dp[i][j - 1] + 1
    end
  end
end

# 出力
puts dp[S.length][T.length]
