n = gets.to_i
s = gets.chomp

answer = false
(0..n - 3).each do |i|
  answer = true if s[i] == 'R' && s[i + 1] == 'R' && s[i + 2] == 'R'
  answer = true if s[i] == 'B' && s[i + 1] == 'B' && s[i + 2] == 'B'
end

if answer
  puts 'Yes'
else
  puts 'No'
end
