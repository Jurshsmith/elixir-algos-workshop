
defmodule Algo.AllPossiblePalindromes do
  # When thinking about pattern match, it's like reading a statement in reverse and destructuring
  def find_all_possiblePalindromes(<<string_to_check::binary>>)  do

   string_to_check
  end

  def find_all_possiblePalindromes(_), do: "Invalid type"
end

defmodule Algo.AllPossiblePalindromes.Consumer do
  def consume do
    "aabcaacdadsaewawt"
    |> Algo.AllPossiblePalindromes.find_all_possiblePalindromes
    |> IO.puts
  end
end

Algo.AllPossiblePalindromes.Consumer.consume()
