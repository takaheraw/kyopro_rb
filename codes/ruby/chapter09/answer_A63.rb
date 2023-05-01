# 入力
N, M = gets.split.map(&:to_i)
edges = Array.new(M) { gets.split.map(&:to_i) }

# 隣接リストの作成
G = Array.new(N + 1) { [] }
edges.each do |a, b|
  G[a].push(b)
  G[b].push(a)
end

# 幅優先探索の初期化（dist[i] = ? ではなく dist[i] = -1 で初期化していることに注意）
dist = Array.new(N + 1, -1)
dist[1] = 0
Q = []
Q.push(1)

# 幅優先探索
while !Q.empty?
  pos = Q.shift # キュー Q の先頭要素を取り除き、その値を pos に代入する
  G[pos].each do |nex|
    if dist[nex] == -1
      dist[nex] = dist[pos] + 1
      Q.push(nex)
    end
  end
end

# 頂点 1 から各頂点までの最短距離を出力
(1..N).each { |i| puts dist[i] }
