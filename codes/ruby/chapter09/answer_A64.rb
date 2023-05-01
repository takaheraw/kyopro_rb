# 入力
N, M = gets.split.map(&:to_i)
edges = Array.new(M) { gets.split.map(&:to_i) }

# 隣接リストの作成（重み付きグラフなので、各辺について (隣接頂点, 重み) の配列を記録する）
G = Array.new(N + 1) { [] }
edges.each do |a, b, c|
  G[a].push([b, c])
  G[b].push([a, c])
end

# 配列・キューの初期化（キューには [距離, 頂点番号] の配列を記録する）
INF = 10 ** 10
kakutei = Array.new(N + 1, false)
cur = Array.new(N + 1, INF)
cur[1] = 0
Q = []
Q.push([cur[1], 1])

# ダイクストラ法
while !Q.empty?
  # 次に確定させるべき頂点を求める
  # （ここでは、キュー Q の最小要素を取り除き、その要素の 2 番目の値（頂点番号）を pos に代入する）
  pos = Q.min_by { |distance, vertex| distance }[1]
  Q.delete_if { |distance, vertex| vertex == pos }

  # Q の最小要素が「既に確定した頂点」の場合
  next if kakutei[pos]

  # cur[x] の値を更新する
  kakutei[pos] = true
  G[pos].each do |e|
    # 書籍内のコードとは pos = e[0], cost = e[1] で対応している
    if cur[e[0]] > cur[pos] + e[1]
      cur[e[0]] = cur[pos] + e[1]
      Q.push([cur[e[0]], e[0]])
    end
  end
end

# 答えを出力
(1..N).each do |i|
  if cur[i] != INF
    puts cur[i]
  else
    puts "-1"
  end
end
