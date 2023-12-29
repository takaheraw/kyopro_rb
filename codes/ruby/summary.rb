# 累積和
visitors = [62, 65, 41, 13, 20, 11, 18, 44, 53, 12, 18, 17, 14, 10, 39]
accumulates = Array.new(visitors.length + 1, 0)
(1..visitors.length).each do |i|
  accumulates[i] = accumulates[i - 1] + visitors[i - 1]
end
targets = [[2, 4], [4, 13]]
targets.each do |l, r|
  puts accumulates[r] - accumulates[l - 1]
end

# クイックソート
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
puts "Sorted Array: #{sorted_array}"

# 二分探索
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
