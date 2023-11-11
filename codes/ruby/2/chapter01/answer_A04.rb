n = gets.to_i

(9).downto(0) do |x|
  wari = 1 << x
  print (n / wari) % 2
end

puts
