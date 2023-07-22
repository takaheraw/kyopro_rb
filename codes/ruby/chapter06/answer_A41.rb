# 入力
n = gets.to_i
s = gets.chomp

answer = false
(0..n-3).each do |i|
  if s[i] == 'R' && s[i+1] == 'R' && s[i+2] == 'R'
    answer = true
  end
  if s[i] == 'B' && s[i+1] == 'B' && s[i+2] == 'B'
    answer = true
  end
end

# 出力
if answer
  puts "Yes"
else
  puts "No"
end
