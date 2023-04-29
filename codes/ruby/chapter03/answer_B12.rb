def f(x)
  return x * x * x + x
end

N = gets.to_i

# 二分探索
Left = 0.0
Right = 100.0
20.times do
  Mid = (Left + Right) / 2
  val = f(Mid)

  # 探索範囲を絞る
  if val > N
    Right = Mid # 左半分に絞られる
  else
    Left = Mid # 右半分に絞られる
  end
end

# 出力
puts Mid
