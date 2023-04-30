# 入力
N, L = gets.chomp.split.map(&:to_i)
A = []
B = []
N.times do
  a, b = gets.chomp.split
  A << a.to_i
  B << b
end

# 答えを求める
Answer = 0
N.times do |i|
  if B[i] == 'E'
    Answer = [Answer, L - A[i]].max
  elsif B[i] == 'W'
    Answer = [Answer, A[i]].max
  end
end

# 出力
puts Answer
