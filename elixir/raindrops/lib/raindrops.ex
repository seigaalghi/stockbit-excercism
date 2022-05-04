defmodule Raindrops do
  @sound %{
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  def rain_sound(acc, number, factor) do
    if rem(number, factor) == 0 do
      acc <> @sound[factor]
    else
      acc
    end
  end
  def non_rain_sound(acc, number) do
    if acc == "" do
      Integer.to_string(number)
    else
      acc
    end
  end
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
      ""
      |> rain_sound(number, 3)
      |> rain_sound(number, 5)
      |> rain_sound(number, 7)
      |> non_rain_sound(number)
  end
end
