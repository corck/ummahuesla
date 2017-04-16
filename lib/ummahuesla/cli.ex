defmodule Ummahuesla.CLI do

  def run do
    %{}
    |> get_name
    |> get_email
    |> Ummahuesla.TeamQuestions.get_team
    |> get_team_name
    |> Ummahuesla.TeamQuestions.enough_work_for
    |> get_project_desc
    |> get_searching_for
    |> get_gender
    #|> get_tshirt_size
    |> Ummahuesla.FormsInteractor.submit
    #|> IO.inspect
  end

  defp get_name(answers) do
    ask_question(answers, :name, "Whats your name")
  end

  defp get_tshirt_size(answers) do
    ask_question(answers, :tshirt, "Whats your t-shirt size(s)")
  end

  defp get_email(answers) do
    ask_question(answers, :email, "Whats your contact email")
  end

  defp get_team_name(answers) do
    ask_question(answers, :team_name, "Whats your team name")
  end

  defp get_project_desc(answers) do
    ask_question(answers, :project, "We are going to umma hüsla this project")
  end

  defp get_searching_for(answers) do
    alist = ["hardware", "ideas", "love"]

    IO.puts "We are going to umma hüsla a project and searching for?"
    options_question(alist)

    input = IO.gets "[1,2,3]" <> "\n"
    answer_value = save_answer(alist, cast_input(input))
    Map.put(answers, :searching_for, answer_value)
  end

  defp get_gender(answers) do
    alist = ["Girl", "Dude", "neither & nor"]

    IO.puts "What's your gender?"
    options_question(alist)

    input = IO.gets "[1,2,3]" <> "\n"
    answer_value = save_answer(alist, cast_input(input))
    Map.put(answers, :gender, answer_value)
  end

  defp ask_question(answers, key, question) do
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

  defp options_question(list) do
    list
      |> Enum.with_index
      |> Enum.each(fn({x, i}) ->
        IO.puts("#{i+1}) #{x}")
      end)
    IO.puts ""
  end

  defp cast_input(input) do
    input
    |> String.trim
    |> String.to_integer
  end
end
