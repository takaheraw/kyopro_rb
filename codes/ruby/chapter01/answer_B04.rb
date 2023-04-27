N = gets.chomp

Answer = 0
N.length.times do |i|
  keta = 0
  kurai = (2 ** (N.length - 1 - i))
  if N[i] == '1'
    keta = 1
  end
  Answer += keta * kurai
end

puts Answer

# "1011".to_i(2)
# => 11
