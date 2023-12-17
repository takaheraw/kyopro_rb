d, n = gets.split.map(&:to_i)
l = []
r = []
h = []
n.times do
  li, ri, hi = gets.split.map(&:to_i)
  l << li
  r << ri
  h << hi
end

lim = Array.new(d + 1, 24)

n.times do |i|
  (l[i]..r[i]).each do |j|
    lim[j] = [lim[j], h[i]].min
  end
end

answer = lim[1..d].sum
puts answer
