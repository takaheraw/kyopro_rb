# 入力
n = gets.to_i
t = Array.new(n)
a = Array.new(n)
for i in 0...n
	t[i], a[i] = gets.split
	a[i] = a[i].to_i
end

# 出力（answer は現在の黒板の数）
answer = 0
for i in 0...n
	if t[i] == '+'
		answer += a[i]
	end
	if t[i] == '-'
		answer -= a[i]
	end
	if t[i] == '*'
		answer *= a[i]
	end

	# 引き算で答えが 0 未満になった場合
	if answer < 0
		answer += 10000
	end

	# ここで余りをとっている！
	answer %= 10000
	puts answer
end
