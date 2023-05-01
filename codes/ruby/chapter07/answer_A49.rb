# 1 回の操作 (P[i], Q[i], R[i]) を表す構造体
class Round
  attr_accessor :p, :q, :r

  def initialize(p, q, r)
    @p = p
    @q = q
    @r = r
  end
end

# 盤面の状態を表す構造体
class State
  attr_accessor :score, :x, :lastmove, :lastpos

  # 盤面の状態の初期化
  def initialize(n)
    @score = 0        # 暫定スコア
    @x = Array.new(n, 0) # 現在の配列 X の値
    @lastmove = '?'   # 最後の動き（'A' または 'B'、ただし初期状態では '?' としておく）
    @lastpos = -1     # Beam[i-1][どこ] から遷移したか（ただし初期状態では -1 としておく）
  end
end

# ビームサーチを行う関数
def beam_search(n, t, rounds)
  # 2 次元配列 beam を用意し、0 手目の状態を設定
  width = 10000
  beam = Array.new(t + 1) { [] }
  beam[0].append(State.new(n))

  # ビームサーチ
  (0...t).each do |i|
    candidate = []
    beam[i].each_with_index do |elem, j|
      # 操作 A の場合
      sousa_a = Marshal.load(Marshal.dump(elem))
      sousa_a.lastmove = 'A'
      sousa_a.lastpos = j
      sousa_a.x[rounds[i].p] += 1
      sousa_a.x[rounds[i].q] += 1
      sousa_a.x[rounds[i].r] += 1
      sousa_a.score += sousa_a.x.count(0) # スコアに「sousa_a.x に含まれる 0 の個数」を加算
      # 操作 B の場合
      sousa_b = Marshal.load(Marshal.dump(elem))
      sousa_b.lastmove = 'B'
      sousa_b.lastpos = j
      sousa_b.x[rounds[i].p] -= 1
      sousa_b.x[rounds[i].q] -= 1
      sousa_b.x[rounds[i].r] -= 1
      sousa_b.score += sousa_b.x.count(0) # スコアに「sousa_b.x に含まれる 0 の個数」を加算
      # 候補に追加
      candidate.append(sousa_a)
      candidate.append(sousa_b)
    end
    # ソートして beam[i+1] の結果を計算する
    candidate.sort! { |a, b| b.score <=> a.score }
    beam[i + 1] = candidate[0...width] # 多くとも candidate の上位 width 件しか記録しない
  end

  # ビームサーチの復元
  current_place = 0
  answer = Array.new(t)
  t.downto(1) do |i|
    answer[i - 1] = beam[i][current_place].lastmove
    current_place = beam[i][current_place].lastpos
  end
  answer
end

# 入力
t = gets.to_i
rounds = Array.new(t)
t.times do |i|
  p, q, r = gets.split.map(&:to_i)
  rounds[i] = Round.new(p - 1, q - 1, r - 1) # 書籍とは異なり、ここでは 0-indexed にするために 1 を引いています
end

# ビームサーチを行って答えを出す（書籍とは異なり、ビームサーチの復元は関数の中で行う）
answer = beam_search(20, t, rounds)

# 出力
answer.each do |c|
  puts c
end
