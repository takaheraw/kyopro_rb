# Structure for edges used in maximum flow
class MaxFlowEdge
  attr_accessor :to, :cap, :rev

  def initialize(to, cap, rev)
    @to = to
    @cap = cap
    @rev = rev
  end
end

# Depth-first search
def dfs(pos, goal, f, g, used)
  return f if pos == goal # Arrived at the goal: The flow can be passed!

  # Explore
  used[pos] = true
  g[pos].each do |e|
    # Go only to vertices with a capacity of 1 or more and not yet visited
    if e.cap > 0 && !used[e.to]
      flow = dfs(e.to, goal, [f, e.cap].min, g, used)
      # If the flow can be passed, increase/decrease the capacity of the residual graph by flow
      if flow >= 1
        e.cap -= flow
        g[e.to][e.rev].cap += flow
        return flow
      end
    end
  end
  # Not found after exploring all edges...
  0
end

# Returns the total flow of the maximum flow from vertex s to vertex t (number of vertices N, list of edges)
def maxflow(n, s, t, edges)
  # Construct the initial residual graph
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
      break # Finish operation when the flow can no longer be passed
    end
  end
  total_flow
end

# Input
n, m = gets.split.map(&:to_i)
edges = Array.new(m) { gets.split.map(&:to_i) }

# Find and output the answer
answer = maxflow(n, 1, n, edges)
puts answer
