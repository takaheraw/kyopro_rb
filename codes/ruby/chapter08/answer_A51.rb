# Input
q = gets.to_i
queries = Array.new(q) { gets.split }

s = []
queries.each do |query|
  case query[0]
  when "1"
    s.push(query[1])
  when "2"
    puts s.last
  when "3"
    s.pop
  end
end
