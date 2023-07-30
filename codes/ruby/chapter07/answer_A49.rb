class Round
  def initialize(p, q, r)
    @p, @q, @r = p, q, r
  end

  attr_reader :p, :q, :r
end

class State
  def initialize(n)
    @score = 0
    @x = Array.new(n, 0)
    @lastmove = '?'
    @lastpos = -1
  end

  attr_accessor :score, :x, :lastmove, :lastpos
end

def beam_search(n, t, rounds)
  width = 10000
  beam = Array.new(t + 1) { [] }
  beam[0].push(State.new(n))

  t.times do |i|
    candidate = []
    beam[i].each do |j|
      sousa_a = j.dup
      sousa_a.lastmove = 'A'
      sousa_a.lastpos = i
      sousa_a.x[rounds[i].p] += 1
      sousa_a.x[rounds[i].q] += 1
      sousa_a.x[rounds[i].r] += 1
      sousa_a.score += sousa_a.x.count(0)

      sousa_b = j.dup
      sousa_b.lastmove = 'B'
      sousa_b.lastpos = i
      sousa_b.x[rounds[i].p] -= 1
      sousa_b.x[rounds[i].q] -= 1
      sousa_b.x[rounds[i].r] -= 1
      sousa_b.score += sousa_b.x.count(0)

      candidate.push(sousa_a, sousa_b)
    end

    candidate.sort_by! { |s| -s.score }
    beam[i + 1] = candidate[0...width].map(&:dup)
  end

  current_place = 0
  answer = Array.new(t)
  (t.downto(1)).each do |i|
    answer[i - 1] = beam[i][current_place].lastmove
    current_place = beam[i][current_place].lastpos
  end
  answer
end

t = gets.to_i
rounds = Array.new(t) { Round.new(*gets.split.map { |e| e.to_i - 1 }) }
answer = beam_search(20, t, rounds)
answer.each { |c| puts c }
