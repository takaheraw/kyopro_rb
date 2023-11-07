# 入力
N = gets.to_i
A = Array.new(N)
B = Array.new(N)
C = Array.new(N)
D = Array.new(N)
N.times do |i|
  A[i], B[i], C[i], D[i] = gets.split.map(&:to_i)
end

# 各紙について +1/-1 を加算
T = Array.new(1501) { Array.new(1501, 0) }
N.times do |i|
  T[A[i]][B[i]] += 1
  T[A[i]][D[i]] -= 1
  T[C[i]][B[i]] -= 1
  T[C[i]][D[i]] += 1
end

# 累積和をとる
(0..1500).each do |i|
  (1..1500).each do |j|
    T[i][j] = T[i][j - 1] + T[i][j]
  end
end
(1..1500).each do |i|
  (0..1500).each do |j|
    T[i][j] = T[i - 1][j] + T[i][j]
  end
end

# 面積を数える
answer = 0
(0..1500).each do |i|
  (0..1500).each do |j|
    answer += 1 if T[i][j] >= 1
  end
end

# 出力
puts answer
