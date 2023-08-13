# 入力
n, m = gets.split.map(&:to_i)
edges = Array.new(m) { gets.split.map(&:to_i) }

# 隣接リストの作成
g = Array.new(n + 1) { [] }
edges.each do |a, b|
  g[a].push(b)
  g[b].push(a)
end

# 深さ優先探索を行う関数（pos は現在位置、visited[x] は頂点 x が青色かどうかを表す真偽値）
def dfs(pos, g, visited)
  visited[pos] = true
  g[pos].each do |i|
    dfs(i, g, visited) unless visited[i]
  end
end

# 深さ優先探索
visited = Array.new(n + 1, false)
dfs(1, g, visited)

# 連結かどうかの判定（answer = true のとき連結）
answer = visited[1..-1].all?

# 答えの出力
if answer
  puts "The graph is connected."
else
  puts "The graph is not connected."
end
