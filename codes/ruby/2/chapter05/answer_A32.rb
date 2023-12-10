n, a, b = gets.split.map(&:to_i)

dp = Array.new(n + 1)

(0..n).each do |i|
  dp[i] = if i >= a && dp[i - a] == false
            true
          elsif i >= b && dp[i - b] == false
            true
          else
            false
          end
end

if dp[n] == true
  puts 'First'
else
  puts 'Second'
end
