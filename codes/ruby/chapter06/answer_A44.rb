# 入力・配列の準備
N, Q = gets.chomp.split.map(&:to_i)
state = 1
e = [nil] * (N + 2)
(1..N).each { |i| e[i] = i }

# クエリの処理
Q.times do
  query = gets.chomp.split

  # [1] 変更操作
  if query[0].to_i == 1
    x = query[1].to_i
    y = query[2].to_i
    if state == 1
      e[x] = y
    elsif state == 2
      e[N + 1 - x] = y
    end
  end

  # [2] 反転操作
  if query[0].to_i == 2
    state = state == 1 ? 2 : 1
  end

  # [3] 取得操作
  if query[0].to_i == 3
    x = query[1].to_i
    if state == 1
      puts e[x]
    elsif state == 2
      puts e[N + 1 - x]
    end
  end
end
