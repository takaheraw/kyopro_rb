# 入力
n = gets.to_i

# 上の桁から順番に「2進法に変換した値」を求める
(9).downto(0) do |x|
  wari = 1 << x # 2のx乗
  print (n / wari) % 2 # 割り算の結果に応じて0または1の出力
end
puts # 最後に改行する
