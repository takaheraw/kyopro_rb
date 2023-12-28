n, q    = gets.split.map(&:to_i)
s       = gets.chomp
queries = Array.new(q) { gets.split.map(&:to_i) }

t = s.chars.map { |c| c.ord - 'a'.ord + 1 }

mod         = 2_147_483_647
power100    = Array.new(n + 1)
power100[0] = 1
n.times do |i|
  power100[i + 1] = power100[i] * 100 % mod
end

h    = Array.new(n + 1)
h[0] = 0
n.times do |i|
  h[i + 1] = (h[i] * 100 + t[i]) % mod
end

def hash_value(l, r, h, power100, mod)
  (h[r] - h[l - 1] * power100[r - l + 1]) % mod
end

queries.each do |a, b, c, d|
  hash1 = hash_value(a, b, h, power100, mod)
  hash2 = hash_value(c, d, h, power100, mod)
  if hash1 == hash2
    puts 'Yes'
  else
    puts 'No'
  end
end
