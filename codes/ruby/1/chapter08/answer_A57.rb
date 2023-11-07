# 入力
n, q = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
queries = Array.new(q) { gets.split.map(&:to_i) }

levels = 30
dp = Array.new(levels) { Array.new(n) }
(0...n).each do |i|
  dp[0][i] = a[i] - 1
end
(1...levels).each do |d|
  (0...n).each do |i|
    dp[d][i] = dp[d - 1][dp[d - 1][i]]
  end
end

queries.each do |x, y|
  current_place = x - 1
  (29.downto(0)).each do |d|
    if ((y >> d) & 1) == 1
      current_place = dp[d][current_place]
    end
  end
  puts current_place + 1
end
