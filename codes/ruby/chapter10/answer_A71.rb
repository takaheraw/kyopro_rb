# 入力
N = gets.to_i
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

# 配列のソート（A は昇順に、B は降順にソート）
A.sort!
B.sort!.reverse!

# 答えは A[i] * B[i] の総和
puts A.zip(B).map { |a, b| a * b }.reduce(:+)
