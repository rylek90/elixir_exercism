defmodule Bob do
  def hey(input) do
    trimmed = input |> String.trim
    cond do
        is_question(trimmed) -> "Sure."
        is_shout(trimmed) -> "Whoa, chill out!"
        is_empty(trimmed) -> "Fine. Be that way!"
        true -> "Whatever."
    end
  end

  defp is_question(str), do: String.ends_with?(str, "?")
  defp is_shout(str), do: String.match?(str,~r/\p{L}/) && String.upcase(str) == str 
  defp is_empty(str), do: str == ""
end
