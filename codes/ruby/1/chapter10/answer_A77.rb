# 入力
n, l = gets.split.map(&:to_i)
k = gets.to_i
a = gets.split.map(&:to_i)

# スコアの最大値が x 以上かを判定する関数
def check(x, n, l, k, a)
  cnt = 0         # 現時点で何回切ったかを表す
  last_kireme = 0 # 最後どこで切ったかを表す
  n.times do |i|
    if a[i] - last_kireme >= x && l - a[i] >= x
      cnt += 1
      last_kireme = a[i]
    end
  end
  cnt >= k
end

# 二分探索（left: 現在の下限 ／ right: 現在の上限）
left, right = 1, 1_000_000_000
while left < right
  mid = (left + right + 1) / 2
  answer = check(mid, n, l, k, a)
  if !answer
    right = mid - 1  # 答えが前半部分に絞られる
  else
    left = mid       # 答えが後半部分に絞られる
  end
end

# 出力
puts left
