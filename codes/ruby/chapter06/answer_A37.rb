# 入力
n, m, b = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
c = gets.split.map(&:to_i)

answer = 0
a.each do |ai|
  answer += ai * m
end
answer += b * n * m
c.each do |cj|
  answer += cj * n
end

# 出力
puts answer
