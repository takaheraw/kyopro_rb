# 入力
Q = gets.chomp.to_i # クエリ数
queries = Array.new(Q) { gets.chomp.split } # クエリの情報（各要素は ["1", 名前を表す文字列] or ["2"] or ["3"]）

# クエリの処理
T = Array.new
queries.each do |q|
  if q[0] == "1"
    T.push(q[1])
  elsif q[0] == "2"
    puts T[0]
  elsif q[0] == "3"
    T.shift
  end
end
