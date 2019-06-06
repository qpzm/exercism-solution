defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna('') do
    ''
  end

  def to_rna([head | tail]) do
    to_rna_char(head) ++ to_rna(tail)
  end

  @spec to_rna(char) :: char
  defp to_rna_char(x) do
    case x do
      ?G -> 'C'
      ?C -> 'G'
      ?T -> 'A'
      ?A -> 'U'
      _ -> raise 'Invalid char'
    end
  end
end
