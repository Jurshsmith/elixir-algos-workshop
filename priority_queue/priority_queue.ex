defmodule Algo.PriorityQueue do
  def transform_list_to_max_heap(list) when is_list(list) do
    # this should create a map structure that that has
  end

  def transform_list_to_min_heap do
  end
end

# mix helps our when trying to break modules into files
# Could also use the Code module to Code.require_file an elixir script file (.exs)
defmodule Algo.PriorityQueue.Consumer do
  def consume do
    [1, 2, 3, 4, 5, 5]
    |> Algo.PriorityQueue.transform_list_to_max_heap
    |> Enum.each(&(IO.puts(&1)))

    # using the arity will not allow an enum to pass to the function since function params are also enumerable
  end
end

Algo.PriorityQueue.Consumer.consume()
