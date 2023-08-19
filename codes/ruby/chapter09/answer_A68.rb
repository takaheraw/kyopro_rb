class FlowEdge
  attr_accessor :to, :cap, :rev

  def initialize(to, cap, rev)
    @to = to
    @cap = cap
    @rev = rev
  end
end

class MaximumFlow
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
      if flow > 0
        @g[pos][i].cap -= flow
        @g[e.to][e.rev].cap += flow
        return flow
      end
    end
    return 0
  end

  def max_flow(s, t)
    total_flow = 0
    loop do
      @used.fill(false)
      f = dfs(s, t, Float::INFINITY)
      break if f == 0
      total_flow += f
    end
    total_flow
  end
end

# 入力
n, m = gets.chomp.split.map(&:to_i)
z = MaximumFlow.new(n)
m.times do
  a, b, c = gets.chomp.split.map(&:to_i)
  z.add_edge(a, b, c)
end

# 答えを求めて出力
puts z.max_flow(1, n)
