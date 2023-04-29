def enumerate(a)
  sum_list = []
  (2 ** a.length).times do |i|
    sum = 0 # 現在の合計値
    a.length.times do |j|
      wari = (2 ** j)
      if (i.div(wari)) % 2 == 1
        sum += a[j]
      end
    end
    sum_list.append(sum)
  end
  return sum_list
end

# 入力
N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

# カードを半分ずつに分ける
L1 = A[0...(N.div(2))]
L2 = A[(N.div(2))...N]

# それぞれについて、「あり得るカードの合計」を全列挙
Sum1 = enumerate(L1)
Sum2 = enumerate(L2)
Sum1.sort!
Sum2.sort!

# 二分探索で Sum1[i] + Sum2[j] = K となるものが存在するかを見つける
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

Sum1.each do |i|
  pos = bisect_left(Sum2, K - i)
  if pos < Sum2.length and Sum2[pos] == K - i
    puts "Yes"
    exit(0)
  end
end

# 見つからなかった場合
puts "No"
