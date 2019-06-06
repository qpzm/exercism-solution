defmodule Bob do
  def hey(input) do
    cond do
      word?(input) and question?(input) -> "Calm down, I know what I'm doing!"
      question?(input) -> "Sure."
      blank?(input) -> "Fine. Be that way!"
      word?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp question?(input) do
    String.match?(input, ~r/\?\z/)
  end

  defp blank?(input) do
    String.match?(input, ~r/\A\s*\z/)
  end

  defp blank?(input) do
    String.match?(input, ~r/\A\s*\z/)
  end

  defp word?(input) do
    not num?(input) and upcase?(input)
  end

  defp upcase?(input) do
    input == String.upcase(input)
  end

  defp num?(input) do
    String.match?(input, ~r/\A[\d,?\s]+\z/)
  end
end
