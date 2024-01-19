defmodule DynamicProgramming do
  def main do
    n = String.trim(IO.gets("")) |> String.to_integer
    a = IO.read(:line) |> String.split() |> Enum.map(&String.to_integer/1)
    b = IO.read(:line) |> String.split() |> Enum.map(&String.to_integer/1)

    dp = Enum.reduce(1..n, %{}, fn i, acc ->
      case i do
        1 -> Map.put(acc, i, 0)
        2 -> Map.put(acc, i, Enum.at(a, 0))
        _ ->
          dp_i = [acc[i - 1] + Enum.at(a, i - 2), acc[i - 2] + Enum.at(b, i - 3)] |> Enum.min()
          Map.put(acc, i, dp_i)
      end
    end)

    IO.puts dp[n]
  end
end

DynamicProgramming.main()
