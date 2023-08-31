# 入力
h, w, n = gets.split.map(&:to_i)

a = []
b = []
c = []
d = []

# イベント情報の読み込み
(1..n).each do |_|
  a_i, b_i, c_i, d_i = gets.split.map(&:to_i)
  a << a_i
  b << b_i
  c << c_i
  d << d_i
end

# 各日について加算
x = Array.new(h + 2) { Array.new(w + 2, 0) }
z = Array.new(h + 2) { Array.new(w + 2, 0) }

(0...n).each do |t|
  x[a[t]][b[t]] += 1
  x[a[t]][d[t] + 1] -= 1
  x[c[t] + 1][b[t]] -= 1
  x[c[t] + 1][d[t] + 1] += 1
end

# 二次元累積和を求める
(1..h).each do |i|
  (1..w).each do |j|
    z[i][j] = z[i][j - 1] + x[i][j]
  end
end

(1..w).each do |j|
  (1..h).each do |i|
    z[i][j] += z[i - 1][j]
  end
end

# 出力
(1..h).each do |i|
  puts z[i][1..w].join(" ")
end
