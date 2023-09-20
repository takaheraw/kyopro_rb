# 入力
n = gets.to_i
a = gets.split.map(&:to_i)

# 配列 t の作成・重複を消す
t = a.uniq.sort

# 答えを求める
b = Array.new(n)
(0...n).each do |i|
  b[i] = t.bsearch_index { |x| x >= a[i] } + 1
end

# 答えを空白区切りで出力
puts b.join(" ")
