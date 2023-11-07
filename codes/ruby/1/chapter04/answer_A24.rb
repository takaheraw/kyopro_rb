require 'set'

# 入力（a は 0 番目から始まることに注意！）
n = gets.to_i
a = gets.chomp.split.map(&:to_i)

# 動的計画法の準備
len = 0 # len は l の長さ（例：l[3] まで書き込まれている場合 len=4）
l = []  # 0 番目から始まることに注意
dp = Array.new(n) # 0 番目から始まることに注意

# 動的計画法（配列 dp を使った実装）
(0...n).each do |i|
	pos = l.bsearch_index { |x| x >= a[i] } || len
	dp[i] = pos

	# 配列 l を更新
	if dp[i] >= len
		l << a[i]
		len += 1
	else
		l[dp[i]] = a[i]
	end
end

# 答えを出力
puts len
