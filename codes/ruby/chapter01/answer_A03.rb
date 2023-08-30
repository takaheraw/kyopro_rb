# 入力
n, k = gets.split.map(&:to_i)
p = gets.split.map(&:to_i)
q = gets.split.map(&:to_i)

# 全探索（answer は「合計が k になる選び方が見つかったか」を示す）
answer = false
p.each do |x|
  q.each do |y|
    answer = true if x + y == k
  end
end

# 出力
if answer
  puts "Yes"
else
  puts "No"
end
