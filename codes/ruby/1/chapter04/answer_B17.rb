# 入力
N = gets.to_i
H = gets.split.map(&:to_i)

# 配列の準備
dp = Array.new(N)

# 動的計画法
dp[0] = 0
dp[1] = (H[0] - H[1]).abs
(2...N).each do |i|
  dp[i] = [dp[i-1] + (H[i-1] - H[i]).abs, dp[i-2] + (H[i-2] - H[i]).abs].min
end

# 答えの復元
# 変数 place は現在位置（ゴールから進んでいく）
answer = []
place = N - 1
while true
  answer << place + 1
  break if place == 0

  # どこから部屋 place に向かうのが最適かを求める
  if dp[place-1] + (H[place-1] - H[place]).abs == dp[place]
    place -= 1
  else
    place -= 2
  end
end
answer.reverse!

# 答えを出力
answer2 = answer.map(&:to_s)
puts answer.length
puts answer2.join(" ")
