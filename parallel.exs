defmodule Parallel do
  def map(collection, func) do
    me = self()
    collection
    |> Enum.map(fn (ele) ->
      spawn_link fn -> send(me, {self(), func.(ele)}) end
    end)
    |> Enum.map(fn (pid )  ->
        receive do
          {^pid,  result} -> result end
      end
    )

  end
end
