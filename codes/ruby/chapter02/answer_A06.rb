# n: N日にわたるイベント
# q: Q個の質問
n, q = gets.split.map(&:to_i)

# a: A人が来場
a = gets.split.map(&:to_i)

# l: L日目
l = []
# r: R日目
r = []
for j in 0...q
	l[j], r[j] = gets.split.map(&:to_i)
end

s = Array.new(n + 1)
s[0] = 0
for i in 0...n
	s[i + 1] = s[i] + a[i]
end

for j in 0...q
	puts s[r[j]] - s[l[j] - 1]
end
