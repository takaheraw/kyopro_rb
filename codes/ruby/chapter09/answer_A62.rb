# 再帰呼び出しの深さの上限を 120000 に設定
RubyVM::InstructionSequence.compile_option = {
  tailcall_optimization: true,
  trace_instruction: false
}

# 深さ優先探索を行う関数（pos は現在位置、visited[x] は頂点 x が青色かどうかを表す真偽値）
def dfs(pos, g, visited)
  visited[pos] = true
  g[pos].each do |i|
    dfs(i, g, visited) unless visited[i]
  end
end

# 入力
N, M = gets.split.map(&:to_i)
edges = Array.new(M) { gets.split.map(&:to_i) }

# 隣接リストの作成
G = Array.new(N + 1) { [] } # G[i] は頂点 i に隣接する頂点のリスト
edges.each do |a, b|
  G[a].push(b) # 頂点 a に隣接する頂点として b を追加
  G[b].push(a) # 頂点 b に隣接する頂点として a を追加
end

# 深さ優先探索
visited = Array.new(N + 1, false)
dfs(1, G, visited)

# 連結かどうかの判定（answer = true のとき連結）
answer = visited[1..-1].all?

# 答えの出力
if answer
  puts "The graph is connected."
else
  puts "The graph is not connected."
end
