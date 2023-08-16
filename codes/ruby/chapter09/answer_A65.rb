n = gets.to_i
a = [0, 0] + gets.chomp.split.map(&:to_i)

g = Array.new(n + 1) { [] }
(2..n).each do |i|
  g[a[i]].push(i)
end

dp = Array.new(n + 1, 0)
n.downto(1) do |i|
  g[i].each do |j|
    dp[i] += (dp[j] + 1)
  end
end

puts dp[1..-1].join(" ")
