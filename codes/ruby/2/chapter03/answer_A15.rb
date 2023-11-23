n = gets.to_i(&:to_i)
a = gets.split.map(&:to_i)

t = a.union.sort

b = Array.new(n)
(0...n).each do |i|
  b[i] = t.bsearch_index { |x| x >= a[i] } + 1
end

puts b.join(' ')
