n, m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
actions = Array.new(m) { gets.split.map { |x| x.to_i - 1 } }

def get_next(pos, x, y, z, n)
  state = Array.new(n) { |i| (pos / (2 ** i)) % 2 }
  state[x] = 1 - state[x]
  state[y] = 1 - state[y]
  state[z] = 1 - state[z]
  ret = 0
  state.each_with_index do |val, i|
    ret += 2 ** i if val == 1
  end
  ret
end

g = Array.new(2 ** n) { [] }
(2 ** n).times do |i|
  actions.each do |x, y, z|
    nextstate = get_next(i, x, y, z, n)
    g[i] << nextstate
  end
end

start = 0
a.each_with_index do |val, i|
  start += 2 ** i if val == 1
end
goal = 2 ** n - 1

dist = Array.new(2 ** n, -1)
dist[start] = 0
q = [start]

until q.empty?
  pos = q.shift
  g[pos].each do |nex|
    if dist[nex] == -1
      dist[nex] = dist[pos] + 1
      q << nex
    end
  end
end

puts dist[goal]
