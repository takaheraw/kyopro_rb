n = gets.to_i
a = gets.split.map(&:to_i)

p = Array.new(n)
p[0] = a[0]

q = Array.new(n)
q[-1] = a[-1]

d = gets.to_i
l = []
r = []

d.times do
  li, ri = gets.split.map(&:to_i)
  l << li
  r << ri
end

(1...n).each do |i|
  p[i] = [p[i - 1], a[i]].max
end

(n - 2).downto(0) do |i|
  q[i] = [q[i + 1], a[i]].max
end

d.times do |i|
  l_value = (l[i] - 2 >= 0) ? p[l[i] - 2] : nil
  r_value = q[r[i]]

  if l_value.nil?
    puts r_value
  else
    puts [l_value, r_value].max
  end
end
