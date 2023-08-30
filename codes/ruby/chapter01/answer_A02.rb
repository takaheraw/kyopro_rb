# 入力
n, x = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

# 全探索（変数 answer は「既に x が見つかったかどうか」を表す）
answer = false
a.each do |elem|
  answer = true if elem == x
end

# 出力
if answer
  puts "Yes"
else
  puts "No"
end
