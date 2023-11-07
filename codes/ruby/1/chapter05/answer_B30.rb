# a の b 乗を m で割った余りを返す関数
def power(a, b, m)
  p = a
  answer = 1
  (0..29).each do |i|
    wari = 2 ** i
    if (b / wari) % 2 == 1
      answer = (answer * p) % m # a の 2^i 乗が掛けられるとき
    end
    p = (p * p) % m
  end
  answer
end

# a÷b を m で割った余りを返す関数
def division(a, b, m)
  (a * power(b, m - 2, m)) % m
end

# nCr mod 1000000007 を返す関数
def ncr(n, r)
  m = 1_000_000_007

  # 手順 1: 分子 a を求める
  a = 1
  (1..n).each do |i|
    a = (a * i) % m
  end

  # 手順 2: 分母 b を求める
  b = 1
  (1..r).each do |i|
    b = (b * i) % m
  end
  (1..n - r).each do |i|
    b = (b * i) % m
  end

  # 手順 3: 答えを求める
  division(a, b, m)
end

# 入力
h, w = gets.split.map(&:to_i)

# 出力
puts ncr(h + w - 2, w - 1)
