# 入力・配列の準備
n, q = gets.split.map(&:to_i)
state = 1
e = Array.new(n + 2)
(1..n).each { |i| e[i] = i }

# クエリの処理
q.times do
  query = gets.split

  # [1] 変更操作
  if query[0].to_i == 1
    x = query[1].to_i
    y = query[2].to_i
    if state == 1
      e[x] = y
    elsif state == 2
      e[n+1-x] = y
    end
  end

  # [2] 反転操作
  if query[0].to_i == 2
    if state == 1
      state = 2
    else
      state = 1
    end
  end

  # [3] 取得操作
  if query[0].to_i == 3
    x = query[1].to_i
    if state == 1
      puts e[x]
    elsif state == 2
      puts e[n+1-x]
    end
  end
end
