# 入力
n, m = gets.chomp.split.map(&:to_i)
a = Array.new(m + 1)
b = Array.new(m + 1)
(1..m).each do |i|
  a[i], b[i] = gets.chomp.split.map(&:to_i)
end

# 隣接リストの作成
g = Array.new(n + 1) { [] }
(1..m).each do |i|
  g[a[i]].push(b[i])
  g[b[i]].push(a[i])
end

# 幅優先探索の初期化（dist[i] = -1 で初期化していることに注意）
dist = Array.new(n + 1, -1)
dist[1] = 0
q = [1]

# 幅優先探索
until q.empty?
  pos = q.shift # キュー q の先頭要素を取り除き、その値を pos に代入する
  g[pos].each do |nex|
    if dist[nex] == -1
      dist[nex] = dist[pos] + 1
      q.push(nex)
    end
  end
end

# 頂点 1 から各頂点までの最短距離を出力
dist[1..-1].each { |d| puts d }
