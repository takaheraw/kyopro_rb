# Input
n, k = gets.split.map(&:to_i)

# Output
if k >= 2 * n - 2 && k % 2 == 0
  puts "Yes"
else
  puts "No"
end
