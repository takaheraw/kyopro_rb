def gcd(a, b)
	while a >= 1 and b >= 1
		if a >= b
			a = a % b # a の値を変更する場合
		else
			b = b % a # b の値を変更する場合
		end
	end
	if a >= 1
		return a
	else
		return b
	end
end

# 入力
a, b = gets.split.map(&:to_i)
puts gcd(a, b)
