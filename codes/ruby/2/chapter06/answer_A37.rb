n, m, b = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
c = gets.split.map(&:to_i)

answer = 0
a.each do |i|
  answer += i * m
end

answer += b * n * m
c.each do |i|
  answer += i * n
end

puts answer
