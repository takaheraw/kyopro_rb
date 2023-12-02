n = gets.to_i
a = gets.chomp.split.map(&:to_i)

len = 0
l = []
dp = Array.new(n)

(0...n).each do |i|
  pos = l.bsearch_index { |x| x >= a[i] } || len
  dp[i] = pos

  if dp[i] >= len
    l << a[i]
    len += 1
  else
    l[dp[i]] = a[i]
  end
end

puts len
