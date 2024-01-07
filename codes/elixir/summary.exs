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

IO.puts "クイックソート"
array_to_sort = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
sorted_array = QuickSort.sort(array_to_sort)
Enum.each(sorted_array, fn(s) -> IO.puts(s) end)
