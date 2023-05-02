# 入力
N = gets.to_i
P = Array.new(N) { gets.split.map(&:to_i) }

# 「転倒数を求める問題」2 つに分解する
X = Array.new(N)
Y = Array.new(N)
N.times do |i|
  N.times do |j|
    if P[i][j] != 0
      X[i] = P[i][j]
      Y[j] = P[i][j]
    end
  end
end

# 転倒数を求める関数
def inversion(ar)
  answer = 0
  ar.each_with_index do |a, i|
    ar[(i + 1)...ar.length].each do |b|
      answer += 1 if a > b
    end
  end
  answer
end

# 答えを出力
puts inversion(X) + inversion(Y)
