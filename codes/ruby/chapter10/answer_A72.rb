# 入力
H, W, K = gets.split.map(&:to_i)
c = Array.new(H) { gets.chomp }

# 残り remaining_steps 回の「列に対する操作」で、最大何個のマスを黒くできるかを返す関数
def paint_row(d, remaining_steps)
  # 各列に対して (白マスの個数, 列の番号) の配列を記録し、大きい順にソートする
  column = (0...W).map { |j| [d.map { |row| row[j] }.count('.'), j] }
  column.sort!.reverse!

  # 列に対して操作を行う
  remaining_steps.times do |j|
    idx = column[j][1]
    H.times { |i| d[i][idx] = '#' }
  end

  # 黒マスの個数を数えて、これを返す
  d.map { |l| l.count('#') }.reduce(:+)
end

# 行の塗り方を全探索
# （ここでは「ビット全探索」ではなく Array#product を使って 2^H 通りの塗り方を全列挙しています）
answer = 0
[0, 1].repeated_permutation(H) do |v|
  # 行に対して操作を行う（paint_row 関数でいくつかの d[i][j] を書き換えるため、d は string の配列ではなく 2 次元リストにしています）
  d = c.map(&:chars)
  remaining_steps = K
  H.times do |i|
    if v[i] == 1
      d[i] = ['#'] * W
      remaining_steps -= 1
    end
  end
  if remaining_steps >= 0
    subanswer = paint_row(d, remaining_steps)
    answer = [answer, subanswer].max
  end
end

# 出力
puts answer
