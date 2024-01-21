defmodule Gcd do
  defmodule Math do
    def gcd(a, b) when a >= 1 and b >= 1, do: gcd(a, b, min(a, b))

    defp gcd(a, _b, 0), do: a
    defp gcd(a, b, min) when rem(a, min) == 0 and rem(b, min) == 0, do: min
    defp gcd(a, b, min), do: gcd(a, b, min - 1)
  end
end

a = String.trim(IO.gets("")) |> String.to_integer
b = String.trim(IO.gets("")) |> String.to_integer
IO.puts(Gcd.Math.gcd(a, b))
