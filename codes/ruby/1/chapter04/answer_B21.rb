# 入力
N = gets.to_i
S = gets.chomp

# 動的計画法（初期状態）
dp = Array.new(N) { Array.new(N) }
(0...N).each do |i|
  dp[i][i] = 1
end

(0...N-1).each do |i|
  if S[i] == S[i+1]
    dp[i][i+1] = 2
  else
    dp[i][i+1] = 1
  end
end

# 動的計画法（状態遷移）
(2...N).each do |len|
  (0...N-len).each do |l|
    r = l + len
    if S[l] == S[r]
      dp[l][r] = [dp[l][r-1], dp[l+1][r], dp[l+1][r-1]+2].max
    else
      dp[l][r] = [dp[l][r-1], dp[l+1][r]].max
    end
  end
end

# 出力
puts "#{dp}"
puts dp[0][N-1]
