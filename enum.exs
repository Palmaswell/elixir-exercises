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

  def filter(_, []), do: []
  def filter(fun, [head | tail]) do
    if fun.(head) do
      [head | filter(fun, tail)]
    else
      filter(fun, tail)
    end
  end

  def each(_, []), do: :ok
  def each(fun, [head | tail]) do
    fun.(head)
    each(fun, tail)
  end

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
