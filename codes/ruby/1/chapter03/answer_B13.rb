# A[l] から A[r] までの合計値
def sum(l, r, s)
  return s[r + 1] - s[l]
end

# 入力
N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

# 累積和をとる
S = Array.new(N + 1, 0)
(1..N).each do |i|
  S[i] = S[i - 1] + A[i - 1]
end

# 配列の準備（R は 0 番目から始まることに注意）
R = Array.new(N)

# しゃくとり法
N.times do |i|
  if i == 0
    R[i] = -1
  else
    R[i] = R[i - 1]
  end
  while R[i] < N - 1 && sum(i, R[i] + 1, S) <= K
    R[i] += 1
  end
end

# 答えを求める
answer = 0
N.times do |i|
  answer += (R[i] - i + 1)
end

puts answer
