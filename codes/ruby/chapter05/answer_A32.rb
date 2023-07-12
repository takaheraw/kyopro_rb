# Input
n, a, b = gets.split.map(&:to_i)

dp = Array.new(n+1)

for i in 0..n
  if i >= a && dp[i-a] == false
    dp[i] = true
  elsif i >= b && dp[i-b] == false
    dp[i] = true
  else
    dp[i] = false
  end
end

# Output
if dp[n] == true
  puts "First"
else
  puts "Second"
end
