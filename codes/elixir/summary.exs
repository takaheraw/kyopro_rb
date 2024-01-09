defmodule CumulativeSum do
  def calculate_accumulates(visitors) do
    accumulates = Enum.reduce(visitors, {0, [0]}, fn value, {sum, acc} ->
      new_sum = sum + value
      {new_sum, acc ++ [new_sum]}
    end)
    {_, accumulates} = accumulates
    accumulates
  end

  def query_targets(accumulates, targets) do
    Enum.each(targets, fn [l, r] ->
      result = Enum.at(accumulates, r) - Enum.at(accumulates, l - 1)
      IO.puts(result)
    end)
  end
end

IO.puts("累積和")
visitors = [62, 65, 41, 13, 20, 11, 18, 44, 53, 12, 18, 17, 14, 10, 39]
accumulates = CumulativeSum.calculate_accumulates(visitors)
targets = [[2, 4], [4, 13]]
CumulativeSum.query_targets(accumulates, targets)

defmodule QuickSort do
  def sort([]), do: []

  def sort(list) do
    pivot = Enum.random(list)
    {less, equal, greater} =
      Enum.reduce(list, {[], [], []}, fn x, {less, equal, greater} ->
        cond do
          x < pivot -> {[x | less], equal, greater}
          x == pivot -> {less, [x | equal], greater}
          x > pivot -> {less, equal, [x | greater]}
        end
      end)

    sort(less) ++ equal ++ sort(greater)
  end
end

array_to_sort = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
sorted_array = QuickSort.sort(array_to_sort)
Enum.each(sorted_array, fn(s) -> IO.puts(s) end)

defmodule BinarySearch do
  def search(arr, target) do
    binary_search(arr, target, 0, length(arr) - 1)
  end

  defp binary_search(arr, target, low, high) do
    if low <= high do
      mid = div(low + high, 2)

      case compare(Enum.at(arr, mid), target) do
        :equal   -> mid
        :less    -> binary_search(arr, target, mid + 1, high)
        :greater -> binary_search(arr, target, low, mid - 1)
      end
    end
  end

  defp compare(value, target) do
    cond do
      value == target -> :equal
      value < target  -> :less
      true            -> :greater
    end
  end
end

IO.puts "二分探索"
target = 5
index = BinarySearch.search(sorted_array, target)
IO.puts index

IO.puts "動的計画法"
room_count = 5
pattern1 = [2, 4, 1, 3]
pattern2 = [5, 3, 7]

dp = Enum.reduce(1..room_count, %{}, fn i, acc ->
  case i do
    1 -> Map.put(acc, i, 0)
    2 -> Map.put(acc, i, Enum.at(pattern1, 0))
    _ ->
      dp_i = [acc[i - 1] + Enum.at(pattern1, i - 2), acc[i - 2] + Enum.at(pattern2, i - 3)] |> Enum.min()
      Map.put(acc, i, dp_i)
  end
end)

IO.puts dp[room_count]
