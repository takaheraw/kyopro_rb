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
n, q = gets.split.map(&:to_i)
queries = Array.new(q) { gets.split.map(&:to_i) }

# Process queries
uf = UnionFind.new(n)
queries.each do |tp, u, v|
  if tp == 1
    uf.unite(u, v)
  elsif tp == 2
    if uf.same(u, v)
      puts "Yes"
    else
      puts "No"
    end
  end
end
