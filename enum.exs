defmodule CEnum do
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
