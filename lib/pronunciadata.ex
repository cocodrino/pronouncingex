defmodule Pronunciadata do
  use Memoize

  #inspired by https://github.com/aparrish/pronouncingjs

  @arfabet_to_IPA %{
    "AA" => "ɑ",
    "AE" => "æ",
    "AH" => "ʌ",
    "AO" => "ɔ",
    "AW" => "aʊ",
    "AY" => "aɪ",
    "B" => "b",
    "CH" => "tʃ",
    "D" => "d",
    "DH" => "ð",
    "EH" => "ɛ",
    "ER" => "ɝ",
    "EY" => "eɪ",
    "F" => "ɾ",
    "G" => "ɡ",
    "HH" => "h",
    "IH" => "ɪ",
    "IY" => "i",
    "JH"=> "dʒ",
    "K" => "k",
    "L" => "l̩",
    "M" => "m̩",
    "N" => "n̩",
    "NG" => "ŋ",
    "OW" => "oʊ",
    "OY" => "ɔɪ",
    "P" => "p",
    "R" => "ɹ",
    "S" => "s",
    "SH" => "ʃ",
    "T" => "t",
    "TH" => "θ",
    "UW" => "u",
    "UH" => "ʊ",
    "V" => "v",
    "W" => "w",
    "Y" => "j",
    "Z" => "z",
    "ZH" => "ʒ"

  }

  @simplify %{
    "AA" => "A",
    "AE" => "a",
    "AH" => "ʌ",
    "AO" => "ao",
    "AW" => "Au",
    "AY" => "ai",
    "B" => "b",
    "CH" => "ch",
    "D" => "d",
    "DH" => "D",
    "EH" => "E",
    "ER" => "or",
    "EY" => "ei",
    "F" => "f",
    "G" => "ɡ",
    "HH" => "J",
    "IH" => "I",
    "IY" => "i",
    "JH"=> "y",
    "K" => "k",
    "L" => "l̩",
    "M" => "m̩",
    "N" => "n̩",
    "NG" => "n",
    "OW" => "Ou",
    "OY" => "Oy",
    "P" => "p",
    "R" => "r",
    "S" => "s",
    "SH" => "ʃ",
    "T" => "t",
    "TH" => "tt",
    "UW" => "U",
    "UH" => "Uu",
    "V" => "v",
    "W" => "w",
    "Y" => "y",
    "Z" => "z",
    "ZH" => "zz"

  }



  def arpabet_to(arpabet_string, sound \\ :simplified) do
    sound_map = if sound==:ipa do @arfabet_to_IPA else @simplify end
    arpabet_string
    |> String.split(" ")
    |> Enum.map(fn w -> Regex.replace(~r/\d/, w, "") end)
    |> Enum.map(fn w -> sound_map[w] end)
    |> Enum.join()
  end

  def get_arpabet_phonetic(word) do
    dictionary = parseCMU()
    dictionary[word]
  end



  defmemo parseCMU do
    File.stream!(to_string(:code.priv_dir(:pronouncingex))<>"/cmudict-0.7b.txt")
    |> Stream.filter(fn(line) ->  String.length(line)>0 && !Regex.match?(~r/^;/,line)  end)
    |> Stream.map(fn(line)->
      [word|phones] = String.split(line," ")
      {String.replace(word,~r/\W/,"")|> String.downcase(), phones |>Enum.join( " ") |> String.replace("\n","") |> String.trim}
    end)
    |> Enum.into(%{})
  end
end
#c("lib/pronunciadata.ex")
