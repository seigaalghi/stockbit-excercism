defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    words = String.downcase(sentence)
    |> String.replace(~r/@|\$|%|&|\^|:|_|!|,|\./u, " ")
    |> String.split()
    Enum.reduce(words, Map.new, fn(word, map)->
      word = String.trim(word, "'")
      if Map.has_key?(map, word) do
        Map.replace(map, word, map[word] + 1)
      else
        Map.put(map, word, 1)
      end
    end)
  end
end
