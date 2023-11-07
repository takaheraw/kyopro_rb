# Input
q = gets.to_i
queries = Array.new(q) { gets.split }

map = {}
queries.each do |query|
  case query[0]
  when "1"
    map[query[1]] = query[2]
  when "2"
    puts map[query[1]]
  end
end
