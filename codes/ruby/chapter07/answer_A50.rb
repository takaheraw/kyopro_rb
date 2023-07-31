require 'time'

n = 5
q = 25
a = Array.new(n) { gets.split.map(&:to_i) }

x = Array.new(q) { rand(n) }
y = Array.new(q) { rand(n) }
h = Array.new(q, 1)
b = Array.new(3*n) { Array.new(3*n, 0) }
q.times do |i|
  b[y[i]][x[i]] += 1
end

delta = [ nil ] + (1..n).map do |i|
  Array.new(2*i-1) do |y|
    Array.new(2*i-1) do |x|
      [i - y.abs - x.abs, 0].max
    end
  end
end

def get_score(a, b, n)
  200000000 - a.flatten.zip(b[n...2*n].map { |row| row[n...2*n] }.flatten).map { |ai, bi| (ai - bi).abs }.sum
end

time_limit = 5.4
current_score = get_score(a, b, n)
ti = Time.now

loops = 0
while Time.now - ti < time_limit do
  t = rand(q)
  old_x, new_x = x[t], x[t] + rand(-4..4)
  old_y, new_y = y[t], y[t] + rand(-4..4)
  old_h, new_h = h[t], h[t] + rand(-4..4)
  next if new_x < 0 || new_x >= n || new_y < 0 || new_y >= n || new_h <= 0 || new_h > n

  delta[old_h].each_with_index do |row, dy|
    row.each_with_index do |d, dx|
      b[y[t]-old_h+1+dy][x[t]-old_h+1+dx] -= d
    end
  end
  x[t], y[t], h[t] = new_x, new_y, new_h
  delta[new_h].each_with_index do |row, dy|
    row.each_with_index do |d, dx|
      b[y[t]-new_h+1+dy][x[t]-new_h+1+dx] += d
    end
  end

  new_score = get_score(a, b, n)

  if current_score < new_score
    current_score = new_score
  else
    delta[new_h].each_with_index do |row, dy|
      row.each_with_index do |d, dx|
        b[y[t]-new_h+1+dy][x[t]-new_h+1+dx] -= d
      end
    end
    x[t], y[t], h[t] = old_x, old_y, old_h
    delta[old_h].each_with_index do |row, dy|
      row.each_with_index do |d, dx|
        b[y[t]-old_h+1+dy][x[t]-old_h+1+dx] += d
      end
    end
  end

  loops += 1
end

# Output
puts q
q.times { |i| puts "#{x[i]} #{y[i]} #{h[i]}" }
puts "score = #{current_score}"
puts "loops = #{loops}"
