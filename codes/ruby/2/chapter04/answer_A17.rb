n = gets.to_i
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)

dp = Array.new(n + 1, nil)
dp[1] = 0
dp[2] = a[0]
(3..n).each do |i|
  dp[i] = [dp[i - 1] + a[i - 2], dp[i - 2] + b[i - 3]].min
end

answer = []
place = n
while true
  answer << place
  break if place == 1

  place -= if dp[place - 1] + a[place - 2] == dp[place]
             1
           else
             2
           end
end
answer.reverse!
answer2 = answer.map(&:to_s)

puts answer.size
puts answer2.join(' ')
