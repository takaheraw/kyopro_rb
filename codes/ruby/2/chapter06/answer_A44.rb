n, q = gets.split.map(&:to_i)
state = 1
e = Array.new(n + 2)
(1..n).each { |i| e[i] = i }

q.times do
  query = gets.split

  if query[0].to_i == 1
    x = query[1].to_i
    y = query[2].to_i
    if state == 1
      e[x] = y
    elsif state == 2
      en[n + 1 - x] = y
    end
  end

  if query[0].to_i == 2
    state = if state == 1
              2
            else
              1
            end
  end

  next unless query[0].to_i == 3

  x = query[1].to_i
  if state == 1
    puts e[x]
  elsif state == 2
    puts e[n + 1 - x]
  end
end
