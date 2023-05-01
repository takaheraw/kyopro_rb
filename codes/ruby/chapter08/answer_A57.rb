# 入力
N, Q = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)
queries = Array.new(Q) { gets.chomp.split.map(&:to_i) }

# 前計算（ここでは書籍とは異なり、0-indexed で実装しています）
LEVELS = 30
dp = Array.new(LEVELS) { Array.new(N) }
N.times do |i|
  dp[0][i] = A[i] - 1
end
(1...LEVELS).each do |d|
  N.times do |i|
    dp[d][i] = dp[d - 1][dp[d - 1][i]]
  end
end

# クエリの処理（ここでは書籍とは異なり、0-indexed で実装しています）
queries.each do |x, y|
  current_place = x - 1
  (29).downto(0) do |d|
    if ((y >> d) & 1) == 1
      current_place = dp[d][current_place]
    end
  end
  puts current_place + 1 # current_place は 0-indexed で計算したので、1 を足して出力する
end
