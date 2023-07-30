class Point2d
  def initialize(x, y)
    @x, @y = x, y
  end

  def dist(other)
    Math.hypot(@x - other.x, @y - other.y)
  end

  attr_reader :x, :y
end

def get_score(n, points, p)
  score = 0
  n.times do |i|
    score += points[p[i]].dist(points[p[i + 1]])
  end
  score
end

def simulated_annealing(n, points)
  p = Array.new(n) { |i| i % n } + [0]
  current_score = get_score(n, points, p)

  num_loops = 40000
  num_loops.times do |t|
    l, r = [rand(1..(n - 1)), rand(1..(n - 1))].sort
    p[l..r] = p[l..r].reverse
    new_score = get_score(n, points, p)
    t = 30 - 28 * (t.to_f / num_loops)
    probability = Math.exp([((current_score - new_score) / t), 0].min)
    if rand < probability
      current_score = new_score
    else
      p[l..r] = p[l..r].reverse
    end
  end
  p
end

n = gets.to_i
points = Array.new(n) { Point2d.new(*gets.split.map(&:to_i)) }
answer = simulated_annealing(n, points)
answer.each { |i| puts i + 1 }
