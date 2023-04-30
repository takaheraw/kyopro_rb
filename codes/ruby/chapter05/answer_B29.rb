# a の b 乗を m で割った余りを返す関数
def power(a, b, m)
  p = a
  answer = 1
  (0..59).each do |i|
    wari = 2 ** i
    if (b / wari) % 2 == 1
      answer = (answer * p) % m # a の 2^i 乗が掛けられるとき
    end
    p = (p * p) % m
  end
  answer
end

# 入力
a, b = gets.split.map(&:to_i)

# 出力
puts power(a, b, 1_000_000_007)
