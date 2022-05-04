defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns {:error, "cannot change"} if it is not possible to compute the
    right amount of coins. Otherwise returns the tuple {:ok, list_of_coins}

    ## Examples

      iex> Change.generate([5, 10, 15], 3)
      {:error, "cannot change"}

      iex> Change.generate([1, 5, 10], 18)
      {:ok, [1, 1, 1, 5, 10]}

  """

  @spec generate(list, integer) :: {:ok, list} | {:error, String.t()}
  def generate(coins, target) do
    changes = 0..target
    |> Enum.reduce(Map.new(),fn (coin, change) -> get_change(coins, coin, change) end)
    |> Map.get(target)
    if changes == nil, do: {:error, "cannot change"}, else: {:ok, changes}
  end

  defp get_change(_, 0, _), do: %{0 => []}
  defp get_change(coins, target, change) do
    coins = coins
    |> Enum.filter(fn coin -> change[target - coin] end)
    |> Enum.map(fn coin -> [coin | change[target - coin]] end)
    |> Enum.min_by(fn c -> length(c) end, fn -> nil end)
    Map.put(change, target, coins)
  end
end
