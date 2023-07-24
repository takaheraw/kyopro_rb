# 入力
n, l = gets.split.map(&:to_i)
a = []
b = []
n.times do
  a_val, b_val = gets.split
  a << a_val.to_i
  b << b_val
end

answer = 0
n.times do |i|
  if b[i] == 'E'
    answer = [answer, l - a[i]].max
  end
  if b[i] == 'W'
    answer = [answer, a[i]].max
  end
end

# 出力
puts answer
