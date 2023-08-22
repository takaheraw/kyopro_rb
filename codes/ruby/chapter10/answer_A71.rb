n = gets.to_i
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)

a.sort!
b.sort!.reverse!

answer = 0
n.times do |i|
  answer += a[i] * b[i]
end

puts answer
