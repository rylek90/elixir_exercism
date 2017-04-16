defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) do
    list
    |> flatten([])
    |> Enum.filter(&(&1 != nil))
  end

  def flatten([], acc), do: acc
  def flatten([head | tail], acc), do: flatten(head, flatten(tail, acc))
  def flatten(elem, acc), do: [elem | acc]
end
