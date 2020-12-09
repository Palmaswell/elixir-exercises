defmodule MyList do
  def mapsum(_, [], val), do: val
  def mapsum(func, [head | tail], val \\ 0) do
     mapsum(func, tail, func.(head) + val)
  end

  def maxVal([], val \\ 0), do: val
  def maxVal([head | tail], val) when head > val do
    maxVal(tail, head)
  end
  def maxVal([head | tail], val) when head < val do
    maxVal(tail, val)
  end
end
