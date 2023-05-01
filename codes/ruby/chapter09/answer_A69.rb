class MaxFlowEdge
  attr_accessor :to, :cap, :rev

  def initialize(to, cap, rev)
    @to = to
    @cap = cap
    @rev = rev
  end
end

def dfs(pos, goal, f, g, used)
  return f if pos == goal

  used[pos] = true
  g[pos].each do |e|
    if e.cap > 0 && !used[e.to]
      flow = dfs(e.to, goal, [f, e.cap].min, g, used)
      if flow >= 1
        e.cap -= flow
        g[e.to][e.rev].cap += flow
        return flow
      end
    end
  end
  0
end

def maxflow(n, s, t, edges)
  g = Array.new(n + 1) { [] }
  edges.each do |a, b, c|
    g[a] << MaxFlowEdge.new(b, c, g[b].size)
    g[b] << MaxFlowEdge.new(a, 0, g[a].size - 1)
  end
  inf = 10**10
  total_flow = 0
  loop do
    used = Array.new(n + 1, false)
    f = dfs(s, t, inf, g, used)
    if f > 0
      total_flow += f
    else
      break
    end
  end
  total_flow
end

n = gets.to_i
c = Array.new(n) { gets.chomp }

edges = []
n.times do |i|
  n.times do |j|
    edges << [i + 1, n + j + 1, 1] if c[i][j] == '#'
  end
end

n.times do |i|
  edges << [2 * n + 1, i + 1, 1]
  edges << [n + i + 1, 2 * n + 2, 1]
end

answer = maxflow(2 * n + 2, 2 * n + 1, 2 * n + 2, edges)
puts answer
