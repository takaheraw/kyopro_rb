# 整数の組 (a, b) が決まったときの、参加可能な生徒数を返す関数
def get_score(a, b, a_arr, b_arr, k)
  cnt = 0
  a_arr.each_with_index do |value, index|
    if a <= value && value <= a + k && b <= b_arr[index] && b_arr[index] <= b + k
      cnt += 1
    end
  end
  return cnt
end

# 入力
n, k = gets.split.map(&:to_i)
a = []
b = []
n.times do
  a_val, b_val = gets.split.map(&:to_i)
  a << a_val
  b << b_val
end

# (a, b) の組を全探索
answer = 0
(1..100).each do |a_val|
  (1..100).each do |b_val|
    score = get_score(a_val, b_val, a, b, k)
    answer = [answer, score].max
  end
end

# 出力
puts answer
