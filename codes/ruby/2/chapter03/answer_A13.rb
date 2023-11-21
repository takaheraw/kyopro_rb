n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

r = Array.new(n)

(0...n - 1).each do |i|
  r[i] = if i == 0
           i
         else
           r[i - 1]
         end

  r[i] += 1 while r[i] < n - 1 && a[r[i] + 1] - a[i] <= k
end

answer = 0
(0...n - 1).each do |i|
  answer += (r[i] - i)
end

puts answer
