# 整数の組 (a, b) が決まったときの、参加可能な生徒数を返す関数
def get_score(a, b, a_list, b_list, k)
  cnt = 0
  a_list.size.times do |i|
    if a <= a_list[i] && a_list[i] <= a + k && b <= b_list[i] && b_list[i] <= b + k
      cnt += 1
    end
  end
  cnt
end

# 入力
N, K = gets.chomp.split.map(&:to_i)
A = []
B = []
N.times do
  a, b = gets.chomp.split.map(&:to_i)
  A << a
  B << b
end

# (a, b) の組を全探索
Answer = 0
(1..100).each do |a|
  (1..100).each do |b|
    score = get_score(a, b, A, B, K)
    Answer = [Answer, score].max
  end
end

# 出力
puts Answer
