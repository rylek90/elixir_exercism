defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    list = prepare(sentence)
    Enum.map(list, &({&1, count_single_word(list, &1)}))
    |> Enum.into(%{})
  end

  defp prepare(sentence) do
    String.replace(sentence, ~r/[^\w\s_-]/u, "")
    |> String.split(["_", " "], trim: true)
    |> Enum.map(&(String.downcase(&1)))
  end

  defp count_single_word(list, word) do
    Enum.count(list, &(&1 == word))
  end

end
