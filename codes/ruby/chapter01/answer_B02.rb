A, B = gets.split(' ').map(&:to_i)

Answer = false
(A..B).each do |i|
  if 100 % i == 0
    puts i
    Answer = true
  end
end

if Answer
  puts "Yes"
else
  puts "No"
end
