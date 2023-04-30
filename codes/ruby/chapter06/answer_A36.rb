# 入力
N, K = gets.chomp.split.map(&:to_i)

# 出力
if K >= 2 * N - 2 && K % 2 == 0
  puts "Yes"
else
  puts "No"
end
