# 入力（配列 A は 0 番目から始まることに注意！）
N, M = gets.chomp.split.map(&:to_i)
A = Array.new(M)
M.times do |i|
	A[i] = gets.chomp.split.map(&:to_i)
end

# 配列の初期化
dp = Array.new(M + 1) { Array.new(2 ** N, 10 ** 9) }

# 動的計画法
dp[0][0] = 0
(1..M).each do |i|
	(0...(2 ** N)).each do |j|
		# already[k] = 1 のとき、品物 k は既に無料になっている
		already = Array.new(N)
		N.times do |k|
			if (j / (2 ** k)) % 2 == 0
				already[k] = 0
			else
				already[k] = 1
			end
		end

		# クーポン券 i を選んだ場合の整数表現 v を計算する
		v = 0
		N.times do |k|
			if already[k] == 1 || A[i-1][k] == 1
				v += (2 ** k)
			end
		end

		# 遷移を行う
		dp[i][j] = [dp[i][j], dp[i-1][j]].min
		dp[i][v] = [dp[i][v], dp[i-1][j] + 1].min
	end
end

# 出力
if dp[M][(2 ** N) - 1] == 1000000000
	puts "-1"
else
	puts dp[M][(2 ** N) - 1]
end
