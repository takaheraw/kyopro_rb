n  = gets.to_i
pr = Array.new(n + 1)
ar = Array.new(n + 1)
(1..n).each do |i|
  pr[i], ar[i] = gets.split.map(&:to_i)
end

dp = Array.new(n + 1) { Array.new(n + 1) }
dp[1][n] = 0
(n - 1).downto(0) do |len|
  (1..(n - len)).each do |l|
    r = l + len

    score1 = 0
    score1 = ar[l - 1] if l >= 2 && l <= pr[l - 1] && pr[l - 1] <= r

    score2 = 0
    score2 = ar[r + 1] if r <= n - 1 && l <= pr[r + 1] && pr[r + 1] <= r

    dp[l][r] = if l == 1
                 dp[l][r + 1].to_i + score2
               elsif r == n
                 dp[l - 1][r].to_i + score1
               else
                 [dp[l - 1][r].to_i + score1, dp[l][r + 1].to_i + score2].max
               end
  end
end

answer = 0
(1..n).each do |i|
  answer = [answer, dp[i][i]].max
end

puts answer
