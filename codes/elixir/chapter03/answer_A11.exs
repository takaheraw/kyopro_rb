defmodule BinarySearch do
  def binary_search(arr, target) do
    binary_search(arr, target, 0, length(arr) - 1)
  end

  defp binary_search(arr, target, low, high) do
    if low <= high do
      mid = div(low + high, 2)
      case compare(Enum.at(arr, mid), target) do
        :eq -> mid
        :lt -> binary_search(arr, target, mid + 1, high)
        :gt -> binary_search(arr, target, low, mid - 1)
      end
    else
      :not_found
    end
  end

  defp compare(a, b) do
    cond do
      a == b -> :eq
      a < b  -> :lt
      true   -> :gt
    end
  end
end

target = 5
sorted_array = [1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 9]
index = BinarySearch.binary_search(sorted_array, target)

IO.puts(index)
