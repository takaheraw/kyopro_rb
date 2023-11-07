n = gets.to_i
a = gets.split.map(&:to_i)
q = gets.to_i

# 累積和の配列を作成
s = Array.new(n + 1, 0)
n.times do |i|
  s[i + 1] = s[i] + a[i]
end

q.times do
  l, r = gets.split.map(&:to_i)
  count_ones = s[r] - s[l - 1]
  count_zeros = (r - l + 1) - count_ones

  if count_ones > count_zeros
    puts "アタリ"
  elsif count_ones < count_zeros
    puts "ハズレ"
  else
    puts "同数"
  end
end

# ruby answer_B06.rb
# 7
# 1 0 1 1 0 0 1
# 3
# 1 3
# アタリ
# 4 5
# 同数
# 5 7
# ハズレ
