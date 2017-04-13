defmodule Ummahuesla.CLI do

  def run do
    %{}
    |> get_name
    #|> get_email
    # |> get_team_name
    |> get_team
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

  defp get_team(answers) do
    question = '''
      Team
      1) still searching for a team
      2) overrated. Me is the only team I want
      3) already have one

    '''
    q = "hugo"

    IO.puts question
    input = IO.gets "[1,2,3]" <> "\n"
    answer = parse_team(String.to_integer(String.trim(input)))
    Map.put(answers, :team, answer)
  end

  defp parse_team(n) when n < 4 do
    team_answer(n)
  end

  defp parse_team(n) do
    IO.puts ""
    answer = IO.gets "Please answer with '1', '2' or '3'" <> "\n"
    parse_team(String.to_integer(String.trim(answer)))
  end

  defp team_answer(n) do
    answers = ["still searching for a team",
    "overrated. Me is the only team I want",
    "already. have. one."]
    Enum.at(answers, n-1)
  end

  defp ask_question(answers, key, question) do
    IO.puts ""
    name = IO.gets question <> "\n"
    Map.put(answers, key, String.trim(name))
  end
end
