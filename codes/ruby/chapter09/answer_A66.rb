# Union-Find 木
class UnionFind
  # n 頂点の Union-Find 木を作成
  def initialize(n)
    @n = n
    @par = Array.new(n + 1, -1)  # 最初は親が無い
    @size = Array.new(n + 1, 1)  # 最初はグループの頂点数が 1
  end

  # 頂点 x の根を返す関数
  def root(x)
    # 1 個先（親）がなくなる（つまり根に到達する）まで、1 個先（親）に進み続ける
    while @par[x] != -1
      x = @par[x]
    end
    x
  end

  # 要素 u, v を統合する関数
  def unite(u, v)
    rootu = root(u)
    rootv = root(v)
    if rootu != rootv
      # u と v が異なるグループのときのみ処理を行う
      if @size[rootu] < @size[rootv]
        @par[rootu] = rootv
        @size[rootv] += @size[rootu]
      else
        @par[rootv] = rootu
        @size[rootu] += @size[rootv]
      end
    end
  end

  # 要素 u と v が同一のグループかどうかを返す関数
  def same(u, v)
    root(u) == root(v)
  end
end

# 入力
n, q = gets.chomp.split.map(&:to_i)
queries = []
q.times do
  queries << gets.chomp.split.map(&:to_i)
end

# クエリの処理
uf = UnionFind.new(n)
queries.each do |query|
  tp, u, v = query
  if tp == 1
    uf.unite(u, v)
  elsif tp == 2
    puts uf.same(u, v) ? "Yes" : "No"
  end
end
