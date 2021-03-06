defmodule CEnum do
  # Returns true if fun.(element) is truthy for all elements in enumerable.
  # all?(fun \\ fn x -> x end, enumerable)
  def all?(_, []), do: true
  def all?(fun, [head | tail]) do
    if fun.(head) do
      all?(fun, tail)
    else
      false
    end
  end

  def each(_, []), do: :ok
  def each(fun, [head | tail]) do
    fun.(head)
    each(fun, tail)
  end

  def filter(_, []), do: []
  def filter(fun, [head | tail]) do
    if fun.(head) do
      [head | filter(fun, tail)]
    else
      filter(fun, tail)
    end
  end

  def flatten(list), do: _flatten(list, [])


  defp _flatten([h | t], tail) when is_list(h) do
    _flatten(h, _flatten(t, tail))
  end
  defp _flatten([h | t], tail) do
    [h, _flatten(t, tail)]
  end
  defp _flatten([], tail) do
    tail
  end




  # split(t(), integer()) :: {list(), list()}
  def split(list, count) do
    split_list(list, count, [])
  end

  defp split_list([head | tail], count, acc) when count > 0 do
    split_list(tail, count - 1, [head | acc])
  end
  defp split_list(list, 0, acc), do: {:lists.reverse(acc), list}
  defp split_list([], _, acc), do: {:lists.reverse(acc), []}


  def take(0, _), do: []
  def take(n, [head | tail]) when n > 0 do
     [head | take(n-1, tail)]
  end
  def take(n, list) when n < 0 do
    reverseTake(n, Enum.reverse(list))
  end
  defp reverseTake(0, _), do: []
  defp reverseTake(n, [last | rest]) do
    [last | reverseTake(n+1, rest)]
  end
end
