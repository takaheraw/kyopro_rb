# 入力
n, s = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

# 動的計画法（i=0）
dp = Array.new(n + 1) { Array.new(s + 1) }
dp[0][0] = true
(1..s).each do |i|
  dp[0][i] = false
end

# 動的計画法（i=1）
(1..n).each do |i|
  (0..s).each do |j|
    if j < a[i - 1]
      dp[i][j] = dp[i - 1][j]
    else
      dp[i][j] = dp[i - 1][j] || dp[i - 1][j - a[i - 1]]
    end
  end
end

# 選び方が存在しない場合
if !dp[n][s]
  puts "-1"
  exit(0)
end

# 答えの復元
answer = []
place = s
(n.downto(1)).each do |i|
  if dp[i - 1][place]
    place -= 0 # カード i を選ばない
  else
    place -= a[i - 1] # カード i を選ぶ
    answer << i
  end
end
answer.reverse!

# 答えを出力
puts answer.length
puts answer.join(" ")
