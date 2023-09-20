# 入力
n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)
c = gets.split.map(&:to_i)
d = gets.split.map(&:to_i)

# 配列 p を作成
p = []
(0...n).each do |x|
  (0...n).each do |y|
    p.push(a[x] + b[y])
  end
end

# 配列 q を作成
q = []
(0...n).each do |z|
  (0...n).each do |w|
    q.push(c[z] + d[w])
  end
end

# 配列 q を小さい順にソート
q.sort!

# 二分探索
found = false
(0...n*n).each do |i|
  complement = k - p[i]
  if q.bsearch { |x| x >= complement } == complement
    puts "Yes"
    found = true
    break
  end
end

# 見つからなかった場合
puts "No" unless found
