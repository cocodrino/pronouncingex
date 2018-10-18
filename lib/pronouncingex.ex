defmodule Pronouncingex do
  @moduledoc """
  Documentation for Pronouncingex.
  """

  def pronounce(w, phonetic \\ :simplified)

  def pronounce(w, :arpabet) do
    is_a_word = w |> String.split(" ") |> Enum.count

    cond do
      is_a_word > 1 -> "you can get only the arpabet pronunciation for a word, phrases are not allowed"
      true -> Pronunciadata.get_arpabet_phonetic(w)
    end
  end

  def pronounce(words, phonetic) do
    words
    |> String.split(" ")
    |> Enum.reject(fn w -> w == "" end) #remove possible whitespaces
    |>Enum.map(fn w ->
        spell_word = Pronunciadata.get_arpabet_phonetic(w)
        if !spell_word do
          w
        else
          spell_word |> Pronunciadata.arpabet_to(phonetic)
        end

    end)
    |> Enum.join(" ")

  end

  def hello do
    :world
  end
end
