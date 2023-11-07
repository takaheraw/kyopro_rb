n = gets.to_i
p = Array.new(n + 1) { Array.new(n + 1) }
(1..n).each do |i|
  p[i][1..n] = gets.split.map(&:to_i)
end

x = Array.new(n + 1)
y = Array.new(n + 1)
(1..n).each do |i|
  (1..n).each do |j|
    unless p[i][j].zero?
      x[i] = p[i][j]
      y[j] = p[i][j]
    end
  end
end

inversion_x = 0
inversion_y = 0
(1..n).each do |i|
  ((i + 1)..n).each do |j|
    inversion_x += 1 if x[i] > x[j]
    inversion_y += 1 if y[i] > y[j]
  end
end

# 出力
puts inversion_x + inversion_y
