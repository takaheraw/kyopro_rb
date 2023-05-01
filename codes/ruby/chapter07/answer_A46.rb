# 二次元の点を扱うクラス
class Point2D
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  # 2 点間の距離を求める関数
  def dist(p)
    Math.sqrt((@x - p.x) ** 2 + (@y - p.y) ** 2)
  end
end

# 貪欲法によって答えを求める関数
# （ここでは都市の番号を 0-indexed で扱っていることに注意）
def play_greedy(n, points)
  # 配列などの初期化
  current_place = 0
  visited = Array.new(n, false)
  visited[0] = true
  p = [0]
  # 貪欲法スタート
  (1...n).each do |_i|
    mindist = 10**10 # 現時点での距離の最小
    min_id = -1 # 次はどの都市に移動すればよいか
    # 距離が最小となる都市を探す
    (0...n).each do |j|
      if !visited[j] && mindist > points[current_place].dist(points[j])
        mindist = points[current_place].dist(points[j])
        min_id = j
      end
    end
    # 現在位置の更新
    visited[min_id] = true
    p.append(min_id)
    current_place = min_id
  end
  # 最後に訪問する都市
  p.append(0)
  p
end

# 入力
n = gets.to_i
points = Array.new(n)
n.times do |i|
  x, y = gets.split.map(&:to_i)
  points[i] = Point2D.new(x, y)
end

# 貪欲法
answer = play_greedy(n, points)

# 答えを出力（配列 answer の要素は 0-indexed になっていることに注意）
answer.each do |i|
  puts i + 1
end
