# 入力
Q = gets.chomp.to_i # クエリ数
queries = Array.new(Q) { gets.chomp.split } # クエリの情報（各要素は ["1", 題名を表す文字列] or ["2"] or ["3"]）

# クエリの処理
S = Array.new
queries.each do |q|
  if q[0] == "1"
    S.push(q[1])
  elsif q[0] == "2"
    puts S[-1]
  elsif q[0] == "3"
    S.pop
  end
end
