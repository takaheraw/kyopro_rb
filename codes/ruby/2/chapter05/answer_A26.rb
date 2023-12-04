def is_prime(n)
  limit = Math.sqrt(n).to_i
  (2..limit).each do |i|
    return false if n % i == 0
  end
  true
end

query_count = gets.to_i
query_values = Array.new(query_count)
(0...query_count).each do |i|
  query_values[i] = gets.to_i
end

query_values.each do |v|
  if is_prime(v)
    puts 'Yes'
  else
    puts 'No'
  end
end
