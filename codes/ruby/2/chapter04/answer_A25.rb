h, w = gets.split.map(&:to_i)
c = []
h.times { c << gets.chomp }

dp = Array.new(h) { Array.new(w, 0) }
h.times do |i|
  w.times do |j|
    if i == 0 && j == 0
      dp[i][j] = 1
    else
      dp[i][j] = 0
      dp[i][j] += dp[i - 1][j] if i >= 1 && c[i - 1][j] == '.'
      dp[i][j] += dp[i][j - 1] if j >= 1 && c[i][j - 1] == '.'
    end
  end
end

puts dp[h - 1][w - 1]
