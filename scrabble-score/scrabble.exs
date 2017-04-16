defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    String.upcase(word)
    |> String.to_charlist
    |> Enum.map(&(get_score(&1)))
    |> Enum.sum
  end

  def get_score(char) do
    cond do
      Enum.member?('AEIOULNRST', char) -> 1
      Enum.member?('DG', char) -> 2
      Enum.member?('BCMP',char) -> 3
      Enum.member?('FHVWY',char) -> 4
      Enum.member?('K',char) -> 5
      Enum.member?('JX',char) -> 8
      Enum.member?('QZ',char) -> 10
      true -> 0
    end
  end
end
