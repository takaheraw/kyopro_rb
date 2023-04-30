# 入力
N, X, Y = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

# Grundy 数を計算
xor_sum = 0
A.each do |a|
  grundy = [0, 0, 1, 1, 2] # 5 で割った余りに対応する Grundy 数
  xor_sum ^= grundy[a % 5]
end

# 出力
if xor_sum != 0
  puts "First"
else
  puts "Second"
end
