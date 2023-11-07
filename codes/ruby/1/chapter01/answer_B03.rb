N = gets.to_i
A = gets.split(' ').map(&:to_i)

Answer = false
(0...N).each do |i|
  (i+1...N).each do |j|
    (j+1...N).each do |k|
      if A[i] + A[j] + A[k] == 1000
        Answer = true
      end
    end
  end
end

if Answer
  puts "Yes"
else
  puts "No"
end
