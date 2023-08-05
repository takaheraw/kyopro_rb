# 入力
q = gets.to_i
queries = Array.new(q) { gets.split.map(&:to_i) }

s = Set.new
queries.each do |query|
  case query[0]
  when 1
    s.add(query[1])
  when 2
    s.delete(query[1])
  when 3
    res = s.select { |elem| elem > query[1] - 1 }.min
    puts res != nil ? res : -1
  end
end
