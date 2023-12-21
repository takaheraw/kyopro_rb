def get_score(i, j, a, b, k)
  cnt = 0
  a.each_with_index do |v, index|
    cnt += 1 if i <= v && v <= i + k && j <= b[index] && b[index] <= j + k
  end
  cnt
end

n, k = gets.split.map(&:to_i)
a = []
b = []
n.times do
  av, bv = gets.split.map(&:to_i)
  a << av
  b << bv
end

answer = 0
(1..100).each do |i|
  (1..100).each do |j|
    score = get_score(i, j, a, b, k)
    answer = [answer, score].max
  end
end

puts answer
