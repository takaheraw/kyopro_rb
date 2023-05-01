# 入力
Q = gets.chomp.to_i # クエリ数
queries = Array.new(Q) { gets.chomp.split } # クエリの情報（各要素は ["1", 値段を表す文字列] or ["2"] or ["3"]）

# クエリの処理
T = []
queries.each do |q|
  if q[0] == "1"
    T << q[1].to_i
    T.sort!
  elsif q[0] == "2"
    puts T[0] # ソート済みの配列の最初の要素が最小値
  elsif q[0] == "3"
    T.shift
  end
end
