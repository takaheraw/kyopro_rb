class Edge
  attr_accessor :to, :cost

  def initialize(to, cost)
    @to = to
    @cost = cost
  end
end

class State
  attr_accessor :dist, :pos

  include Comparable

  def initialize(dist, pos)
    @dist = dist
    @pos = pos
  end

  def <=>(other)
    self.dist <=> other.dist
  end
end

n, m = gets.split.map(&:to_i)
edges = Array.new(n + 1) { [] }
(1..m).each do
  a, b, c, d = gets.split.map(&:to_i)
  if d == 1
    edges[a].push(Edge.new(b, 10000 * c - 1))
    edges[b].push(Edge.new(a, 10000 * c - 1))
  else
    edges[a].push(Edge.new(b, 10000 * c))
    edges[b].push(Edge.new(a, 10000 * c))
  end
end

INF = (1 << 60)
cur = Array.new(n + 1, INF)
kakutei = Array.new(n + 1, false)
cur[1] = 0
queue = []
queue.push(State.new(cur[1], 1))

until queue.empty?
  state = queue.min
  queue.delete(state)
  pos = state.pos
  next if kakutei[pos]
  kakutei[pos] = true
  edges[pos].each do |edge|
    if cur[edge.to] > cur[pos] + edge.cost
      cur[edge.to] = cur[pos] + edge.cost
      queue.push(State.new(cur[edge.to], edge.to))
    end
  end
end

distance = (cur[n] + 9999) / 10000
num_trees = distance * 10000 - cur[n]
puts "#{distance} #{num_trees}"
