n = gets.to_i
t = Array.new(n)
a = Array.new(n)
(0...n).each do |i|
  t[i], a[i] = gets.split
  a[i] = a[i].to_i
end

answer = 0
(0...n).each do |i|
  answer += a[i] if t[i] == '+'
  answer -= a[i] if t[i] == '-'
  answer *= a[i] if t[i] == '*'

  answer += 10_000 if answer < 0

  answer %= 10_000
  puts answer
end
