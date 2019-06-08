defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sanitize(sentence) |> count_occurrence()
  end

  defp sanitize(sentence) do
    ignore = ~r/[!&@$%^&:]/
    String.replace(sentence, ignore, "")
    |> String.downcase()
    |> String.splitter([" ", "_", ", "], trim: true)
  end

  defp count_occurrence(enum) do
    Enum.reduce(enum, %{}, &count_iter/2)
  end

  defp count_iter(x, acc) do
    Map.update(acc, x, 1, &(&1 + 1))
  end
end
