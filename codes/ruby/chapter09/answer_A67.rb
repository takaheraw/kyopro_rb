# Union-Find Tree
class UnionFind
  # Create a Union-Find Tree with n vertices
  def initialize(n)
    @n = n
    @par = Array.new(n + 1, -1) # Initially, there are no parents
    @size = Array.new(n + 1, 1) # Initially, the number of vertices in the group is 1
  end

  # Returns the root of vertex x
  def root(x)
    # Continue to move one step forward (parent) until there is no parent (i.e., reach the root)
    while @par[x] != -1
      x = @par[x]
    end
    x
  end

  # Unite elements u and v
  def unite(u, v)
    rootu = root(u)
    rootv = root(v)
    if rootu != rootv
      # Process only when u and v are in different groups
      if @size[rootu] < @size[rootv]
        @par[rootu] = rootv
        @size[rootv] += @size[rootu]
      else
        @par[rootv] = rootu
        @size[rootu] += @size[rootv]
      end
    end
  end

  # Returns whether elements u and v are in the same group
  def same(u, v)
    root(u) == root(v)
  end
end

# Input
n, m = gets.split.map(&:to_i)
edges = Array.new(m) { gets.split.map(&:to_i) }

# Sort edges by length in ascending order
edges.sort_by! { |x| x[2] }

# Find the minimum spanning tree
uf = UnionFind.new(n)
answer = 0
edges.each do |a, b, c|
  unless uf.same(a, b)
    uf.unite(a, b)
    answer += c
  end
end

# Output the answer
puts answer
