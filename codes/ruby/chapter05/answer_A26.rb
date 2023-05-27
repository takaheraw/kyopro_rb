# x が素数のとき true を、素数ではないとき false を返す
def is_prime(n)
	limit = (n ** 0.5).to_i
	for i in 2..(limit + 1)
		if n % i == 0
			return false
		end
	end
	return true
end

# 入力
q = gets.to_i
x = Array.new(q)
for i in 0...q
	x[i] = gets.to_i
end

# 出力
for i in 0...q
	answer = is_prime(x[i])
	if answer == true
		puts "Yes"
	else
		puts "No"
	end
end
