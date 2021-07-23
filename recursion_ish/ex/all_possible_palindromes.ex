defmodule Algo.AllPossiblePalindromes do
  # keep temporary state with recursion
  def find_all_possible_palindromes(<<string_to_check::binary>>) do
    string_to_check
    |> find_all_possible_palindromes([], generate_string_length_queue(string_to_check), 1, string_to_check)
  end

  def find_all_possible_palindromes(_, palindrome_list, [], _, _) do
    palindrome_list
  end

  # When thinking about pattern match, it's like reading a statement in reverse and destructuring
  def find_all_possible_palindromes(<<string_to_check::binary>>, palindrome_list, string_length_queue, count, <<initial_string::binary>>) do
    # if string is a palindrome, add to the list
    # no access to shared memory (or process for this task), so use recursion to keep state
    # tenary sort of
    # prepending to the list here.
    palindrome_list = if is_palindrome(string_to_check), do: [ string_to_check | palindrome_list ], else: palindrome_list

    # pattern matching to get head, front of the string length queue
    [head | tail] = string_length_queue

    if count == head do
      initial_string = initial_string
      |> String.slice(1..String.length(initial_string) - 1)

      initial_string
      |> find_all_possible_palindromes(palindrome_list, tail, 1, initial_string)
    else
      count = count + 1

      string_to_check
      |> String.slice(0..String.length(string_to_check) - 2)
      |> find_all_possible_palindromes(palindrome_list, string_length_queue, count, initial_string)
    end

  end

  def find_all_possible_palindromes(_), do: "Invalid type"

  def is_palindrome(<<string_to_check::binary>>) do
    String.length(string_to_check) > 1 and string_to_check == String.reverse(string_to_check)
  end

  def generate_string_length_queue(<<string_to_check::binary>>) do
    max_length = String.length(string_to_check)
    min_length = 1
    max_length..min_length
    |> Enum.to_list
  end
end

defmodule Algo.AllPossiblePalindromes.Consumer do
  def consume(str) do
    str
    |> Algo.AllPossiblePalindromes.find_all_possible_palindromes
    |> IO.inspect
  end
end

Algo.AllPossiblePalindromes.Consumer.consume("aabcaacdadsaewawtt")

Algo.AllPossiblePalindromes.Consumer.consume("DennisNellEdnaLeonNedraAnitaRolfNoraAliceCarolLeoJaneReedDenaDaleBasilRaePennyLanaDaveDennyLenaIda")
