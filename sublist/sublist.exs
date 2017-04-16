defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(left, right) when left == right, do: :equal
  def compare(left, right) do
    cond do
      is_sublist?(left, right) -> :sublist
      is_sublist?(right, left) -> :superlist
      true -> :unequal
    end
  end

  defp is_sublist?([], _), do: true
  defp is_sublist?(value, value), do: true
  defp is_sublist?(_, []), do: false
  defp is_sublist?(left, right) when length(left) > length(right), do: false
  defp is_sublist?([head | left_tail], [head | right_tail]) do
    is_sublist?(left_tail, right_tail)
  end

  defp is_sublist?(left, [right_head | right_tail]), do: is_sublist?(left, right_tail)
  defp is_sublist?(_, _), do: false
end
