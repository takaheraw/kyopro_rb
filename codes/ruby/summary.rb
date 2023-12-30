puts '累積和'
visitors = [62, 65, 41, 13, 20, 11, 18, 44, 53, 12, 18, 17, 14, 10, 39]
accumulates = Array.new(visitors.length + 1, 0)
(1..visitors.length).each do |i|
  accumulates[i] = accumulates[i - 1] + visitors[i - 1]
end
targets = [[2, 4], [4, 13]]
targets.each do |l, r|
  puts accumulates[r] - accumulates[l - 1]
end

puts 'クイックソート'
def quicksort(arr)
  return arr if arr.length <= 1

  pivot   = arr.sample
  less    = arr.select { |x| x < pivot }
  equal   = arr.select { |x| x == pivot }
  greater = arr.select { |x| x > pivot }

  quicksort(less) + equal + quicksort(greater)
end

array_to_sort = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
sorted_array  = quicksort(array_to_sort)
puts "#{sorted_array}"

puts '二分探索'
def binary_search(arr, target)
  low  = 0
  high = arr.length - 1

  while low <= high
    mid = (low + high) / 2
    if arr[mid] == target
      return mid
    elsif arr[mid] < target
      low = mid + 1
    else
      high = mid - 1
    end
  end
end

target = 5
index  = binary_search(sorted_array, target)
puts index

puts '動的計画法'
room_count = 5
pattern1 = [2, 4, 1, 3]
pattern2 = [5, 3, 7]

dp = Array.new(room_count + 1)
dp[1] = 0
dp[2] = pattern1[0]
(3..room_count).each do |i|
  dp[i] = [dp[i - 1] + pattern1[i - 2], dp[i - 2] + pattern2[i - 3]].min
end

puts dp[room_count]

puts '素数'

def is_prime(n)
  limit = Math.sqrt(n).to_i
  (2..limit).each do |i|
    return false if n % i == 0
  end
  true
end
puts is_prime(17)
puts is_prime(35)

puts '最大公約数'

def gcd(a, b)
  while a >= 1 && b >= 1
    if a >= b
      a = a % b
    else
      b = b % a
    end
  end

  return a if a >= 1

  b
end

puts gcd(900, 100)
puts gcd(117, 432)
