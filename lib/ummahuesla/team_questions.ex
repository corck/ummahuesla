defmodule Ummahuesla.TeamQuestions do

  def get_team(answers) do
    question = '''
      Team
      1) still searching for a team
      2) overrated. Me is the only team I want
      3) already have one

    '''
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

end
