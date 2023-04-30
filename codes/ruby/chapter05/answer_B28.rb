# 入力
N = gets.to_i

# フィボナッチ数の計算
a = Array.new(N + 1)
a[1] = 1
a[2] = 1
(3..N).each do |i|
  a[i] = (a[i-1] + a[i-2]) % 1_000_000_007
end

# 出力
puts a[N]
