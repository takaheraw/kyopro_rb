defmodule Prime do
  def is_prime(n) do
    limit = :math.sqrt(n) |> round() |> :erlang.trunc()
    Enum.all?(2..limit, fn i -> rem(n, i) != 0 end)
  end
end

n = String.trim(IO.gets("")) |> String.to_integer
IO.puts Prime.is_prime(n)
