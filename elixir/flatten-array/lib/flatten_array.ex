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
    extract(list)
  end
  def extract([first | rest]), do: extract(first) ++ extract(rest)
  def extract(x) do
    cond do
      x == nil -> []
      x == [] -> []
      true -> [x]
    end
  end
end
