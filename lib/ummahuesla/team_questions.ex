defmodule Ummahuesla.TeamQuestions do

  def get_team(answers) do
    question = '''

    Do you have a team?
      1) still searching for a team
      2) overrated. Me is the only team I want
      3) already have one
    '''
    IO.puts question

    input = IO.gets "[1,2,3]" <> "\n"
    answer = parse_team(String.to_integer(String.trim(input)))
    Map.put(answers, :team, answer)
  end

  def enough_work_for(answers) do
    question = '''

    There is enough work in my team for
    (be great an let others be part of your team)

      1) 1
      2) 2
      3) 3
      4) 4
      5) 5
      6) the exact number of dudes the team has already
    '''
    IO.puts question

    input = IO.gets "[1,2,3,4,5,6]" <> "\n"
    answer = parse_work_for(String.to_integer(String.trim(input)))
    Map.put(answers, :work_for, answer)
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

  defp parse_work_for(n) when n < 6, do: n

  defp parse_work_for(6), do: "the exact number of dudes the team has already"

  defp parse_work_for(_) do
    IO.puts ""
    answer = IO.gets "Please answer with one of 1-6" <> "\n"
    parse_work_for(String.to_integer(String.trim(answer)))
  end
end
