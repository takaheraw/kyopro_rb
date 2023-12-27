def quicksort(arr)
  return arr if arr.length <= 1

  pivot = arr.sample
  less = arr.select { |x| x < pivot }
  equal   = arr.select { |x| x == pivot }
  greater = arr.select { |x| x > pivot }

  quicksort(less) + equal + quicksort(greater)
end

def binary_search(arr, target)
  low = 0
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

  nil
end

array_to_sort = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
sorted_array  = quicksort(array_to_sort)
puts "Sorted Array: #{sorted_array}"

target_element = 5
index          = binary_search(sorted_array, target_element)
if index
  puts "#{target_element} found at index #{index} in #{sorted_array}"
else
  puts "#{target_element} not found in #{sorted_array}"
end
