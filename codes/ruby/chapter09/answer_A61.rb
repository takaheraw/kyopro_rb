# 入力
N, M = gets.split.map(&:to_i)
edges = Array.new(M) { gets.split.map(&:to_i) }

# 隣接リストの作成
G = Array.new(N + 1) { [] } # G[i] は頂点 i に隣接する頂点のリスト
edges.each do |a, b|
  G[a].push(b) # 頂点 a に隣接する頂点として b を追加
  G[b].push(a) # 頂点 b に隣接する頂点として a を追加
end

# 出力
(1..N).each do |i|
  output = ''
  output += i.to_s
  output += ': {'
  output += G[i].join(', ') # 例えば G[i] = { 2, 7, 5 } のとき、ここで "2, 7, 5" という文字列が output の後ろに連結される
  output += '}'
  puts output
end
