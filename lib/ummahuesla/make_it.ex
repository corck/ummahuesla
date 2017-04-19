defmodule Ummahuesla.MakeIt do
  def get_make_it(answers) do
    word = IO.gets "Please finish the following sentence:\nMAKE IT... (max 8 characters)\n"
    val = do_get_make_it(word, word_length(word))
    Map.put(answers, :sentence, String.trim(val))
  end

  defp do_get_make_it(word, length) when length <= 8 do
    word
  end

  defp do_get_make_it(_word, _length) do
    IO.puts ""
    word = IO.gets "Max of 8 characters please" <> "\n"
    do_get_make_it(word, word_length(word))

  end

  defp word_length(word) do
    word
     |> String.trim
     |> String.length
  end
end
