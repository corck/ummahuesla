defmodule Ummahuesla.QuestionFormatter do
  def ask_option_question(list, question) do
    IO.puts "\n"
    IO.puts question
    IO.puts ""
    options_question(list)

    input = IO.gets format_list_options(list) <> "\n"
    save_answer(list, Integer.parse(String.trim(input)))
  end

  defp options_question(list) do
    list
    |> Enum.with_index
    |> Enum.each(fn({x, i}) ->
      IO.puts("#{i+1}) #{x}")
    end)
    IO.puts("")
  end

  defp format_list_options(list) do
    l = list |> length
    str = Enum.join(1..l, ", ")
    "[" <> str <> "]"
  end

  def ask_question(answers, key, question) do
    IO.puts ""
    name = IO.gets question <> "\n"
    Map.put(answers, key, String.trim(name))
  end

  defp save_answer(list, {n, _}) when n <= length(list) do
    Enum.at(list, n - 1)
  end

  defp save_answer(list, _) do
    n = length(list)
    IO.puts ""
    answer = IO.gets "Please answer with #{Enum.join(1..(n-2), ", ")} or #{length(list)}" <> "\n"
    save_answer(list, Integer.parse(String.trim(answer)))
  end
end
