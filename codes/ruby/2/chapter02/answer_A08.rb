h, w = gets.split.map(&:to_i)
x    = Array.new(h) { gets.split.map(&:to_i) }
z    = Array.new(h + 1) { Array.new(w + 1, 0) }

q = gets.to_i
a, b, c, d = [], [], [], []

q.times do
  ai, bi, ci, di = gets.split.map(&:to_i)
  a << ai
  b << bi
  c << ci
  d << di
end

(1..h).each do |i|
  (1..w).each do |j|
    z[i][j] = z[i][j - 1] + x[i - 1][j - 1]
  end
end

(1..w).each do |j|
  (1..h).each do |i|
    z[i][j] = z[i - 1][j] + z[i][j]
  end
end

q.times do |i|
  puts z[c[i]][d[i]] +
  z[a[i] - 1][b[i] - 1] -
  z[a[i] - 1][d[i]] -
  z[c[i]][b[i] - 1]
end
