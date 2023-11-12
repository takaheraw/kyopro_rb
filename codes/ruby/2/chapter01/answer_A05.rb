n, k = gets.split.map(&:to_i)

answer = 0
(1..n).each do |x|
  (1..n).each do |y|
    z = k - x - y
    if z >= 1 && z <= n
      answer += 1
    end
  end
end

puts answer
