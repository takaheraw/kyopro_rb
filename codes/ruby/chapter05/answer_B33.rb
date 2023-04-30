# 入力
N, H, W = gets.split.map(&:to_i)
A = Array.new(N)
B = Array.new(N)
N.times do |i|
  A[i], B[i] = gets.split.map(&:to_i)
end

# 全部 XOR した値（ニム和）を求める
xor_sum = 0
N.times do |i|
  xor_sum = (xor_sum ^ (A[i] - 1))
  xor_sum = (xor_sum ^ (B[i] - 1))
end

# 出力
if xor_sum != 0
  puts "First"
else
  puts "Second"
end
