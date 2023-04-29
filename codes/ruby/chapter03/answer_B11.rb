a = (1..100).to_a
N = 5
A = a.sample(N)
Q = gets.to_i
X = Array.new(Q)
Q.times do |i|
  X[i] = gets.to_i
end

A.sort!

puts A

def bisect_left(arr, x)
  low, high = 0, arr.length
  while low < high
    mid = (low + high) / 2
    if arr[mid] < x
      low = mid + 1
    else
      high = mid
    end
  end
  return low
end

Q.times do |i|
  pos1 = bisect_left(A, X[i])
  puts pos1
end
