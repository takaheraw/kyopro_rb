def gcd(a, b)
  while a >= 1 && b >= 1
    if a >= b
      a = a % b
    else
      b = b % a
    end
  end
  return a >= 1 ? a : b
end

# 入力
a, b = gets.split.map(&:to_i)
puts a * b / gcd(a, b)
