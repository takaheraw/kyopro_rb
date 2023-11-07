class UnionFind
  def initialize(n)
    @n = n
    @par = Array.new(n + 1, -1)
    @size = Array.new(n + 1, 1)
  end

  def root(x)
    x = @par[x] while @par[x] != -1
    x
  end

  def unite(u, v)
    root_u = root(u)
    root_v = root(v)
    return if root_u == root_v

    if @size[root_u] < @size[root_v]
      @par[root_u] = root_v
      @size[root_v] += @size[root_u]
    else
      @par[root_v] = root_u
      @size[root_u] += @size[root_v]
    end
  end

  def same(u, v)
    root(u) == root(v)
  end
end

# 入力
n, m = gets.chomp.split.map(&:to_i)
edges = []
(1..m).each do
  a, b, c = gets.chomp.split.map(&:to_i)
  edges << { a: a, b: b, c: c, idx: edges.size + 1 }
end

# 辺の長さの小さい順にソートする
sorted_edges = edges.sort_by { |edge| edge[:c] }

# 最小全域木を求める
answer = 0
uf = UnionFind.new(n)
sorted_edges.each do |edge|
  if !uf.same(edge[:a], edge[:b])
    uf.unite(edge[:a], edge[:b])
    answer += edge[:c]
  end
end

# 答えの出力
puts answer
