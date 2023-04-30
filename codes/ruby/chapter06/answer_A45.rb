# 入力
N, C = gets.chomp.split
A = gets.chomp
N = N.to_i

# スコアの計算
score = 0
N.times do |i|
  case A[i]
  when 'W'
    score += 0
  when 'B'
    score += 1
  when 'R'
    score += 2
  end
end

# 出力
if score % 3 == 0 && C == 'W'
  puts "Yes"
elsif score % 3 == 1 && C == 'B'
  puts "Yes"
elsif score % 3 == 2 && C == 'R'
  puts "Yes"
else
  puts "No"
end
