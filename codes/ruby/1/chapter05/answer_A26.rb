def is_prime(n)
  limit = Math.sqrt(n).to_i
  (2..limit).each do |i|
    return false if n % i == 0
  end
  return true
end


# 入力
query_count = gets.to_i
query_values = Array.new(query_count)
for index in 0...query_count
  query_values[index] = gets.to_i
end

# 出力
query_values.each do |value|
  if is_prime(value)
    puts "Yes"
  else
    puts "No"
  end
end
