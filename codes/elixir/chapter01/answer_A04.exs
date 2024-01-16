import Bitwise

n = String.trim(IO.gets("")) |> String.to_integer

Enum.each(9..0, fn x ->
  wari = 1 <<< x
  IO.write(rem(div(n, wari), 2))
end)

IO.puts("")
