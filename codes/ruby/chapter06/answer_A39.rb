# 入力
n = gets.to_i
a = []
n.times do
  l, r = gets.split.map(&:to_i)
  a << [r, l]
end

a.sort!

current_time = 0
answer = 0
a.each do |r, l|
  if current_time <= l
    current_time = r
    answer += 1
  end
end

# 出力
puts answer
