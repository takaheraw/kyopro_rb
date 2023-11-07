# 入力
n, c = gets.chomp.split
a = gets.chomp
n = n.to_i

# スコアの計算
score = 0
n.times do |i|
  if a[i] == 'W'
    score += 0
  elsif a[i] == 'B'
    score += 1
  elsif a[i] == 'R'
    score += 2
  end
end

# 出力
if score % 3 == 0 && c == 'W'
  puts 'Yes'
elsif score % 3 == 1 && c == 'B'
  puts 'Yes'
elsif score % 3 == 2 && c == 'R'
  puts 'Yes'
else
  puts 'No'
end
