# 入力（Aは0番目から始まる）
n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

# 配列の準備（Rは0番目から始まる）
r = Array.new(n)

# しゃくとり法
(0...n-1).each do |i|
  # スタート地点を決める
  if i == 0
    r[i] = 0
  else
    r[i] = r[i - 1]
  end

  # ギリギリまで増やしていく
  while r[i] < n-1 && a[r[i]+1] - a[i] <= k
    r[i] += 1
  end
end

# 出力
answer = 0
(0...n-1).each do |i|
  answer += (r[i] - i)
end
puts answer
