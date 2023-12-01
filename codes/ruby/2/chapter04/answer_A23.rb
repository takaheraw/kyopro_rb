n, m = gets.chomp.split.map(&:to_i)
a    = Array.new(m)
m.times do |i|
  a[i] = gets.chomp.split.map(&:to_i)
end

dp = Array.new(m + 1) { Array.new(2**n, 10**9) }

dp[0][0] = 0
(1..m).each do |i|
  (0...(2**n)).each do |j|
    already = Array.new(n)
    n.times do |k|
      already[k] = if (j / (2**k)).even?
                     0
                   else
                     1
                   end
    end

    v = 0
    n.times do |k|
      v += (2**k) if already[k] == 1 || a[i - 1][k] == 1
    end

    dp[i][j] = [dp[i][j], dp[i - 1][j]].min
    dp[i][v] = [dp[i][v], dp[i - 1][j] + 1].min
  end
end

if dp[m][(2**n) - 1] == 1_000_000_000
  puts '-1'
else
  puts dp[m][(2**n) - 1]
end
