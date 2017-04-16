defmodule Ummahuesla.QuestionFormatter do
  def ask_option_question(list, question) do
    IO.puts question
    options_question(list)

    input = IO.gets format_list_options(list) <> "\n"
    save_answer(list, cast_input(input))
  end

  defp options_question(list) do
    list
    |> Enum.with_index
    |> Enum.each(fn({x, i}) ->
      IO.puts("#{i+1}) #{x}")
    end)
    IO.puts ""
  end

  defp format_list_options(list) do
    l = list |> length
    str = Enum.join(1..l, ", ")
    "[" <> str <> "]"
  end

  defp cast_input(input) do
    input
    |> String.trim
    |> String.to_integer
  end

  def ask_question(answers, key, question) do
    IO.puts ""
    name = IO.gets question <> "\n"
    Map.put(answers, key, String.trim(name))
  end

  defp save_answer(list, n) when n <= length(list) do
    Enum.at(list, n - 1)
  end

  defp save_answer(list, n) do
    IO.puts ""
    answer = IO.gets "Please answer with #{Enum.join(1..(n-2), ", ")} or #{length(list)}" <> "\n"
    save_answer(list, String.to_integer(String.trim(answer)))
  end
end
