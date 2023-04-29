# 入力（前半）
n = gets.chomp.to_i
x = Array.new(n)
y = Array.new(n)
n.times do |i|
  x[i], y[i] = gets.chomp.split.map(&:to_i)
end

# 入力（後半）
q = gets.chomp.to_i
a = Array.new(q)
b = Array.new(q)
c = Array.new(q)
d = Array.new(q)
q.times do |i|
  a[i], b[i], c[i], d[i] = gets.chomp.split.map(&:to_i)
end

# 各座標にある点の数を数える
s = Array.new(1501) { Array.new(1501, 0) }
n.times do |i|
  s[x[i]][y[i]] += 1
end

# 累積和をとる
t = Array.new(1501) { Array.new(1501, 0) }
(1..1500).each do |i|
  (1..1500).each do |j|
    t[i][j] = t[i][j-1] + s[i][j]
  end
end
(1..1500).each do |j|
  (1..1500).each do |i|
    t[i][j] = t[i-1][j] + t[i][j]
  end
end

# 答えを求める
q.times do |i|
  puts t[c[i]][d[i]] + t[a[i]-1][b[i]-1] - t[a[i]-1][d[i]] - t[c[i]][b[i]-1]
end
