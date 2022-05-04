defmodule RomanNumerals do
  @roman %{
   1000  => "M",
   900   => "CM",
   500   => "D",
   400   => "CD",
   100   => "C",
   90    => "XC",
   50    => "L",
   40    => "XL",
   10    => "X",
   9     => "IX",
   5     => "V",
   4     => "IV",
   1     => "I"
 }
 @keys Map.keys(@roman)

 @doc """
 Convert the number to a roman number.
 """
 @spec numeral(pos_integer) :: String.t()
 def numeral(number) do
   romanize(number)
 end

 defp romanize(number) do
   if number <= 0 do
     ""
   else
     key = get_key(number)
     @roman[key] <> romanize(number - key)
   end
 end

 defp get_key(number) do
   @keys
     |> Enum.filter(fn(key) -> key <= number end)
     |> Enum.max
 end

end
