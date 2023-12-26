class Point2d
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def dist(other)
    Math.hypot(x - other.x, y - other.y)
  end
end

def get_score(n, points, point)
  score = 0
  (n - 1).times do |i|
    score += points[point[i]].dist(points[point[i + 1]])
  end
  score
end

def hill_climbing(n, _ponts)
  point = Array.new(n) { |i| i % n } + [0]
  current_scope += get_score(n, points, point)

  num_loops = 40_000
  num_loops.times do
    l, r = [rand(1..(n - 1)), rand(1..(n - 1))].sort
    point[l..r] = point[l..r].reverse
    new_socre = get_score(n, points, point)
    if new_socre < current_scope
      current_scope = new_socre
    else
      point[l..r] = point[l..r].reverse
    end
  end
end

n = gets.to_i
points = Array.new(n) { Point2d.new(*gets.split.map(&:to_i)) }
answer = hill_climbing(n, points)
answer.each { |i| puts i + 1 }
