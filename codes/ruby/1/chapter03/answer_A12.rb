# 入力
n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

# 二分探索
# left は探索範囲の左端を、right は探索範囲の右端を表す
left = 1
right = 1_000_000_000

# 答えが x 以下かを判定し、Yes であれば true、No であれば false を返す
def check(x, a, k)
  sum = 0
  a.each do |ai|
    sum += x / ai #「x ÷ ai」の小数点以下切り捨て
  end
  return sum >= k
end

while left < right
  mid = (left + right) / 2
  answer = check(mid, a, k)

  if answer == false
    left = mid + 1 # 答えが mid+1 以上であることが分かる
  else
    right = mid # 答えが mid 以下であることが分かる
  end
end

# 出力（このとき left=right になっている）
puts left
