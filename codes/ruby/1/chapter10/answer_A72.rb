h, w, k = gets.split.map(&:to_i)
grid = Array.new(h) { gets.chomp.chars }

class Pair
  attr_accessor :count, :index

  def initialize(count, index)
    @count = count
    @index = index
  end

  def <=>(other)
    return -1 if count < other.count || (count == other.count && index < other.index)
    return 1 if count > other.count || (count == other.count && index > other.index)
    0
  end
end

def paint_column(h, w, grid_copy, remaining)
  columns = Array.new(w) do |j|
    cnt = 0
    h.times { |i| cnt += 1 if grid_copy[i][j] == '.' }
    Pair.new(cnt, j)
  end

  columns.sort!.reverse!

  remaining.times do |j|
    idx = columns[j].index
    h.times { |i| grid_copy[i][idx] = '#' }
  end

  grid_copy.flatten.count('#')
end

answer = 0

(1 << h).times do |mask|
  grid_copy = grid.map(&:dup)

  remaining = k
  h.times do |i|
    if (mask & (1 << i)).nonzero?
      remaining -= 1
      w.times { |j| grid_copy[i][j] = '#' }
    end
  end

  answer = [answer, paint_column(h, w, grid_copy, remaining)].max if remaining >= 0
end

puts answer
