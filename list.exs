defmodule MyList do
  def mapsum(_, [], val \\ 0), do: val
  def mapsum(func, [head | tail], val) do
     mapsum(func, tail, func.(head) + val)
  end

  def maxVal([], val \\ 0), do: val
  def maxVal([head | tail], val) when head > val do
    maxVal(tail, head)
  end
  def maxVal([head | tail], val) when head < val do
    maxVal(tail, val)
  end

  def ceasar([], _), do: []
  def ceasar([head | tail], n) when head+9 <= ?z do
    [head + n | ceasar(tail, n)]
  end
  def ceasar([head | tail], n), do: [head+n-26 | ceasar(tail, n)]

  def span(from, to) when from > to, do: []
  def span(from, to) do
    [from | span(from + 1, to)]
  end
end
