class FlowEdge
  attr_accessor :to, :cap, :rev

  def initialize(to, cap, rev)
    @to = to
    @cap = cap
    @rev = rev
  end
end

class MaximumFlow
  INF = 1_000_000_000

  def initialize(n)
    @n = n
    @used = Array.new(n + 1, false)
    @g = Array.new(n + 1) { [] }
  end

  def add_edge(a, b, c)
    @g[a] << FlowEdge.new(b, c, @g[b].size)
    @g[b] << FlowEdge.new(a, 0, @g[a].size - 1)
  end

  def dfs(pos, goal, f)
    return f if pos == goal

    @used[pos] = true
    @g[pos].each_with_index do |e, i|
      next if e.cap == 0 || @used[e.to]

      flow = dfs(e.to, goal, [f, e.cap].min)
      next if flow == 0

      e.cap -= flow
      @g[e.to][e.rev].cap += flow
      return flow
    end

    0
  end

  def max_flow(s, t)
    total_flow = 0
    loop do
      @used.fill(false)
      flow = dfs(s, t, INF)
      break if flow == 0
      total_flow += flow
    end
    total_flow
  end
end

n = gets.to_i
c = Array.new(n + 1)

(1..n).each do |i|
  c[i] = gets.chomp
end

max_flow_obj = MaximumFlow.new(2 * n + 2)

(1..n).each do |i|
  (1..n).each do |j|
    if c[i][j - 1] == '#'
      max_flow_obj.add_edge(i, j + n, 1)
    end
  end
end

(1..n).each do |i|
  max_flow_obj.add_edge(2 * n + 1, i, 1)
  max_flow_obj.add_edge(i + n, 2 * n + 2, 1)
end

answer = max_flow_obj.max_flow(2 * n + 1, 2 * n + 2)
puts answer
