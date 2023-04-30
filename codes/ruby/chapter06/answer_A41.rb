# 入力
N = gets.chomp.to_i
S = gets.chomp

# 答えを求める
Answer = false
(0..N-3).each do |i|
  Answer = true if S[i] == 'R' && S[i + 1] == 'R' && S[i + 2] == 'R'
  Answer = true if S[i] == 'B' && S[i + 1] == 'B' && S[i + 2] == 'B'
end

# 出力
if Answer
  puts "Yes"
else
  puts "No"
end
