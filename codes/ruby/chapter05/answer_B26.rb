# 入力
N = gets.to_i

# エラトステネスのふるい
# 整数 x が消されている場合に限り Deleted[x]=true
Deleted = Array.new(1000009, false)
LIMIT = Math.sqrt(N).to_i
(2..LIMIT).each do |i|
  if Deleted[i] == false
    (i*2..N).step(i) do |j|
      Deleted[j] = true
    end
  end
end

# 答えを出力
(2..N).each do |i|
  if Deleted[i] == false
    puts i
  end
end
