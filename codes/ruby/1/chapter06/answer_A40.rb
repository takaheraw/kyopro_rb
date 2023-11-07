# 入力
n = gets.to_i
a = gets.split.map(&:to_i)

cnt = Array.new(101, 0)
answer = 0
a.each do |i|
  cnt[i] += 1
end

(1..100).each do |i|
  answer += cnt[i] * (cnt[i]-1) * (cnt[i]-2) / 6
end

puts answer
