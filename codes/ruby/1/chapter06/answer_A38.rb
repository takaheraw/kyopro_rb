# 入力
d, n = gets.split.map(&:to_i)
l, r, h = [], [], []
n.times do
  li, ri, hi = gets.split.map(&:to_i)
  l << li
  r << ri
  h << hi
end

# 配列の初期化（1 日は 24 時間）
lim = Array.new(d + 1, 24)

# 上限値を求める
n.times do |i|
  (l[i]..r[i]).each do |j|
    lim[j] = [lim[j], h[i]].min
  end
end

# 答えを出力
answer = lim[1..d].sum
puts answer
