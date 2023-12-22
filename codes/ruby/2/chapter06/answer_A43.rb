n, l = gets.split.map(&:to_i)
a = []
b = []
n.times do
  av, bv = gets.split
  a << av.to_i
  b << bv
end

answer = 0
n.times do |i|
  answer = [answer, l - a[i]].max if b[i] == 'E'
  answer = [answer, a[i]].max if b[i] == 'W'
end

puts answer
