defmodule Bob do
  def hey(input) do
    cond do
      shout?(input) and question?(input) -> "Calm down, I know what I'm doing!"
      question?(input) -> "Sure."
      blank?(input) -> "Fine. Be that way!"
      shout?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp question?(input) do
    String.ends_with?(input, "?")
  end

  defp blank?(input) do
    String.trim(input) == ""
  end

  defp shout?(input) do
    word?(input) and upcase?(input)
  end

  defp word?(input) do
    String.upcase(input) != String.downcase(input)
  end

  defp upcase?(input) do
    String.upcase(input) == input
  end
end
