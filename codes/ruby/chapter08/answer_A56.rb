# 入力
N, Q = gets.chomp.split.map(&:to_i)
S = gets.chomp
queries = Array.new(Q) { gets.chomp.split.map(&:to_i) }

# 文字を数値に変換（ここでは書籍とは異なり、0-indexed で実装しています）
# c.ord で文字 c の文字コード（ASCII コード）を取得
T = S.chars.map { |c| c.ord - 'a'.ord + 1 }

# 100 の n 乗を前計算
MOD = 2147483647
power100 = Array.new(N + 1)
power100[0] = 1
N.times do |i|
  power100[i + 1] = power100[i] * 100 % MOD
end

# H[1], H[2], ..., H[N] を計算する
H = Array.new(N + 1)
H[0] = 0
N.times do |i|
  H[i + 1] = (H[i] * 100 + T[i]) % MOD
end

# ハッシュ値を求める関数
# S[l-1:r] のハッシュ値は (H[r] - H[l - 1] * power100[r - l + 1]) % MOD で計算
def hash_value(l, r, power100)
  (H[r] - H[l - 1] * power100[r - l + 1]) % MOD
end

# クエリに答える
queries.each do |a, b, c, d|
  hash1 = hash_value(a, b, power100)
  hash2 = hash_value(c, d, power100)
  if hash1 == hash2
    puts "Yes"
  else
    puts "No"
  end
end
