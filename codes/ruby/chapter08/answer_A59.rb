class Segtree
  def initialize(n)
    @size = 1
    @size *= 2 while @size < n
    @dat = [0] * (@size * 2)
  end

  # クエリ 1 に対する処理
  def update(pos, x)
    pos += @size
    @dat[pos] = x
    while pos >= 2
      pos /= 2
      @dat[pos] = @dat[pos * 2] + @dat[pos * 2 + 1]
    end
  end

  def query(l, r, a, b, u)
    return 0 if r <= a || b <= l
    return @dat[u] if l <= a && b <= r

    m = (a + b) / 2
    answerl = query(l, r, a, m, u * 2)
    answerr = query(l, r, m, b, u * 2 + 1)
    answerl + answerr
  end
end

# 入力
n, q = gets.split.map(&:to_i)
queries = Array.new(q) { gets.split.map(&:to_i) }

z = Segtree.new(n)
queries.each do |q|
  tp, *cont = q
  if tp == 1
    pos, x = cont
    z.update(pos - 1, x)
  elsif tp == 2
    l, r = cont
    answer = z.query(l - 1, r - 1, 0, z.instance_variable_get(:@size), 1)
    puts answer
  end
end
