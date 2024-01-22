n = IO.read(:stdio, :line) |> String.trim() |> String.to_integer()

count_div_by_3 = div(n, 3)
count_div_by_5 = div(n, 5)
count_div_by_15 = div(n, 15)

result = count_div_by_3 + count_div_by_5 - count_div_by_15
IO.puts(result)
