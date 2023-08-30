# 入力
n, k = gets.split.map(&:to_i)

# 全探索
answer = 0
(1..n).each do |x|
  (1..n).each do |y|
    z = k - x - y  # 白いカードに書かれるべき整数
    if z >= 1 && z <= n
      answer += 1
    end
  end
end

# 出力
puts answer
