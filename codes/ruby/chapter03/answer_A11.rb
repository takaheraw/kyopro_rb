# 整数 x が何番目に存在するかを返す関数
def search(x, a)
	l = 0
	r = a.length - 1
	while l <= r
		m = (l + r).div(2)
		if x < a[m]
			r = m - 1
		elsif x == a[m]
			return m
		elsif x > a[m]
			l = m + 1
		end
	end
	return -1 
end

# 入力（配列 X が 0 番目から始まることに注意）
n, x = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

# 二分探索を行う（配列が 0 番目から始まるので、答えに 1 を足している）
answer = search(x, a)
puts answer + 1
