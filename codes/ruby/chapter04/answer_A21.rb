# 入力
n = gets.to_i
p = Array.new(n + 1)
a = Array.new(n + 1)
(1..n).each do |i|
  p[i], a[i] = gets.split.map(&:to_i)
end

# 動的計画法（LEN は r-l の値)
dp = Array.new(n + 1) { Array.new(n + 1) }
dp[1][n] = 0
(n - 1).downto(0) do |len|
  (1..(n - len)).each do |l|
    r = l + len

    # score1 の値（l-1 番目のブロックを取り除くときの得点）を求める
    score1 = 0
    if l >= 2 && l <= p[l - 1] && p[l - 1] <= r
      score1 = a[l - 1]
    end

    # score2 の値（r+1 番目のブロックを取り除くときの得点）を求める
    score2 = 0
    if r <= n - 1 && l <= p[r + 1] && p[r + 1] <= r
      score2 = a[r + 1]
    end

    # dp[l][r] を求める
    if l == 1
      dp[l][r] = dp[l][r + 1].to_i + score2
    elsif r == n
      dp[l][r] = dp[l - 1][r].to_i + score1
    else
      dp[l][r] = [dp[l - 1][r].to_i + score1, dp[l][r + 1].to_i + score2].max
    end
  end
end

# 出力
answer = 0
(1..n).each do |i|
  answer = [answer, dp[i][i]].max
end
puts answer
