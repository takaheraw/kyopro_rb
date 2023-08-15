class Edge
  attr_accessor :to, :cost

  def initialize(to, cost)
    @to = to
    @cost = cost
  end
end

class State
  include Comparable
  attr_accessor :dist, :pos

  def initialize(dist, pos)
    @dist = dist
    @pos = pos
  end

  def <=>(other)
    self.dist <=> other.dist
  end
end

# 入力
n, m = gets.chomp.split.map(&:to_i)
a = Array.new(m + 1)
b = Array.new(m + 1)
c = Array.new(m + 1)

(1..m).each do |i|
  a[i], b[i], c[i] = gets.chomp.split.map(&:to_i)
end

# 隣接リストの作成
g = Array.new(n + 1) { [] }
(1..m).each do |i|
  g[a[i]].push(Edge.new(b[i], c[i]))
  g[b[i]].push(Edge.new(a[i], c[i]))
end

# 配列の初期化
inf = 2_000_000_000
kakutei = Array.new(n + 1, false)
cur = Array.new(n + 1, inf)

# スタート地点をキューに追加
cur[1] = 0
q = [State.new(cur[1], 1)]

# ダイクストラ法
until q.empty?
  # キューから最小要素を取り出す
  state = q.min
  q.delete(state)

  pos = state.pos

  # Q の最小要素が「既に確定した頂点」の場合
  next if kakutei[pos]

  # cur[x] の値を更新する
  kakutei[pos] = true
  g[pos].each do |e|
    if cur[e.to] > cur[pos] + e.cost
      cur[e.to] = cur[pos] + e.cost
      q.push(State.new(cur[e.to], e.to))
    end
  end
end

# 答えを出力
(1..n).each do |i|
  if cur[i] != inf
    puts cur[i]
  else
    puts "-1"
  end
end
