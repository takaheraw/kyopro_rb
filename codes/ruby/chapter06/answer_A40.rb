# 入力
N = gets.chomp.to_i
A = gets.chomp.split.map(&:to_i)

# 個数を数える
cnt = [0] * 101
Answer = 0
A.each do |a|
  cnt[a] += 1
end

# 答えを求める
(1..100).each do |i|
  Answer += cnt[i] * (cnt[i] - 1) * (cnt[i] - 2) / 6
end

puts Answer
