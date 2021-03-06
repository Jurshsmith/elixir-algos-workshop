defmodule Algo.RecursiveFactorial do
  # avoid using new macros as guards (even at all). Don't use macros
  defmacro is_valid_factorial_input(number) do
    quote do
      # syntactic sugar won't work in macro's definitions, use pure macros instead (that's why |> didn't work here)
      is_integer(unquote(number)) and
        unquote(number) >
          0
    end
  end

  # better way to define custom guard
  defguard is_valid_factorial_input_guard(number) when is_integer(number) and number > 0

  def factorial(0), do: 1

  def factorial(number) when is_valid_factorial_input_guard(number) do
    number * factorial(number - 1)
  end

  def factorial(_), do: "Invalid Input. Use positive integers only!"

  def of(0), do: 1
  def of(n), do: of(n, 1)
  def of(1, acc), do: acc
  def of(n, acc) when n > 1 do
    # Tail call optimized
    # because recursion is the
    # last calculation
    of(n - 1, acc * n)
  end
end

defmodule Algo.RecursiveFactorial.Consumer do
  def consume(number) do
    # Not tail optimized
    number
    |> Algo.RecursiveFactorial.factorial
    |> IO.puts

    # Tail optimized
    number
    |> Algo.RecursiveFactorial.of
    |> IO.puts

    # Function Stack chaining. The last on the chain starts the stack, and obviously the first on the chain gets
    # evaluated first in the common LIFO DS
    # Could have been IO.puts/2 too
  end
end

Algo.RecursiveFactorial.Consumer.consume(0)
Algo.RecursiveFactorial.Consumer.consume(1)
Algo.RecursiveFactorial.Consumer.consume(20)
Algo.RecursiveFactorial.Consumer.consume(2.4)
