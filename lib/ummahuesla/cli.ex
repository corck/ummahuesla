defmodule Ummahuesla.CLI do

  def run do
    %{}
    |> get_name
    #|> get_email
    #|> Ummahuesla.TeamQuestions.get_team
    |> Ummahuesla.TeamQuestions.enough_work_for
    |> get_team_name
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


  defp ask_question(answers, key, question) do
    IO.puts ""
    name = IO.gets question <> "\n"
    Map.put(answers, key, String.trim(name))
  end
end
