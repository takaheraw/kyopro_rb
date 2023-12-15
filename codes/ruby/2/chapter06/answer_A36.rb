n, k = gets.split.map(&:to_i)

if k >= 2 * n - 2 && k.even?
  puts 'Yes'
else
  puts 'No'
end
