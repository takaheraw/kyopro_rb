# 入力
N = gets.to_i

# 上の桁から順番に「2 進法に変換した値」を求める
for x in [9,8,7,6,5,4,3,2,1,0] do
	wari = (2 ** x)
	print((N / wari) % 2)
end

puts
