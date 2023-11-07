# 配列 A の最長増加部分列（LIS）の長さを計算する
# 配列 dp を使わない実装方法を利用している
def get_lis_value(a)
  len = 0
  l = []
  a.each do |value|
    pos = l.bsearch_index { |x| x >= value } || len
    if pos == len
      l << value
      len += 1
    else
      l[pos] = value
    end
  end
  len
end

# 入力
N = gets.to_i
X = Array.new(N)
Y = Array.new(N)
N.times do |i|
  X[i], Y[i] = gets.split.map(&:to_i)
end

# ソート
tmp = []
N.times do |i|
  tmp << [X[i], -Y[i]]
end
tmp.sort!

# LIS を求めるべき配列は？
A = tmp.map { |_, y| -y }

# 出力
puts get_lis_value(A)
