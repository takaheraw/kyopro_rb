# 入力
N, M, B = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)
C = gets.chomp.split.map(&:to_i)

# 答えの計算
Answer = 0
N.times do |i|
  Answer += A[i] * M
end
Answer += B * N * M
M.times do |j|
  Answer += C[j] * N
end

# 出力
puts Answer
