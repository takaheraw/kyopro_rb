ar = IO.read(:line) |> String.split() |> Enum.map(&String.to_integer/1)
x = String.trim(IO.gets("")) |> String.to_integer

answer = Enum.any?(ar, fn(i) -> i == x end)
IO.puts(answer)

if answer do
  IO.puts("Yes")
else
  IO.puts("No")
end
