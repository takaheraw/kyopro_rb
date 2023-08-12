# 入力
n, m = gets.split.map(&:to_i)
edges = Array.new(m) { gets.split.map(&:to_i) }

# 隣接リストの作成
g = Array.new(n + 1) { [] }
edges.each do |a, b|
  g[a].push(b)
  g[b].push(a)
end

# 出力
(1..n).each do |i|
  output = "#{i}: {"
  output += g[i].join(", ")
  output += "}"
  puts output
end
