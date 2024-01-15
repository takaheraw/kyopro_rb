n = String.trim(IO.gets("")) |> String.to_integer
k = String.trim(IO.gets("")) |> String.to_integer

answer = Enum.reduce(1..n, 0, fn x, acc ->
  Enum.reduce(1..n, acc, fn y, acc_inner ->
    z = k - x - y
    if z >= 1 and z <= n do
      acc_inner + 1
    else
      acc_inner
    end
  end)
end)

IO.puts(answer)
