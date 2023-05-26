N, Q = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
L = Array.new(Q)
R = Array.new(Q)
for j in 0...Q
	L[j], R[j] = gets.split.map(&:to_i)
end

S = Array.new(N + 1)
S[0] = 0
for i in 0...N
	S[i + 1] = S[i] + A[i]
end

for j in 0...Q
	puts S[R[j]] - S[L[j] - 1]
end
