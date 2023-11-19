_n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

left = 1
right = 1_000_000_000

def check(mid, a, k)
  sum = 0
  a.each do |ai|
    sum += mid / ai
  end

  sum >= k
end

while left < right
  mid = (left + right) / 2
  answer = check(mid, a, k)

  if answer == false
    left = mid + 1
  else
    right = mid
  end
end

puts left
