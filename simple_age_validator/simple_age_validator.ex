defmodule Algo.SimpleAgeValidator do
  def get_age_bracket(age_value) when is_number(age_value) do
    # Case with pattern matching
    # With statement with a use case of nested conditionals. With statement gives a perfect control flow in that situation.
    case age_value do
      x when x >= 0 and x <= 12 -> :kid
      x when x > 12 and x <= 21 -> :teen
      x when x > 21 and x <= 60 -> :adult
      x when x > 60 -> :old
      _ -> "Not in any age bracket"
    end
  end

  def get_age_bracket(_) do
    throw({ :error, "Invalid Type" })
  end
end

defmodule Algo.SimpleAgeValidator.Consumer do
  import Algo.SimpleAgeValidator

  def simulate_age() do
    # Use lists [] for large iterables
    # Use tuples {} for small data set that are related
    # Use map %{} for map use cases

    agesToSimulate = ["cool", 12, 20, 40, 23, 50, 21, 4, 23, 13]

    # this arrangement infers that first param is from the top and second param for .each function is what you passed to it
    try do
      agesToSimulate
      |> Enum.map(&get_age_bracket/1)
      |> Enum.each(&IO.puts/1)
    catch
      { :error, msg } -> IO.puts("Error occured #{msg}")
    end

  end
end

Algo.SimpleAgeValidator.Consumer.simulate_age()
