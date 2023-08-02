# Input
q = gets.to_i
queries = Array.new(q) { gets.split }

t = []
queries.each do |query|
  case query[0]
  when "1"
    t.push(query[1])
  when "2"
    puts t.first
  when "3"
    t.shift
  end
end
