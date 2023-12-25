class Point2d
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def dist(other)
    ((@x - other.x)**2 + (@y - other.y)**2)**0.5
  end
end

def play_greedy(n, points)
  current_place = 0
  visited = Array.new(n, false)
  visited[0] = true
  point = [0]
  (1...n).each do
    mindist = 10**10
    min_id = -1
    (0...n).each do |i|
      if !visited[i] && mindist > points[current_place].dist(points[i])
        mindist = points[current_place].dist(points[i])
        min_id = i
      end
    end
    visited[min_id] = true
    point << min_id
    current_place = min_id
  end
  point << 0
  point
end

n = gets.chomp.to_i
points = []
n.times do
  x, y = gets.chomp.split.map(&:to_i)
  points << Point2d.new(x, y)
end

answer = play_greedy(n, points)
answer.each do |i|
  puts i + 1
end
