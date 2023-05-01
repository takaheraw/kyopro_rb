# 入力
N = gets.to_i
A = gets.chomp.split.map(&:to_i)

# スタックの変化の再現
# （スタックには [日付, 株価] の配列を記録する）
answer = Array.new(N)
level2 = []
N.times do |i|
  if i >= 1
    level2.push([i, A[i - 1]])
    while !level2.empty?
      kabuka = level2.last[1] # 株価は配列の 2 番目の要素
      if kabuka <= A[i]
        level2.pop
      else
        break
      end
    end
  end
  if !level2.empty?
    answer[i] = level2.last[0] # 日付は配列の 1 番目の要素
  else
    answer[i] = -1
  end
end

# answer を空白区切りで出力
puts answer.join(' ')
