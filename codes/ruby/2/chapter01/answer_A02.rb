n, x = gets.split.map(&:to_i)
ar = gets.split.map(&:to_i)

answer = false
ar.each do |a|
  if a == x
    answer = true
    break
  end
end

if answer
  puts "Yes"
else
  puts "No"
end
