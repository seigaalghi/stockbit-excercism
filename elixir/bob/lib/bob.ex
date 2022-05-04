defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(phrase) do
    phrase = phrase
      |> String.trim()
    cond do
      silent?(phrase) ->
        "Fine. Be that way!"
      yel?(phrase) && question?(phrase) ->
        "Calm down, I know what I'm doing!"
      yel?(phrase) ->
        "Whoa, chill out!"
      question?(phrase) ->
        "Sure."
      true ->
        "Whatever."
    end
  end

  defp alpha?(phrase), do: String.match?(String.replace(phrase, ~r/@|\$|%|&|\^|:|_|!|,|\./u, ""), ~r/[A-Za-z|А-яЁё]/)
  defp silent?(phrase), do: String.strip(phrase) == ""
  defp question?(phrase), do: String.last(phrase) == "?"
  defp yel?(phrase), do: String.upcase(phrase) == phrase && alpha?(phrase)
end
