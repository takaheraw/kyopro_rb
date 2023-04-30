# 入力
D, N = gets.chomp.split.map(&:to_i)
L, R, H = [], [], []
N.times do
  l, r, h = gets.chomp.split.map(&:to_i)
  L << l
  R << r
  H << h
end

# 配列の初期化（1 日は 24 時間）
LIM = [24] * (D + 1)

# 上限値を求める
N.times do |i|
  (L[i]..R[i]).each do |j|
    LIM[j] = [LIM[j], H[i]].min
  end
end

# 答えを出力
Answer = 0
(1..D).each do |i|
  Answer += LIM[i]
end
puts Answer
