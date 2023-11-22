n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)
c = gets.split.map(&:to_i)
d = gets.split.map(&:to_i)

p = []
(0...n).each do |x|
  (0...n).each do |y|
    p.push(a[x] + b[y])
  end
end

q = []
(0...n).each do |z|
  (0...n).each do |w|
    q.push(c[z] + d[w])
  end
end

q.sort!

found = false
(0...n * n).each do |i|
  complement = k - p[i]
  next unless q.bsearch { |x| x >= complement } == complement

  puts 'Yes'
  found = true
  break
end

puts 'No' unless found
