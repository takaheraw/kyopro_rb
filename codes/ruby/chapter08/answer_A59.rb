# セグメント木（ここでは書籍とは異なり、pos が 0-indexed になるように実装しています）
class Segtree
  # 要素 dat の初期化を行う（最初は全部ゼロ）
  def initialize(n)
    self.size = 1
    while self.size < n
      self.size *= 2
    end
    self.dat = Array.new(self.size * 2, 0)
  end

  # クエリ 1 に対する処理
  def update(pos, x)
    pos += self.size
    self.dat[pos] = x
    while pos >= 2
      pos /= 2
      self.dat[pos] = self.dat[pos * 2] + self.dat[pos * 2 + 1]
    end
  end

  # クエリ 2 に対する処理
  def query(l, r, a, b, u)
    return 0 if r <= a || b <= l
    return self.dat[u] if l <= a && b <= r
    m = (a + b) / 2
    answerl = query(l, r, a, m, u * 2)
    answerr = query(l, r, m, b, u * 2 + 1)
    answerl + answerr
  end

  attr_accessor :size, :dat
end

# 入力
N, Q = gets.chomp.split.map(&:to_i)
queries = Array.new(Q) { gets.chomp.split.map(&:to_i) }

# クエリの処理
z = Segtree.new(N)
queries.each do |q|
  tp, *cont = q
  if tp == 1
    pos, x = cont
    z.update(pos - 1, x)
  elsif tp == 2
    l, r = cont
    answer = z.query(l - 1, r - 1, 0, z.size, 1)
    puts answer
  end
end
