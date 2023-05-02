# 入力
N, M = gets.split.map(&:to_i)
roads = Array.new(M) { gets.split.map(&:to_i) }

# グラフの作成
G = Array.new(N + 1) { [] }
roads.each do |a, b, c, d|
  if d == 1
    G[a] << [b, 10000 * c - 1]
    G[b] << [a, 10000 * c - 1]
  else
    G[a] << [b, 10000 * c]
    G[b] << [a, 10000 * c]
  end
end

# ダイクストラ法
INF = 10 ** 10
kakutei = Array.new(N + 1, false)
cur = Array.new(N + 1, INF)
cur[1] = 0
Q = [[cur[1], 1]]

while !Q.empty?
  Q.sort! { |a, b| a[0] <=> b[0] } # 昇順にソート
  cost, pos = Q.shift
  next if kakutei[pos]
  kakutei[pos] = true
  G[pos].each do |e|
    if cur[e[0]] > cur[pos] + e[1]
      cur[e[0]] = cur[pos] + e[1]
      Q << [cur[e[0]], e[0]]
    end
  end
end

# 答えを求めて出力
# マラソンコースの距離：cur[N] / 10000 を小数点以下切り上げた値
# コース上の木の数：cur[N] と distance * 10000 の差分
distance = (cur[N] + 9999) / 10000
num_trees = distance * 10000 - cur[N]
puts "#{distance} #{num_trees}"
