# 入力
Q = gets.chomp.to_i # クエリ数
queries = Array.new(Q) { gets.chomp.split } # クエリの情報（各要素は ["1", 名前を表す文字列, 得点を表す文字列] or ["2", 名前を表す文字列]）

# クエリの処理
Map = Hash.new
queries.each do |q|
  if q[0] == "1"
    Map[q[1]] = q[2]
  elsif q[0] == "2"
    puts Map[q[1]]
  end
end
