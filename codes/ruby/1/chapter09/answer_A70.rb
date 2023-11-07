n, m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
actions = Array.new(m) { gets.split.map { |x| x.to_i - 1 } }

def get_next(pos, x, y, z, n)
  state = Array.new(n) { |i| (pos / (2 ** i)) % 2 }
  [x, y, z].each { |lamp| state[lamp] ^= 1 }
  state.each_with_index.sum { |s, i| s == 1 ? 2 ** i : 0 }
end

graph = Array.new(2 ** n) { [] }
(0...(2 ** n)).each do |i|
  actions.each do |action|
    graph[i] << get_next(i, *action, n)
  end
end

start = a.each_with_index.sum { |lamp, i| lamp == 1 ? 2 ** i : 0 }
goal = 2 ** n - 1

dist = Array.new(2 ** n, -1)
dist[start] = 0
queue = [start]

until queue.empty?
  pos = queue.shift
  graph[pos].each do |next_pos|
    if dist[next_pos] == -1
      dist[next_pos] = dist[pos] + 1
      queue << next_pos
    end
  end
end

puts dist[goal]
