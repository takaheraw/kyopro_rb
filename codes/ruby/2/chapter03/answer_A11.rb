def search(target, targets)
  not_found = - 1
  l         = 0
  r         = targets.length - 1

  while l <= r
    mid_index = (l + r).div(2)
    mid = targets[mid_index]
    if target < mid
      r = mid_index - 1
    elsif target == mid
      return mid_index
    elsif target > mid
      l = mid_index + 1
    end
  end

  not_found
end

target  = gets.to_i
targets = gets.split.map(&:to_i)

answer = search(target, targets)
puts answer + 1
