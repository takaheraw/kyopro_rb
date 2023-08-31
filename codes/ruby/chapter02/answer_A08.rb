# 入力（前半部分）
h, w = gets.split.map(&:to_i)
x = Array.new(h) { gets.split.map(&:to_i) }
z = Array.new(h + 1) { Array.new(w + 1, 0) }

# 入力（後半部分）
q = gets.to_i
a, b, c, d = [], [], [], []

q.times do
  a_i, b_i, c_i, d_i = gets.split.map(&:to_i)
  a << a_i
  b << b_i
  c << c_i
  d << d_i
end

# 横方向に累積和をとる
(1..h).each do |i|
  (1..w).each do |j|
    z[i][j] = z[i][j - 1] + x[i - 1][j - 1]
  end
end

# 縦方向に累積和をとる
(1..w).each do |j|
  (1..h).each do |i|
    z[i][j] = z[i - 1][j] + z[i][j]
  end
end

# 答えを求める
q.times do |i|
  puts z[c[i]][d[i]] + z[a[i] - 1][b[i] - 1] - z[a[i] - 1][d[i]] - z[c[i]][b[i] - 1]
end
