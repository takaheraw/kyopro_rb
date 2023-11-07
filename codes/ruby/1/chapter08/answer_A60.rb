# 入力
n = gets.to_i
a = gets.split.map(&:to_i)

answer = Array.new(n)
level2 = []
for i in 0...n
  if i >= 1
    level2.push([i, a[i - 1]])
    while !level2.empty?
      kabuka = level2.last[1]
      if kabuka <= a[i]
        level2.pop
      else
        break
      end
    end
  end
  if !level2.empty?
    answer[i] = level2.last[0]
  else
    answer[i] = -1
  end
end

# answer を空白区切りで出力
puts answer.join(" ")
