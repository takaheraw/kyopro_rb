# 入力
# A は (終了時刻, 開始時刻) になっていることに注意 [終了時刻の昇順にソートするため]
N = gets.chomp.to_i
A = []
N.times do
  l, r = gets.chomp.split.map(&:to_i)
  A << [r, l]
end

# ソート
A.sort!

# 終了時刻の早いものから貪欲に取っていく（CurrentTime は現在時刻）
CurrentTime = 0
Answer = 0
A.each do |end_time, start_time|
  if CurrentTime <= start_time
    CurrentTime = end_time
    Answer += 1
  end
end

# 出力
puts Answer
