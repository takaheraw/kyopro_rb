# 入力（前半部分）
n = gets.to_i
a = gets.split.map(&:to_i)

# 入力（後半部分）
d = gets.to_i
l = []
r = []

d.times do
  l_i, r_i = gets.split.map(&:to_i)
  l << l_i
  r << r_i
end

# P[i]を求める
p = Array.new(n)
p[0] = a[0]

(1...n).each do |i|
  p[i] = [p[i - 1], a[i]].max
end

# Q[i]を求める
q = Array.new(n)
q[-1] = a[-1]

(n - 2).downto(0) do |i|
  q[i] = [q[i + 1], a[i]].max
end

# それぞれの日について答えを求める
d.times do |i|
  l_value = (l[i] - 2 >= 0) ? p[l[i] - 2] : nil
  r_value = q[r[i]]

  if l_value.nil?
    puts r_value
  else
    puts [l_value, r_value].max
  end
end
